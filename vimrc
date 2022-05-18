" .vimrc

" Modeline and Note {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker nospell:
"
" It HAS to be the first command! Don't change it!
" The command above will be executed when opening .vimrc. It tells Vim to fold
" sections by markers, rather than indentation, and close every fold by
" default and enable spell. Vim will only use these settings for *this* file."
" Works only with nocompatible switched on see Environment section.
" }

" Environment {
"
" Basic:
" ------
" Compatible mode means compatibility to venerable old vi. When you :set
" compatible, all the enhancements and improvements of Vi Improved are turned
" off. It's not recommended to do this, but some systems provide (mostly for
" backwards compatibility with old Unix systems) a vi command that is
" implemented with Vim in compatible mode.
set nocompatible
" }

" General {

" Define <leader> for extra key combinations
" Leader is comma - default is '\'
let mapleader=','
let g:mapleader=','

" Fast saving
nnoremap <leader>w :w!<cr>

" Automatically detect file types, e.g. load filetype-specific indent files
filetype plugin indent on

" syntax highlighting
" 'enable' option: it does't overrule color settings (compared to 'on')
syntax enable

" Enable mouse usage
set mouse=a

" Specify the character encoding used in the script.
scriptencoding utf-8

" Change times so that vim doesn't become slow in terminal
" https://stackoverflow.com/questions/37644682/why-is-vim-so-slow
" set timeoutlen=1000
" set ttimeoutlen=0
" and this (even more important) in your ~/.screeenrc: maptimeout 0

" Set how many lines of history Vim should remember (default: 20) (for Ex commands)
set history=1000

" Set spell checking on: see key mapping
" set spell

" Set to auto read when a file is changed from the outside
set autoread

" When on, Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window.
" It will change to the directory containing the file which was opened
" or selected.
" Note: When this option is on some plugins may not work.
set autochdir

" Specify encryption method, see :help 'cm'
" $ vim -x <filename>  creates an encrypted file
set cryptmethod=blowfish2

" When set makes buffer hidden, useful e.g. with argdo, which allows
" going to be next buffer even though the current, modified buffer has
" not been written. Better to set local, not global
" set hidden

" Folders and backup {

" If you leave a Vim process open in which you've changed file, Vim creates a
" 'backup' file. Then, when you open the file from a different Vim session,
" Vim knows and complains at you for trying to edit a file that is already being
" edited. The 'backup' file is created by appending a ~ to the end of the file
" in the current directory. This can get quite annoying when browsing around a
" directory, so applying the following settings to move backups to the /tmp folder.
" backup and writebackup enable backup support. As annoying as this can be, it
" is much better than losing tons of work in an edited-but-not-written file.
"
" Best Answer:
" https://stackoverflow.com/questions/9987887/vimrc-when-backupdir-is-set-every-save-prompts-press-enter-to-continue#25071930
if !isdirectory(expand("~/.vim/backupdir/"))
  silent !echo "Creating backup dir..."
  silent !mkdir -p ~/.vim/backupdir
endif
if !isdirectory(expand("~/.vim/swap/"))
  silent !echo "Creating swap dir..."
  silent !mkdir -p ~/.vim/swap
endif
if !isdirectory(expand("~/.vim/undo/"))
  silent !echo "Creating undo dir..."
  silent !mkdir -p ~/.vim/undo
endif

" written: Make a backup before overwriting a file.
" The backup is removed after the file was successfully written,
" unless the 'backup' option is also on.
set writebackup

" Where to put backup files
set backupdir^=~/.vim/backupdir//

" Where to put swap files
set directory^=~/.vim/swap//

" Where to put undo files
set undodir^=~/.vim/undo//
"   }

" Encoding {

" It sets the kind of characters which Vim can work with.
set encoding=utf-8

" This gives the end-of-line (<EOL>) formats that will be tried when starting
" to edit a new buffer and when reading a file into an existing buffer.
" Set Unix as the stand file type
set fileformats=unix,dos,mac
"   }
" }

" UI config {

" Needed for certian colorschemes
set term=xterm-256color

set background=light
"set background=dark

if has('cmdline_info')
  " Show the line and column number of the cursor position, separated by a comma.
  " When there is room, the relative position of the displayed
  " text in the file is shown on the far right:
  set ruler

  " A ruler on steroids
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

  " showcmd: shows the last command entered in the
  " very bottm right of Vim (powerline?)
  set showcmd
endif

" Show if in Insert, Replace or Visual mode put a message on the last line.
set showmode

" Show (absolute) line numbers
set number

" Show (relative) line numbers
" set relativenumber

" Highlight current line
set cursorline

" Format current line highlight
" :hi CursorLine term=NONE ctermbg=lightgray ctermfg=black guibg=cyan guifg=black
" :hi CursorLine cterm=underline gui=underline

" Format highlight for spelling mistakes, see :h hl-SpellBad
" https://stackoverflow.com/questions/6008921/how-do-i-change-the-highlight-style-in-vim-spellcheck
" :hi clear SpellBad
" :hi SpellBad cterm=underline  " ctermfg=red undercurl,bold
" :hi SpellBad cterm=underline ctermbg=lightred ctermfg=darkred guibg=lightred guifg=red
"hi SpellBad cterm=underline ctermfg=darkred guifg=red
:hi SpellBad cterm=underline ctermfg=white ctermbg=darkred guifg=red
:hi ColorColumn ctermbg=237 guibg=#3a3a3a  " This is Gray23
" For more colors, see: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" To be set with colorcolumn


" Set default font:
" Try setting your font from the menu and then typing: `:set guifont?`
set guifont=Fira\ Code\ Medium\ 12
if has("gui_running")
  if has("gui_gtk3")
    set guifont=Fira\ Code\ Medium\ 12
  elseif has("gui_gtk2")
    set guifont=Fira\ Code\ Medium\ 12
  endif
endif

" Highlight current column
"set cursorcolumn


" https://coderwall.com/p/uu7-aa/vi-display-a-vertical-line-at-an-arbitrary-column-width
" to be set with ColorColumn
"if exists('&colorcolumn')
"  set colorcolumn=80
"endif

" Wrap lines longer than the width of the window
" https://stackoverflow.com/questions/989093/soft-wrap-at-80-characters-in-vim-in-window-of-arbitrary-width
"set columns=80
"autocmd VimResized * if (&columns > 80) | set columns=80 | endif
set wrap
set linebreak
let &showbreak = '> '
" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

" Command line height (default: 1)
set cmdheight=1

" Minimal number of screen lines to keep above and below the cursor.
" This will make some context visible around where you are working.  If
" you set it to a very large value (999) the cursor line will always be
" in the middle of the window (except at the start or end of the file or
" when long lines wrap).
set scrolloff=5

" Visual autocomplete for command menu
set wildmenu

" Ignore compiled files
" A list of file patterns.  A file that matches with one of these
" patterns is ignored when expanding |wildcards|.
set wildignore=*.o,*~,*.pyc

" Redraw screen only when need to
" Vim loves to redraw the screen during things it probably
" doesn't need to - like in the middle of macros. This tells
" Vim not to bother redrawing during these scenarios, leading to
" faster macros.
set lazyredraw

if has('statusline')
  " Always show status line
  set laststatus=2

  "set statusline=%<%f\ " Filename
  "set statusline+=%w%h%m%r " Options
  "set statusline+=%{fugitive#statusline()} " Git Hotness
  "set statusline+=\ [%{&ff}/%Y] " filetype
  "set statusline+=\ [%{getcwd()}] " current dir
  "set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

  set statusline=%F\ %m\ %r\ %h\ %w\ [%{&ff}]\ %y\ [0x%B]\ %=%l,\ %c%V\ \ \ \ \ \ \ <%p%%>\ \
endif

" Number of pixel lines inserted between characters. Useful if the font
" uses the full character cell height, making lines touch each other.
" When non-zero there is room for underlining.
set linespace=2

" No annoying sound on errors
"set noerrorbells
"set novisualbell

" Specify the behavior when switching between buffers
try
  " This option controls the behavior when switching between buffers.
  set switchbuf=useopen,usetab,newtab

  " If set to 1, show tabline when more than 2 tabs (default)
  " If set to 2, always show tabline.
  set showtabline=1
catch
endtry
" }

" Searching {

" By default, pressing * (forward) or # (backward) searches for the word
" under the cursor.

" Highlight matching [{()}]
set showmatch

" Search as characters are entered
" Go to the matched string while searching
set incsearch

" Highlight search matches
set hlsearch

" Ignore case when searching (also applies for autocomplete - see infercase)
set ignorecase

" When doing keyword completion in insert mode, and ignorecase is also on,
" the case of the match is adjusted depending on the typed text.
" See info box 'Autocompletion and Case Sensitivity' on page 282 of practical vim
set infercase


" Override the 'ignorecase' option if the search pattern contains upper
" case characters.  Only used when the search pattern is typed and
" 'ignorecase' option is on.  Used for the commands '/', '?', 'n', 'N',
" ':g' and ':s'.  Not used for '*', '#', 'gd', tag search, etc.  After
" '*' and '#' you can make 'smartcase' used by doing a '/' command,
" recalling the search pattern from history and hitting <Enter>.
" NOTE: This option is reset when 'compatible' is set.
set smartcase

" Turn off search highlights
" Vim will keep highlighted matches from searches until you either
" run a new search or manually stop highlighting the old search with
" :nohlsearch. Mapped this to ,<space>
nnoremap <leader><space> :nohlsearch<cr>
" }

" Editing {

" File specific configurations {
" For Python: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#lets-make-an-ide
"
:autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" For R:
:autocmd FileType r setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix

" For LaTeX:
:autocmd FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix

" For bash:
:autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix

" Enable spell checking for plain text files
:autocmd FileType markdown,text,tex setlocal fileformat=unix
" }

" Tabs and spaces {

" expandtab turns <TAB>s into spaces
" <TAB> just becomes a shortcut for 'insert four spaces'
set expandtab

" Number of spaces to use for each step of (auto)indent (default: 8).
set shiftwidth=4

" When Vim opens a file and reads a <TAB> character,
" it uses that many spaces to visually show the <TAB>
set tabstop=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It 'feels' like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
" used.  This is useful to keep the 'ts' setting at its standard value
" of 8, while being able to edit like it is set to 'sts'.  However,
" commands like 'x' still work on the actual characters.
" if you use softtabstop, it will allow you to delete all space chars at once
" instead of deleteing every char. Remove 4 spaces at a time, when pressing
" backspace.
" General rule, softtabstop == shiftwidth (if you like to work with spaces)
set softtabstop=4

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
" <BS> will delete a 'shiftwidth' worth of space at the start of the
" line. (default: off)
set smarttab

" Copy indent from current line when starting a new line (typing <CR>
" in Insert mode or when using the "o" or "O" command).  If you do not
" type anything on the new line except <BS> or CTRL-D and then type
" <Esc>, CTRL-O or <CR>, the indent is deleted again. (default: off)
set autoindent

" Do smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages.
set smartindent

" but files with a C-like syntax are cindented
:autocmd FileType c,cpp,h,hpp,java :set cindent
"   }

" Folding {

" Enable folding: show all folds
set foldenable

" Open most folds by default
" foldlevelstart: is the starting fold level for opening a new buffer
" If it is set to 0, all folds will be closed.
" Setting it to 99 would guarantee folds are always open.
" Setting it to 10 here ensures that only very nested blocks of code
" are folded when opening a buffer.
set foldlevelstart=10

" 10 nested fold max
" Folds can be nested. Setting a max on the number of folds guards
" against too many folds.
set foldnestmax=10

" Space opens/closes folds
" za opens/closes the folds around the current block.
nnoremap <space> za

" Fold based on indent level
" This tells Vim to fold based on indentation (useful for Python).
" other possibilities: marker, manual, expr, syntax, diff
" Run :help foldmethod for more information
set foldmethod=indent
"   }

" Show extra characters when editing (e.g., see newline char)
" Strings to use in 'list' mode and for the |:list| command.
set list
"set listchars=tab:>-,trail:-
set listchars=tab:^.,trail:-,extends:#,nbsp:*,eol:¬

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
" This is a list of items, separated by commas.  Each item allows a way to
" backspace over something:
" indent: allow backspacing over autoindent
" eol:    allow backspacing over line breaks (join lines)
" start:  allow backspacing over the start of insert; CTRL-W and CTRL-U stop once
"         at the start of insert.
set backspace=indent,eol,start

" Wrap only when cursor keys are used
set whichwrap+=<,>,[,]

" If you <C-a> add number or <C-x> subtract number, use a decimal number system
" This will cause Vim to treat all numerals as decimal, regardless of whether
" they are padded with zeros.
set nrformats=
" }

" Key mapping {

" Mapping keys: https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping#3776182
" remap is an option that makes mappings work recursively.
" By default it is on and I'd recommend you leave it that way.
" :map and :noremap are recursive and non-recursive versions of the various mapping
" commands.
" Example:
" :map j gg
" :map Q j
" :noremap W j
" j will be mapped to gg. Q will *also* be mapped to gg, because j will be
" expanded for the recursive mapping. W will be mapped to j (and not to gg)
" because j will not be expanded for the non-recursive mapping.
"
" Now remember that Vim is a modal editor. It has a normal mode, visual mode
" and other modes. For each of these sets of mappings, there is a mapping that
" works in normal, visual, select and operator modes (:map and :noremap), one
" that works in normal mode (:nmap and :nnoremap), one in visual mode
" (:vmap and :vnoremap) and so on.
"
" For more guidance on this, see:
" :help :map
" :help :noremap
" :help recursive_mapping
" :help :map-modes

" Map escape to 'jk'. For example, when in INSERT mode, type 'jk' to exit it.
" The workaround if you ever need to enter this rare sequence of keys is to
" enter the j, wait for the leader-check timeout to fade, and then enter the k.
inoremap jk <esc>

" Spell checking {

" Pressing ,ss will toggle and untoggle spell checking: Now use =os
map <leader>ss :setlocal spell!<cr>
"
" and with [os -> :set spell
" and with ]os -> :set nospell

" Shortcuts using <leader>
" Jump to next error
map <leader>sn ]s

" Jump to previous error
map <leader>sp [s

" Add word to spell checking directory in ~/.vim/spell/en.utf-8.add
map <leader>sa zg

" See suggestions
map <leader>s? z=
"   }

" Moveing {

" Custom bindings: group of bindings all relate to movement commands

" Move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" Move a line of text using ALT+[jk]
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
"nnoremap <M-j> :m .+1<CR>==
"nnoremap <M-k> :m .-2<CR>==
"inoremap <M-j> <Esc>:m .+1<CR>==gi
"inoremap <M-k> <Esc>:m .-2<CR>==gi
"vnoremap <M-j> :m '>+1<CR>gv=gv
"vnoremap <M-k> :m '<-2<CR>gv=gv

" Move to beginning/end of a line
" In vanilla Vim, B is moving back including punctuations
" In vanilla Vim, E is moving to the end of a word including punctuations
" nnoremap B ^
" nnoremap E $

" disable $/^ keys (Note: <nop> maps it to nothing - disables it)
" nnoremap $ <nop>
" nnoremap ^ <nop>

" Highlight last inserted text
" It visually selects the block of characters you added last time you
" were in INSERT mode. So, when in NORMAL mode and pressing gV, the last
" inserted text is selected and puts me in VISUAL mode.
nnoremap gV `[v`]
"   }

" Save Session:
" Save a given assortment of windows so that they're there next time you open
" up Vim. :mksession does just that! After saving a Vim session, you can reopen
" it with '$ vim -S [<session-name.vim>]'.
" Mapped it to ,s --> think of it as 'super save'
nnoremap <leader>s :mksession<cr>

" Insert Lines:
" Insert newline w/o entering insert mode
" thinking of it as the 'super o'
nnoremap <leader>o o<esc>k

" thinking of it as the 'super O'
nnoremap <leader>O O<esc>j

" Easier to move between windows
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Put Vim in Paste mode.  This is useful if you want to cut or copy
" some text from one window and paste it in Vim.  This will avoid
" unexpected effects. That is, if in text is any abbreviation that could
" trigger an command.
" Keymap for toggle paste mode on and off
noremap <leader>pp : setlocal paste!<cr>
" }

" Custom functions {
"
" Repeating characters in insert mode {
" https://stackoverflow.com/questions/5054128/repeating-characters-in-vim-insert-mode
"function! RepeatString()
"  let string = input("Enter string to be repeated: ")
"  let times = input("Enter how many times: ")
"  execute ":normal a" . repeat(string, times)
"endfunction
"
"noremap <leader>rr : call RepeatString()<CR>
"
" Just use Vim's native :normal (:norm) command:
"  - When in Normal mode, type ':normal <count>i<expr> <CR>'
"
"  - When in Insert mode, type '<C-o>:normal <count>i<expr> <CR>'
"      > The <C-o> is used to issue normal commands without leaving the Insert mode.
"
"  - Example for inserting a separator
"
"        :normal 80i- <CR>
"
"   }

" Split up paragraph {
" Such that each sentence is on a separate line
" https://vi.stackexchange.com/questions/2846/how-to-set-up-vim-to-work-with-one-sentence-per-line
"
" Here is a simple VimScript function and corresponding 'formatexpr' value that
" should do the job. I have not tested it around all the edge cases, but it
" worked nicely for my simple tests.
function! MyFormatExpr(start, end)
  silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)

" Explanation:
" The expression is a call to the function MyFormatExpr(), passing in the
" starting and ending lines over which the formatting will be applied.
" These lines are computed using the automatically populated variables
" v:lnum (the first line to be formatted) and
" v:count (the number of lines to be formatted).
" The MyFormatExpr() function constructs a :substitute command with the passed
" in range, and replaces a whitespace following an end-of-sentence punctuation
" mark (., !, or ?) with a newline (\r).
"
" Example:
" In Vim, run :execute MyFormatExpr(<start_line_no>, <stop_line_no>)
"
" Caveats:
" * The MyFormatExpr() function does not preserve leading indentation. Some
"   more sophisticated logic would be needed to fix that.
" * There may be other edge cases where this falls apart. Give it a test drive
"   and tweak as necessary!
"
" Newline Character In Vim:
" https://stackoverflow.com/questions/71323/how-to-replace-a-character-by-a-newline-in-vim#71334
" https://stackoverflow.com/questions/71417/why-is-r-a-newline-for-vim
" Use \r instead of \n:
" \r matches <CR> (carriage return).
" \n matches an end-of-line (newline). When matching in a string instead of
" buffer text a literal newline character in matched.
" Also, substituting by \n inserts a null character into the text. To get a
" newline, use \r. When searching for a newline, you would still use \n, however.
" This asymmetry is due to the fact that \n and \r do slightly different things:
"   }

" Twiddle case {

" With the following, you can visually select text then press ~ to convert the
" text to UPPER CASE, then to lower case, then to Title case. Keep pressing ~
" until you get the case you want:
" http://vim.wikia.com/wiki/Switching_case_of_characters
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
"   }

" File operations {

" Return to last edit position when opening file {
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%
"     }

" Delete trailing white space on save {
func! StripTrailingWhiteSpace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Perform StripTrailingWhiteSpace for all buffers
autocmd BufWrite * :call StripTrailingWhiteSpace()
"     }

" Rename file {
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>
"     }

"   }

" }

