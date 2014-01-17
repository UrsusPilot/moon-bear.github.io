deploy:
	grunt build
	git subtree push --prefix dist origin master

push:
	git push origin dev
