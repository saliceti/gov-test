# gov-test

### Instructions
* Run: git submodule update
* Run: vagrant up

### Notes

* Using puppet 3.7.4 from the puppet labs repository. It could also be installed  via gem.

* nginx is installed via puppet module jfryman/puppet-nginx. This is the most elegant solution, but should the test require to write the nginx manifest from scratch, let me know so I can implement it.

* To download the puppet modules, librarian-puppet would be a better choice than git submodule, but this would add a dependency that is probably unnecessary here.

* The admin sudoers configuration is the default one. I have specified the requested admin configuration anyway for the demo.

* There are a few warnings due to the puppet modules used
