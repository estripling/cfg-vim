# Instruction taken from
# https://www.thegeekstuff.com/2008/12/vi-and-vim-editor-3-steps-to-enable-thesaurus-option/

# echo "Downloading thesaurus file"
# wget https://ia600205.us.archive.org/7/items/mobythesauruslis03202gut/mthesaur.txt

# Make directory
DNAME=$HOME/.vim/thesau/
mkdir -p $DNAME

# Make symbolic link
# Following will get the file's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FNAME=$DIR/mthesaur.txt
ln -s $FNAME $DNAME/

# Add the following to .vimrc, to tell Vim where to find the thesaurus file
# set thesaurus+=~/.vim/thesau/mthesaur.txt

# In Vim, start typing and press `<C-x><C-t>`
