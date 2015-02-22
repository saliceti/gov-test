# gov-test

### Instructions
* Clone the Git repository
* Run: `git submodule update --init`
* Run: `vagrant up` (about 5 min)
* Access the application via Nginx on `10.0.0.2:80`
* The run the test, run: `./test.sh`

### Notes

* Nginx runs on `10.0.0.2:80`.
* The application runs on `10.0.0.3:8000` and `10.0.0.4:8000`.

* To run the unit tests:
    * Install the dependencies in puppet/modules/gov-test/files/requirements.txt (ideally in a virtualenv)
    * Enter the hello_world directory
    * Run: `python -m unittest hello_world_tests`

* Nginx, sudoers, virtualenv are managed via Puppet forge modules. This is the most elegant solution, but should the test require to write the manifests from scratch, let me know so I can implement it.

* To download the puppet modules, [librarian-puppet](https://github.com/rodjek/librarian-puppet) would be a better choice than git submodule, but this would add a dependency that is probably unnecessary here.

* There are a few warnings that can be ignored, due to known issues in the included puppet modules and Vagrant.

* Tested on Python 2.7.6, MacOS 10.10.2, Vagrant 1.7.2, VirtualBox 4.3.20, Puppet 3.7.4

