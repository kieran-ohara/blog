INFRASTRUCTURE_JSON=${CURDIR}/infrastructure/infrastructure.json
STACK_NAME=jekyll-blog
CHALK_DIR=${CURDIR}/vendor/chalk
CONFIG_FILES=${CHALK_DIR}/_config.yml,${CURDIR}/_config.yml

chalk:
	ln -s ${CHALK_DIR}/Gemfile ./Gemfile
	ln -s ${CHALK_DIR}/_assets ./src/_assets
	ln -s ${CHALK_DIR}/_layouts ./src/_layouts
	ln -s ${CHALK_DIR}/_includes ./src/_includes
	ln -s ${CHALK_DIR}/_my_tags ./src/_my_tags
	bundle install
	cd ${CHALK_DIR} && yarn install --modules-folder ./_assets/yarn

deploy:
	bundle exec jekyll build
	aws s3 rm s3://www.kieranbamforth.me/blog --recursive
	aws s3 cp src/_site s3://www.kieranbamforth.me/blog --recursive

serve:
	bundle exec jekyll serve --drafts --config ${CONFIG_FILES}

infrastructure:
	venv/bin/python infrastructure/infrastructure.py > ${INFRASTRUCTURE_JSON}
	venv/bin/aws cloudformation ${MODE}-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${INFRASTRUCTURE_JSON}

destroy-infrastructure:
	venv/bin/aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}

.PHONY: infrastructure
