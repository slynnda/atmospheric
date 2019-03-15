GIT.LOCAL.REL.DIR := $(shell basename -a ${GIT.LOCAL.ROOT.DIR})
GIT.LOCAL.REL.PATH := $(shell git rev-parse --show-prefix)

packer-validate:
	packer validate template.json

packer-build:
	packer build -color=true template.json

vagrant-box-add:
	vagrant box add --force --name=$(shell basename -a ${GIT.LOCAL.REL.PATH}) output/packer_arch_virtualbox.box

vagrant-up:
	vagrant up

vagrant-ssh:
	vagrant ssh