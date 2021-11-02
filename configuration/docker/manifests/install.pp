class docker::install {
	
	exec { 'apt-get update':
		user => 'root',
		command => '/usr/bin/apt-get update',		
	}

	exec { 'apt update':
                user => 'root',
                command => '/usr/bin/apt update',
        }

	exec { 'apt-get install docker-ce':
                user => 'root',
                command => '/usr/bin/apt-get install docker-ce docker-ce-cli containerd.io',
	}

	exec { 'curl docker':
                user => 'root',
		command => '/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg',
	}	
	
	exec { 'echo docker':
                user => 'root',
		command => '/usr/bin/echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null',
	}

	exec { 'apt install docker.io':
                user => 'root',
		command => '/usr/bin/apt install docker.io',
        }

	exec { 'apt install tree':
		user => 'root',
		command => '/usr/bin/apt install tree',
	}


#	exec { 'apt-get install docker-cd docker-ce-cli containerd.io':
#		user => 'root',
#		command => '/usr/bin/apt-get install docker-ce docker-ce-cli containerd.io',
#		command => '/usr/bin/apt-get install ca-certificates curl gnupg lsb-release',
#	}
#
#	exec { 'curl docker':
#		user => 'root',	
#                command => '/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg',
#	}
#
#

#	exec { 'echo docker':
#		user => 'root',
#                command => '/usr/bin/echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable>',
#	}

}
