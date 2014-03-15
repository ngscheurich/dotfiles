```
 ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||. |||d |||o |||t |||f |||i |||l |||e |||s ||
||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
```

Usage
-----

Just symlink these bad boys into your home directory:

```bash
$ ln -s .tmux.conf ~
$ ln -s .vimrc ~
$ ln -s .zshrc ~
```

If you aren’t down with Python 3, don’t feel like building Vim from source, dislike cool, angular symbols, or want super lightweight status bars, use the `*.airline` alternatives:

```bash
$ ln -s .tmux.conf.airline ~/.tmux.conf
$ ln -s .vimrc.airline ~/.vimrc
```

Pre-flight
---------

No matter *what* you do, don’t forget to install all the required Vim plugins before you get started.

If you aren’t using Vundle already:
```bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Install those plugins:

```bash
$ vim +BundleInstall +qall
```

Thanks
------
ASCII art font is [smkeyboard.flf by Kent Nassen](http://www.forkable.eu/utils/fonts/figlet/smkeyboard.flf)

---

Do What The Fuck You Want To Public License (WTFPL). Copyright (c) 2014 Nicholas Scheurich.
