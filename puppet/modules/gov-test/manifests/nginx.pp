# Class: gov-test
#
#
class gov-test::nginx {
	notify{"i'm in gov-test puppet":}

	include ::nginx

	include sudo

}