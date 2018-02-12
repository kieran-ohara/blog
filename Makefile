INFRASTRUCTURE_JSON=${CURDIR}/infrastructure.json
STACK_NAME=jekyll-blog

deploy:
	cd src && bundle exec jekyll build
	aws s3 rm s3://www.kieranbamforth.me --recursive
	aws s3 cp src/_site s3://www.kieranbamforth.me --recursive

serve:
	cd src && bundle exec jekyll serve --drafts

infrastructure:
	python infrastructure.py > ${INFRASTRUCTURE_JSON}
	aws cloudformation ${MODE}-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${INFRASTRUCTURE_JSON}

destroy-infrastructure:
	aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}
