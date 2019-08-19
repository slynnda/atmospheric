[![CircleCI](https://circleci.com/gh/slynnda/atmospheric/tree/master.svg?style=svg)](https://circleci.com/gh/slynnda/atmospheric/tree/master)

### Usage

The following commands are available:

* `make packer-validate`: validate the packer template
* `make packer-build`: build the virtual machine image
* `make vagrant-box-add`: add the virtual machine image as a vagrant box definition
* `make vagrant-up`: instantiate a new Vagrant box from the Vagrant box image definition added via the previous command
* `make vagrant-ssh`: attach as the `vagrant` user to a terminal session within the running Vagrant box.