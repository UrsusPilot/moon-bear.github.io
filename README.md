# QuadCopterTainan

This is the official website for QuadCopterTainan, wish you enjoy :)

## Prerequiste

- nodejs
- npm
- ruby (also install compass)

## Init

To init the project you have to install npm, nodejs for basic, after that you should enter following command

```
sudo npm install # for backend packages
sudo bower install # for frontend packages
```

after you install all backend and frontend packages just enter 

```
grunt server
```

for launching web server

## Deploy

You will have to install `git subtree`, if your git can't fint command subtree

Reference: http://engineeredweb.com/blog/how-to-install-git-subtree/

If you are on Ubuntu:

The steps to install subtree:

1. Checkout the git source as we need to get to the contrib directory. There will be no need to compile git itself.
2. Instide a shell go into the `git/contrib/subtree` directory.
3. Run `make` to prepare subtree.
4. The Makefile makes some assumptions about where git will be installed that aren't correct for ubuntu. So, running make install will show an error. Instead run `sudo install -m 755 git-subtree /usr/lib/git-core` to install subtree.
5. Remove the git source (unless you want to keep it around for another reason).

If you are on MAC

1. Since git contrib was not put on your system you'll need to checkout the git source. Don't worry about compiling or installing git. You just need access to the contrib director to install subtree (which is mostly shell scripts).
2. In a terminal go into the git/contrib/subtree directory.
3. Run `make` to prepare subtree.
4. Run `sudo make prefix=/usr install`. The prefix is important for it to be installed in the right location. Note, you need to use sudo to install this because of it's location on the system.
5. Remove the git source (unless you want to keep it around for another reason).

for quick deploy code

```
make deploy
```

## Push

**Warning** : you have to push your code to branch `dev` not `master`

quick push code

```
make push
```

## License

MIT [@chilijung](http://github.com/chilijung)
