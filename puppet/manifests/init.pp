Exec {
  path => $path,
}

class {"rbenv-ruby":
  user    => "root",
  version => "2.0.0-p247",
  install_dir => "/root"
}
