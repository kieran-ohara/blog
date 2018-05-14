INFRASTRUCTURE_JSON=${CURDIR}/infrastructure/infrastructure.json
STACK_NAME=jekyll-blog
CHALK_DIR=${CURDIR}/vendor/chalk
CONFIG_FILES=${CHALK_DIR}/_config.yml,${CURDIR}/_config.yml
CHALK_FILES=_assets _layouts _my_tags 404.html about.html feed.xml index.html
CHALK_INCLUDES=_includes/image.html _includes/svg-icon.html

define chalk_link_template
ln -s ${CHALK_DIR}/$(1) $(2)/$(1);
endef
chalk-link:
	$(foreach file, $(CHALK_FILES), $(call chalk_link_template,$(file),src))
	$(foreach file, $(CHALK_INCLUDES), $(call chalk_link_template,$(file),src))

define chalk_unlink_template
test -e $(2)/$(1) && rm $(2)/$(1);
endef
chalk-unlink:
	$(foreach file, $(CHALK_FILES), $(call chalk_unlink_template,$(file),src))
	$(foreach file, $(CHALK_INCLUDES), $(call chalk_unlink_template,$(file),src))

define compress_file
gzip -9 -c $(1) > $(basename $1)$(suffix $1)
endef
compress:
	$(foreach file, $(shell find ./src/_site -name '*.html' -or -name '*.css' -or -name '*.js'), $(call compress_file,$(file)))

deploy:
	bundle exec jekyll build --config ${CONFIG_FILES}
	venv/bin/aws s3 rm s3://www.kieranbamforth.me/blog --recursive
	venv/bin/aws s3 cp src/_site s3://www.kieranbamforth.me/blog --recursive --exclude "*.html"
	venv/bin/aws s3 cp src/_site s3://www.kieranbamforth.me/blog --recursive \
		--exclude "*" \
		--include "*.html" \
		--content-type "text/html;charset=UTF-8"

serve:
	bundle exec jekyll serve --drafts --config ${CONFIG_FILES}

infrastructure:
	venv/bin/python infrastructure/infrastructure.py > ${INFRASTRUCTURE_JSON}
	venv/bin/aws cloudformation deploy \
		--stack-name ${STACK_NAME} \
		--template-file ${INFRASTRUCTURE_JSON}

destroy-infrastructure:
	venv/bin/aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}

.PHONY: infrastructure
