packer-validate:
	packer validate packer.json

packer-build:
	packer build -color=true -force packer.json

vagrant-box-add:
	vagrant box add --force --name=atmospheric output/packer_atmospheric_virtualbox.box

vagrant-up:
	vagrant up

vagrant-ssh:
	vagrant ssh

git-submodule-init:
	git submodule init

git-submodule-update:
	git submodule update --remote
