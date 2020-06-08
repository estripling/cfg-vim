# Make symbolic link
# Following will get the file's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FNAME=$DIR/vimrc
ln -s $FNAME $HOME/.vimrc
