SUBDIRS = thread_pool

ARCHIVE = spe-target-libs.a


.PHONY: all clean install $(build_SUBDIRS) $(clean_SUBDIRS) $(install_SUBDIRS)

build_SUBDIRS = $(addprefix build_,$(SUBDIRS))
clean_SUBDIRS = $(addprefix clean_,$(SUBDIRS))
install_SUBDIRS = $(addprefix install_,$(SUBDIRS))

# Build targets 
#
all: build

shared_library: build

static_library: build
	$(AR) -cqv $(ARCHIVE) $(shell ls */*.o)

build_remotemsg: build_handle_protector

build: $(build_SUBDIRS)

$(build_SUBDIRS):
	$(MAKE) -C $(subst build_,,$@)

# Clean targets

clean: $(clean_SUBDIRS)
	rm -f $(ARCHIVE)

$(clean_SUBDIRS):
	$(MAKE) -C $(subst clean_,,$@) clean

# Install targets 

install: $(install_SUBDIRS)

$(install_SUBDIRS):
	$(MAKE) -C $(subst install_,,$@) install
