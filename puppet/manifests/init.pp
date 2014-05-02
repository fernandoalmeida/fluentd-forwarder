Exec {
  path => $path,
}

class {"rbenv-ruby":
  user    => "vagrant",
  version => "2.0.0-p247"
}
