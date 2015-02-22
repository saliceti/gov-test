# Class: gov-test
#
#
class gov-test {
	notify{"i'm in gov-test puppet":}

	class { 'nginx': }

	include sudo
}