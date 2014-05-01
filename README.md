# Description

A ‘log forwarder’ typically is installed on every node to receive local events.
Once an event is received, they forward it to the ‘log aggregators’ through the network.

# Components

* fluentd: https://github.com/fluent/fluentd

# Requirement

* Ruby

# Installation

## Local

    git clone https://github.com/fernandoalmeida/fluentd-forwarder.git
    sudo -i
    bundle install
    bundle exec fluentd -c conf/fluent.rb --daemon -vv

## Vagrant VirtualBox VM

    git clone https://github.com/fernandoalmeida/fluentd-forwarder.git
    git submodules init
    git submodules update
    vagrant up

    vagrant ssh
    cd ~/fluentd-forwarder
    sudo -i
    bundle install
    bundle exec fluentd -c conf/fluent.rb --daemon

### Test

    logger "test" # and check the aggregator server
