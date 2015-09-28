# Setup Wireless on Centos 7 Minimal
Install NetworkManager-wifi by mounting USB ISO and install from Packages directory
```shell
rpm -i NetworkManager-wifi

chkconfig NetworkManager on
service NetworkManager start
chkconfig network off
chkconfig wpa_supplicant off

service NetworkManager restart
```

# Install Centos 7 and MATE
First install Centos 7 minimal

```shell
yum install epel-release
yum groupinstall "X Window System"
yum groupinstall "MATE Desktop"
```

To start the Graphical Interface

```shell
systemctl isolate graphical.target
```

To have MATE boot as default devektop environment
```shell
systemctl set-default graphical.target
```

which is the equivalent of:
```shell
rm '/etc/systemd/system/default.target'
ln -s /usr/lib/systemd/system/graphical.target' '/etc/systemd/system/default.target'
```

# Use share folders for VirtualBox
Install Guest Additions
Open the VM settings and go to Shared Folders to define the folders

```shell
sudo mount -t vboxsf -o rw,uid=1000,gid=1000 [name from VBox] [destination]
```

# Install VirtualBox on CentOS 7 Headless Server
http://www.unixmen.com/install-oracle-virtualbox-and-manage-it-using-phpvirtualbox-on-centos-7-headless-server/

# How to install tmux on Linux without root access
First install libevent dependency:
```shell
tar xvfz libevent-2.0.12-stable.tar.gz
cd libevent-2.0.12-stable
./configure --prefix=$HOME/local
make && make install
```

Then install tmux:
```shell
tar xvfz tmux-1.5.tar.gz
cd ../tmux-1.5
DIR="$HOME/local"
./configure CFLAGS="-I$DIR/include" LDFLAGS="-L$DIR/lib"
make
cp tmux ~/local/bin
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH="$HOME/local/lib"
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
This will change all of the authors to the new author

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
Go to the directory of the git module to update

```shell
git pull origin master
```

# Updating all submodules
```shell
git submodule foreach git pull origin master
```

# Setup a remote repository for Git
First setup the remote respository:
```shell
ssh git@example.com
mkdir my_project.git
cd my_project.git
git init --bare
git update-server-info # If planning to serve via HTTP
exit
```

On the local machine:
```shell
cd my_project
git init
git add .
git commit -m "Commit message"
git remote add origin git@example.com:my_project.git
git push -u origin master
```

# Installing Python
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
Download latest ruby gems using `wget` from https://rubygems.org

```shell
tar -xzvf [rubygems .tar.gz]
ruby setup.rb
export GEM_HOME=~/local/gems
export RUBYOPT=rubygems
```

# Building VIM from Source
* https://wincent.com/wiki/building_Vim_from_source
* http://www.xorpd.net/blog/vim_python3_install.html

## For Python 2.7
```shell
./configure --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --enable-cscope --enable-multibyte --with-features=huge --disable-nls --prefix=$HOME/local --with-python-config-dir=$HOME/local/lib/python2.7/config --with-compiledby="ijkim88@gmail.com"
```

# Install ack
```shell
curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 !#:3
```

# Install pip2 and pip2.7
```
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python2.7 get-pip.py
```

# Grep multiple words
In this example, search warning, error, and critical words in a text log file
called `var/log/messages`, enter:

```shell
grep 'warning\|error\|critical' /var/log/messages
```

To just match words add `-w` with:

```shell
grep -w 'warning\|error\|critical' /var/log/messages
```

egrep command can skip the above syntax and use the following syntax:

```shell
egrep -w 'warning|error|critical' /var/log/messages
```

I recommend that you pass the `-i` (ignore case) and `--color` option as follows:

```shell
egrep -wi --color 'warning|error|critical' /var/log/messages
```
