node default {

class { 'docker':
  use_upstream_package_source => false,
  version => '17.09.0~ce-0~debian',
}

docker::image { 'nginx:latest': }

docker::run { 'nginx':
    image   => 'nginx:latest',
    ports   => ['3306:6606']
}


}
