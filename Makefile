INFRASTRUCTURE_JSON=${CURDIR}/infrastructure.json
STACK_NAME=jekyll-blog

deploy:
	bundle exec jekyll build --source=src --destination=src/_site
	aws s3 rm s3://www.kieranbamforth.me --recursive
	aws s3 cp src/_site s3://www.kieranbamforth.me --recursive

serve:
	bundle exec jekyll serve --drafts --source=src --destination=src/_site

infrastructure:
	virtualenv venv
	venv/bin/pip install -r Requirements.txt
	venv/bin/python infrastructure.py > ${INFRASTRUCTURE_JSON}
	venv/bin/aws cloudformation ${MODE}-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${INFRASTRUCTURE_JSON}

destroy-infrastructure:
	venv/bin/aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}
