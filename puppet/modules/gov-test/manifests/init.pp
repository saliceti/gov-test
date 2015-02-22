# Class: gov-test
#
#
class gov-test {
	notify{"i'm in gov-test puppet":}

	class { 'nginx': }

	nginx::resource::vhost { 'test.gov':
		proxy	=> 'http://be.test.gov'
	}

	nginx::resource::upstream { 'be.test.gov':
		members => [
			'localhost:3000',
			'localhost:3001',
		],
	}
}