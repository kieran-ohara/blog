src/gems: src/Gemfile.lock src/Gemfile
	mkdir $@
	cd src && bundle install

serve: src/gems
	cd src && bundle exec jekyll serve -V --trace --config _config.yml,_config.override.yml --drafts

.PHONY: serve
