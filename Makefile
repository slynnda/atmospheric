git.toplevel = $(shell git rev-parse --show-toplevel)

packer = $(shell command -v packer)
vagrant = $(shell command -v vagrant)
git = $(shell command -v git)

build.source.dir ?= ${git.toplevel}
build.target.path ?= ${git.toplevel}

packer-validate:
	${packer} validate ${build.source.dir}/packer.json

packer-build:
	${packer} build -color=true -force ${build.target.path}/packer.json

vagrant-box-add:
	${vagrant} box add --force --name=atmospheric ${build.target.path}/output/packer_atmospheric_virtualbox.box

vagrant-up:
	${vagrant} up --provision

vagrant-ssh:
	${vagrant} ssh

git-submodule-init:
	${git} submodule init

git-submodule-update:
	${git} submodule update --remote
