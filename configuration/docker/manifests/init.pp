class docker {

	class { 'docker::install': }
	class { 'docker::run': }
}
