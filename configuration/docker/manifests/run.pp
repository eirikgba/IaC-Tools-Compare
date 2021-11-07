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
                content => '<!doctype html>
						<html>
						<head>
						<title>Group 5 - IaC</title>
						<meta charset="utf-8"/>
						<meta name="robots" content="noindex"/>
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<style>
						body { text-align: center; padding: 150px; background: black;}
						h1 { font-size: 50px; color:white; }
						body { font: 20px Helvetica, sans-serif; color: white; }
						article { display: block; text-align: left; width: 650px; margin: 0 auto; }
						a { color: #dc8100; text-decoration: none; }
						a:hover { color: #333; text-decoration: none; }
						</style>
						</head>
						<body>
						<article>
							<h1>Group 5 IaC project</h1>
							<div>
								<p>This web page is configured with puppet</p>
							</div>
						</article>
						</body>
						</html>
						',
        }

	exec { 'cp in right html file':
		user => 'root',
		command => '/usr/bin/docker cp /home/ubuntu/index.html nginx:/usr/share/nginx/html/index.html',
	}
}
