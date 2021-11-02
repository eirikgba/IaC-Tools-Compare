# docker

Simple docker puppet module

## Example of use

	include docker

	docker::image { 'nginx':
    	ensure      => 'present',
    	tagImage    => 'latest'
	}

	docker::run { 'nginx':
    	ensure          => 'absent',
    	containerName   => 'teste01'
	}
