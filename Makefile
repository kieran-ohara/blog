CLOUDFORMATION_JSON=cloudformation.json
STACK_NAME=jekyll-blog

cloudformation:
	aws cloudformation ${MODE}-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${CURDIR}/${CLOUDFORMATION_JSON}
