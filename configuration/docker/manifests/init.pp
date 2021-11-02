class docker {

	class { 'docker::install': }
#	class { 'docker::image': }
	class { 'docker::run': }
}
