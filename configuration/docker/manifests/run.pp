class docker::run {

	exec { 'run docker container static web page':
		user => 'root',
		command => '/usr/bin/docker run --name nginx -p 8080:80 -d nginx',
	}

	file {  '/home/ubuntu/index.html':
		path => '/home/ubuntu/index.html',
                ensure => file,
		mode => '0664',
		owner => 'ubuntu',
                content => '<!DOCTYPE html>
                        <html>
                        <head>
                            <title>IaC Project</title>
                        </head>
                        <body>
                            <h1>Hello :D This is a website for IaC group 5</h1>
                        </body>
                        </html>',
        }

	exec { 'cp in right html file':
		user => 'root',
		command => '/usr/bin/docker cp /home/ubuntu/index.html nginx:/usr/share/nginx/html/index.html',
	}
}
