# Class: gov-test::app
#
#
class gov-test::app {

	class { 'python' :
	    virtualenv => true,
  	}

  	python::virtualenv{ "/opt/hello":
  		owner	=> vagrant,
  		group 	=> vagrant,
  	}
  	
}