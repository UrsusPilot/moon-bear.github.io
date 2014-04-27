deploy:
	grunt build
	git push origin `git subtree split --prefix dist dev`:master --force

push:
	git push origin dev
