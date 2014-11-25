" ===== NeoBundle =====
" vim 起動時のみ runtimepath に neobundle.vim を追加
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" neobundle.vim の初期化
call neobundle#begin(expand('~/.vim/bundle'))

" neobundle.vim を更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundleLazy 'Shougo/unite.vim', {
	      \ 'depends': [
	      \	      'Shougo/vimfiler',
	      \	      'Shougo/vimshell',
	      \ ],
	      \ 'autoload': {
	      \		    'commands': [{'name': 'Unite',
	      \				'complete': 'customlist,unite#complete_source'},
	      \				'UniteWithBufferDir',
	      \				'UniteWithCurrentDir',
	      \				'UniteWithCursorWord',
	      \				'UniteWithInput'],
	      \ }}

NeoBundle 'tpope/vim-fugitive'

NeoBundleLazy 'cespare/zenburn'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン・インデントを有効化する
filetype plugin indent on

" ===== appearances =====
set number
set nohlsearch
set incsearch
set ignorecase
set t_Co=256
colors zenburn
" powerline
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode' ], [ 'filename', 'fugitive' ] ]
	\ },
	\ 'component_function': {
      	\   'fugitive': 'MyFugitive',
      	\ },
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	\ }

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0".' '._ : ''
  endif
  return ''
endfunction
