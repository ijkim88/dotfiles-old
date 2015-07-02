# How to install tmux on Linux without root access
```shell
cd ~
mkdir local
mkdir temp
mv tmux-1.5.tar.gz temp
mv libevent-2.0.12-stable.tar.gz temp
cd temp
tar xvfz tmux-1.5.tar.gz
tar xvfz libevent-2.0.12-stable.tar.gz
cd libevent-2.0.12-stable
./configure --prefix=$HOME/local
make
make install
cd ../tmux-1.5
DIR="$HOME/local"
./configure CFLAGS="-I$DIR/include" LDFLAGS="-L$DIR/lib"
make
cp tmux ~/local/bin
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH="$HOME/local/lib"
tmux
```

# Setting up dotfiles on new system
```shell
git clone https://github.com/ijkim88/dotfiles.git
ln -s dotfiles/.bash_profile .bash_profile
ln -s dotfiles/.vim/ .vim
ln -s dotfiles/.vimrc .vimrc
git submodule update --init
```

# Configure git
```shell
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

# If having trouble pushing to github
```shell
git remote set-url origin https://username@github.com/user/repo.git
unset SSH_ASKPASS
git push origin master
```

# Remove a bad commit on git
```shell
git reset --soft HEAD^
git push origin +master
```

# Fixing author email for commits
```shell
git clone --bare https://github.com/user/repo.git
cd repo.git
```

run `git-author-rewrite.sh` in scripts folder
verify by running `git log | grep Author | sort | unique`

```shell
git remote add origin https://username@github.com/user/repo.git
git push --force --tags origin 'refs/heads/*'
```

# Installing new submodule
```shell
git submodule add [git repo url]
git add [files or '.' for all]
git commit -m "[comment]"
git push
```

# Removing a submodule
```shell
git submodule deinit [path]
git rm [path]
git commit -m "[comment]"
git push
```

# Updating a submodule
[go to directory of git module]

```shell
git pull origin master
```

# Updating all submodules
```shell
git submodule foreach git pull origin master
```

# Installing Python
http://toomuchdata.com/2014/02/16/how-to-install-python-on-centos/
```shell
mkdir $HOME/tmp
cd $HOME/tmp
wget [python stable source url]
tar -xzvf [python .tar.gz]
cd [python folder]
./configure --prefix=$HOME/local --enable-shared
make && make altinstall
export PATH=~/bin/:$PATH
export LD_LIBRARY_PATH=~/local/lib
```

# Python 3 and pyvenv
https://robinwinslow.co.uk/2013/12/26/python-3-4-virtual-environment/

# Installing Ruby
```shell
mkdir $HOME/tmp
cd $HOME/tmp
wget [ruby stable source url]
tar -xzvf [ruby .tar.gz]
cd [ruby folder]
./configure --prefix=$HOME/local && make && make install
export PATH=~/bin/:$PATH
```

# Installing Ruby Gems
http://www.r-bloggers.com/installing-ruby-on-linux-as-a-user-other-than-root/

# Building VIM from Source
https://wincent.com/wiki/building_Vim_from_source
http://www.xorpd.net/blog/vim_python3_install.html

# Install ack
```shell
curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 !#:3
```
