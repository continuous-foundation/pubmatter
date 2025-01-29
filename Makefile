.PHONY: all copy-files clean

# Extract the `version` value from typst.toml
VERSION := $(shell sed -n 's/^version[[:space:]]*=[[:space:]]*"\([^"]*\)".*/\1/p' typst.toml)

# Define a variable for the folder where files will be copied
PACKAGE_FOLDER :=  ../typst-packages/packages/preview/pubmatter/$(VERSION)

copy-files:
	@echo "Creating folder: $(PACKAGE_FOLDER)"
	@mkdir -p $(PACKAGE_FOLDER)
	@echo "Copying files into $(PACKAGE_FOLDER) ..."
	cp LICENSE $(PACKAGE_FOLDER)
	cp README.md $(PACKAGE_FOLDER)
	cp pubmatter.typ $(PACKAGE_FOLDER)
	cp typst.toml $(PACKAGE_FOLDER)
	cp validate-frontmatter.typ $(PACKAGE_FOLDER)
	@echo "Done copying files."
