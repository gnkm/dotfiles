" SoftwareDesign 2013/10 参照

set number
set nohlsearch
set incsearch
set ignorecase

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

call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン・インデントを有効化する
filetype plugin indent on
