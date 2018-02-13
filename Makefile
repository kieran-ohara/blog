INFRASTRUCTURE_JSON=${CURDIR}/infrastructure.json
STACK_NAME=jekyll-blog

deploy:
	bundle exec jekyll build --source=src --destination=src/_site
	aws s3 rm s3://www.kieranbamforth.me --recursive
	aws s3 cp src/_site s3://www.kieranbamforth.me --recursive

serve:
	bundle exec jekyll serve --source=src --destination=src/_site --drafts

infrastructure:
	python infrastructure.py > ${INFRASTRUCTURE_JSON}
	aws cloudformation ${MODE}-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${INFRASTRUCTURE_JSON}

destroy-infrastructure:
	aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}
