class docker::image {
	
	exec { 'pull nginx':
		user => 'root',
		command => '/usr/bin/docker pull nginx',

}
