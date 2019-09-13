JEKYLL_ENV:=production
CONTAINER_NAME:=855277617897.dkr.ecr.eu-west-1.amazonaws.com/core-blogim-rkehz4g9knp0

src/_sass/: src/package.json
	npm install bourbon
	mv node_modules/bourbon/core $@

src/_assets/yarn: src/package.json
	docker build --tag $(CONTAINER_NAME):latest .
	docker run -it -v $(PWD):/app -w /app $(CONTAINER_NAME):latest \
		/bin/bash -c 'yarn install --modules-folder ./src/_assets/yarn'

src/_site: _config.yml src/_assets/yarn src/_sass $(shell find ./src -name '*' -not -path '*/_site*')
	rm $@ || true
	rm -rf .jekyll-cache/ || true
	docker build --tag $(CONTAINER_NAME):latest .
	docker run -it -v $(PWD):/app -e JEKYLL_ENV=$(JEKYLL_ENV) -w /app $(CONTAINER_NAME):latest \
		/bin/bash -c 'jekyll build --config src/_config.yml,_config.yml'

S3_BUCKET:=s3://s3.kieranbamforth.me/apps/blog
deploy: src/_site
	aws s3 rm $(S3_BUCKET) --recursive
	# HTML
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.html" \
		--content-type "text/html;charset=UTF-8" \
		--cache-control "Cache-Control: max-age=3600" \
	# JS
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.js" \
		--content-type "text/javascript" \
		--cache-control "Cache-Control: max-age=3600" \
	# CSS
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.css" \
		--content-type "text/css" \
		--cache-control "Cache-Control: max-age=3600" \
	# XML
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.xml" \
		--content-type "text/xml" \
		--cache-control "Cache-Control: max-age=3600" \
	# EOT
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.eot" \
		--content-type "application/vnd.ms-fontobject" \
		--cache-control "Cache-Control: max-age=3600" \
	# TTF
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.ttf" \
		--content-type "application/octet-stream" \
		--cache-control "Cache-Control: max-age=3600" \
	# WOFF
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.woff" \
		--content-type "font/woff" \
		--cache-control "Cache-Control: max-age=3600"
	# WOFF2
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.woff2" \
		--content-type "font/woff2" \
		--cache-control "Cache-Control: max-age=3600"
	# SVG
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.svg" \
		--content-type "image/svg+xml" \
		--cache-control "Cache-Control: max-age=3600" \
	# ICO
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.ico" \
		--content-type "image/x-icon" \
		--cache-control "Cache-Control: max-age=3600" \
	# JPG
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.jpg" \
		--content-type "image/jpeg" \
		--cache-control "Cache-Control: max-age=3600" \
	# PNG
	aws s3 cp $< $(S3_BUCKET) --recursive \
		--exclude "*" \
		--include "*.png" \
		--content-type "image/png" \
		--cache-control "Cache-Control: max-age=3600" \
	# Robots.txt
	aws s3 cp $</robots.txt $(S3_BUCKET)/robots.txt --content-type "text/plain"
