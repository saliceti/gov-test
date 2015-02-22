# Class: gov-test::app
#
#
class gov-test::app {

	class { 'python' :
	    virtualenv => true,
  	}

  	file { '/opt/hello_world_requirements.txt':
  		ensure	=> present,
  		source	=> 'puppet:///modules/gov-test/requirements.txt',
  	}

  	python::virtualenv{ '/opt/hello_world':
  		owner			=> vagrant,
  		group 			=> vagrant,
  		requirements	=> '/opt/hello_world_requirements.txt',
  		require 		=> File['/opt/hello_world_requirements.txt'],
  	}

  	file { '/etc/init/hello_world.conf':
  		ensure	=> present,
  		source	=> 'puppet:///modules/gov-test/hello_world.conf',
      require => Python::Virtualenv['/opt/hello_world']
  	}

  	service { 'hello_world':
  		ensure	=> running,
  		require => File['/etc/init/hello_world.conf'],
  	}
  	
}