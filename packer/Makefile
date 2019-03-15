GIT.LOCAL.REL.DIR := $(shell basename -a ${GIT.LOCAL.ROOT.DIR})
GIT.LOCAL.REL.PATH := $(shell git rev-parse --show-prefix)

SUBDIRS := archlinux

$(SUBDIRS):
	$(MAKE) -C ${GIT.LOCAL.ROOT.DIR}/${GIT.LOCAL.REL.PATH}$@
	
.PHONY: $(SUBDIRS)