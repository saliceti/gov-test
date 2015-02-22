# gov-test

### Instructions
* Run: git submodule update
* Run: vagrant up
* Access the application via Nginx on 10.0.0.2:80
* The run the test, run: ./test.sh

### Notes

* Using puppet 3.7.4 from the puppet labs repository. It could also be installed  via gem.

* nginx is installed via puppet module jfryman/puppet-nginx. This is the most elegant solution, but should the test require to write the nginx manifest from scratch, let me know so I can implement it.

* To download the puppet modules, librarian-puppet would be a better choice than git submodule, but this would add a dependency that is probably unnecessary here.

* The admin sudoers configuration is the default Ubuntu one, and the module keeps it. I have specified the requested configuration anyway for the demo.

* There are a few warnings due to the puppet modules used, and "stdin: is not a tty" because of Vagrant

* Nginx runs on 10.0.0.2:80
* The application runs on 10.0.0.3:8000 and 10.0.0.4:8000

* Application tested on python 2.7.6

* To run the unit tests
    * install the dependencies in puppet/modules/gov-test/files (ideally in a virtualenv)
    * enter the hello_world directory
    * run: python -m unittest hello_world_tests
