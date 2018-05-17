INFRASTRUCTURE_JSON=${CURDIR}/infrastructure/infrastructure.json
STACK_NAME=jekyll-blog
CHALK_DIR=${CURDIR}/vendor/chalk
CONFIG_FILES=${CHALK_DIR}/_config.yml,${CURDIR}/_config.yml
CHALK_FILES=_assets _layouts _my_tags about.html feed.xml index.html
CHALK_INCLUDES=_includes/image.html _includes/svg-icon.html
CHALK_GITHUB=https://github.com/nielsenramon/chalk
DIST=dist

chalk:
	test -d $(CHALK_DIR) || mkdir vendor && git clone $(CHALK_GITHUB) $(CHALK_DIR)

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
mkdir -p $(addprefix ./$(DIST)/,$(dir $1));
gzip -c $(1) > $(addprefix $(DIST)/,$(basename $1))$(suffix $1);
endef
compress:
	$(foreach file, $(shell find ./src/_site -name '*.html' -or -name '*.css' -or -name '*.js' -or -name '*.xml'), $(call compress_file,$(file)))

deploy: compress
	bundle exec jekyll build --config ${CONFIG_FILES}
	venv/bin/aws s3 rm s3://www.kieranbamforth.me/blog --recursive
	# HTML
	venv/bin/aws s3 cp $(DIST)/src/_site s3://www.kieranbamforth.me/blog --recursive \
		--exclude "*" \
		--include "*.html" \
		--content-type "text/html;charset=UTF-8" \
		--cache-control "Cache-Control: max-age=3600" \
		--content-encoding "gzip"
	# JS
	venv/bin/aws s3 cp $(DIST)/src/_site s3://www.kieranbamforth.me/blog --recursive \
		--exclude "*" \
		--include "*.js" \
		--content-type "text/javascript" \
		--cache-control "Cache-Control: max-age=3600" \
		--content-encoding "gzip"
	# CSS
	venv/bin/aws s3 cp $(DIST)/src/_site s3://www.kieranbamforth.me/blog --recursive \
		--exclude "*" \
		--include "*.css" \
		--content-type "text/css" \
		--cache-control "Cache-Control: max-age=3600" \
		--content-encoding "gzip"
	# XML
	venv/bin/aws s3 cp $(DIST)/src/_site s3://www.kieranbamforth.me/blog --recursive \
		--exclude "*" \
		--include "*.xml" \
		--content-type "text/xml" \
		--cache-control "Cache-Control: max-age=3600" \
		--content-encoding "gzip"

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

setup:
	test -e ./Gemfile || ln -s $(CHALK_DIR)/Gemfile ./Gemfile
	bundle install
	test -e ./package.json || ln -s $(CHALK_DIR)/package.json ./package.json
	yarn install --modules-folder ./src/_assets/yarn

.PHONY: infrastructure
