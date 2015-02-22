# gov-test

### Instructions
* Clone the Git repository
* Run: `git submodule update`
* Run: `vagrant up`
* Access the application via Nginx on `10.0.0.2:80`
* The run the test, run: `./test.sh`

### Notes

* Using puppet 3.7.4 from the puppet labs repository. It could also be installed via gem.

* Nginx, sudoers, virtualenv are managed via Puppet forge modules. This is the most elegant solution, but should the test require to write the manifests from scratch, let me know so I can implement it.

* To download the puppet modules, librarian-puppet would be a better choice than git submodule, but this would add a dependency that is probably unnecessary here.

* The requested admin sudoers configuration is the default one. I have specified it anyway for the demo.

* There are a few warnings that can be ignored, due to know issues in the included puppet modules and Vagrant

* Nginx runs on `10.0.0.2:80`
* The application runs on `10.0.0.3:8000` and `10.0.0.4:8000`

* The application was tested on python 2.7.6

* To run the unit tests:
    * Install the dependencies in puppet/modules/gov-test/files (ideally in a virtualenv)
    * Enter the hello_world directory
    * Run: `python -m unittest hello_world_tests`
