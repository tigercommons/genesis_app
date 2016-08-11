SHELL=/bin/bash
APP_NAME=genesis_v2.mkl
ARCHIVE_DIR=$(APP_NAME)/resources/tmp/
R_DIR=$(APP_NAME)/resources/home/dnanexus/
SETUP_DIR=$(APP_NAME)/resources/home/dnanexus/
R_REPO_FILES = $(notdir $(wildcard R/*.R))
SETUP_REPO_FILES = $(notdir $(wildcard setup/cloud/*))
R_FILES = $(addprefix $(R_DIR)/, $(R_REPO_FILES))
SETUP_FILES = $(addprefix $(SETUP_DIR)/, $(SETUP_REPO_FILES))
MD5_ARCHIVE = setup/local/archives.md5
DNA_NEXUS_FILES = $( addprefix $(APP_NAME), src/code.sh Readme.developer.md Readme.md dxapp.json )

$(APP_NAME): 
	mkdir -p $@/src
	mkdir -p $@/resources/tmp
	mkdir -p $@/resources/home/dnanexus


$(APP_NAME)/src/code.sh : app/code.sh $(APP_NAME)
	cp $< $@	


$(APP_NAME)/dxapp.json : app/dxapp.json $(APP_NAME)
	cp $< $@


$(APP_NAME)/Readme.developer.md : app/Readme.developer.md $(APP_NAME)
	cp $< $@


$(APP_NAME)/Readme.md : app/Readme.md $(APP_NAME)
	cp $< $@



$(R_DIR)/%.R:  R/%.R
	cp $< $@


$(SETUP_DIR)/% : /setup/cloud/%
	cp $< $@

.PHONY : archives
archives: $(MD5_ARCHIVE) setup/local/check_update_archives.sh
	./setup/local/check_update_archives.sh $< $(ARCHIVE_DIR)


.PHONY : all
all: $(R_FILES) $(SETUP_FILES) $(DNA_NEXUS_FILES)


.PHONY : update_archive_md5sum 
update_md5_archives: $(ARCHIVE_DIR)
	md5sum $(ARCHIVE_DIR)/*.tar.gz > $(MD5_ARCHIVE)

