git ?= $(shell command -v git || echo "git must be installed locally for this build to succeed")
packer ?= $(shell command -v packer || echo "packer must be installed locally for this build to succeed") 
vagrant ?= $(shell command -v vagrant || echo "vagrant must be installed locally for this build to succeed")

git.toplevel = $(shell git rev-parse --show-toplevel)

build.src.dir ?= ${git.toplevel}/.build/src
build.pkg.dir ?= ${git.toplevel}/.build/pkg
build.bin.dir ?= ${git.toplevel}/.build/bin

vagrant.box.name ?= atmospheric
vagrant.box.filename ?= ${vagrant.box.name}.box

packer.template.filename ?= packer.json
packer.build.colorize ?= true
packer.config.iso.url ?= https://mirrors.xmission.com/archlinux/iso/2019.07.01/archlinux-2019.07.01-x86_64.iso
packer.config.iso.checksum.url ?= https://mirrors.xmission.com/archlinux/iso/2019.07.01/sha1sums.txt
packer.config.iso.checksum.type ?= sha1
packer.config.ssh.timeout ?= 20m
packer.config.country ?= US
packer.config.headless ?= false
packer.config.build.output.dir ?= ${build.pkg.dir}
packer.config.build.output.filename ?= ${vagrant.box.filename}

echo:
	@echo git: ${git}
	@echo packer: ${packer}
	@echo vagrant: ${vagrant}
	@echo git.toplevel: ${git.toplevel}
	@echo build.src.dir: ${build.src.dir}
	@echo build.pkg.dir: ${build.pkg.dir}
	@echo vagrant.box.name: ${vagrant.box.name}
	@echo vagrant.box.filename: ${vagrant.box.filename}
	@echo packer.template.filename: ${packer.template.filename}
	@echo packer.build.colorize: ${packer.build.colorize}
	@echo packer.config.iso.url: ${packer.config.iso.url}
	@echo packer.config.iso.checksum.url: ${packer.config.iso.checksum.url}
	@echo packer.config.iso.checksum.type: ${packer.config.iso.checksum.type}
	@echo packer.config.ssh.timeout: ${packer.config.ssh.timeout}
	@echo packer.config.country: ${packer.config.country}
	@echo packer.config.headless: ${packer.config.headless}
	@echo packer.config.build.output.dir: ${packer.config.build.output.dir}
	@echo packer.config.build.output.filename: ${packer.config.build.output.filename}
  
packer-validate:
	${packer} validate ${build.src.dir}/${packer.template.filename}

packer-build:
	${packer} build -force -color=${packer.build.colorize} \
		-var 'iso.url=${packer.config.iso.url}' \
		-var 'iso.checksum.url=${packer.config.iso.checksum.url}' \
		-var 'iso.checksum.type=${packer.config.iso.checksum.type}' \
		-var 'ssh.timeout=${packer.config.ssh.timeout}' \
		-var 'country=${packer.config.country}' \
		-var 'headless=${packer.config.headless}' \
		-var 'build.output.dir=${packer.config.build.output.dir}' \
		-var 'build.output.filename=${packer.config.build.output.filename}' \
		${build.src.dir}/${packer.template.filename}

vagrant-box-add:
	${vagrant} box add --force --name=${vagrant.box.name} ${build.pkg.dir}/${vagrant.box.filename}

vagrant-up:
	${vagrant} up --provision

vagrant-ssh:
	${vagrant} ssh

git-submodule-init:
	${git} submodule init

git-submodule-update:
	${git} submodule update --remote
