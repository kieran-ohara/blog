ACCOUNT:=855277617897.dkr.ecr.eu-west-1.amazonaws.com
TAG:=repository22e53bbd-q6vh7zuwolk9
BUILDER:=builder
PLATFORM:=linux/arm64

src/_site:
	docker-compose build jekyll
	docker run -itd --name blog-container blog-jekyll:latest /bin/bash
	docker cp blog-container:/app/_site src/_site
	docker stop blog-container
	docker rm blog-container

arm: src/_site
	docker buildx create --name $(BUILDER) || true
	docker buildx use $(BUILDER) || true
	docker buildx inspect --bootstrap || true
	docker buildx use $(BUILDER)
	aws ecr get-login-password \
			| docker login --username AWS --password-stdin $(ACCOUNT)
	docker buildx build  \
	  --platform $(PLATFORM) \
	  --tag $(ACCOUNT)/$(TAG):latest \
	  --file Dockerfile.nginx \
	  --push .
