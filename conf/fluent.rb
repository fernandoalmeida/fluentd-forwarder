# Syslog
source {
  type :tail
  path '/var/log/syslog'
  pos_file File.expand_path("../../var/pos/syslog.pos", __FILE__)
  tag 'syslog'
  format :syslog
}

# Log Forwarding
match('**') {
  type :forward

  # primary host
  server {
    host ENV['TCP_HOST'] || 'fluentd-aggregator'
    port ENV['TCP_PORT'] || '24224'
  }

  # use longer flush_interval to reduce CPU usage.
  # note that this is a trade-off against latency.
  flush_interval ENV['INTERVAL'] || '5s'
}
