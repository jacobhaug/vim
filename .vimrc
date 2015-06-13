""
"" Janus setup
""

" Define paths
if has('win32') || has('win64') || has('win32unix')
  let g:janus_path = expand("~/.vim/janus/vim")
  let g:janus_vim_path = expand("~/.vim/janus/vim")
else
  let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
  let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
endif
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" .vimrc.after is loaded after the plugins have loaded


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""" MY VUNDLES """""""""""""""""""""""
" HEAVILY/MOSTLY taken from https://github.com/skwp/dotfiles

" Make Git pervasive in vim ( :Gblame + Glog + many more )
Plugin 'tpope/vim-fugitive'

" file navigator gutter
Plugin 'scrooloose/nerdtree.git'

" awesome syntax highlighting
" TODO: Figure out how to enable correctly for Ruby.
Plugin 'scrooloose/syntastic'

" Command+T replacement (ctrl+P)
Plugin 'kien/ctrlp.vim'

" Rails plugin ( :A mapping! )
Plugin 'tpope/vim-rails.git'

" comment lines out (gc in visual mode)
Plugin 'tomtom/tcomment_vim.git'

" Make it look amazing
Plugin 'altercation/vim-colors-solarized'

" Pimped out bar at the bottom of current buffer
Plugin 'bling/vim-airline.git'

" Highlights class names + methods more brightly
" Handy for seeing syntax shape before your eyes
Plugin 'vim-scripts/TagHighlight.git'

" END OF VUNDLE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line%