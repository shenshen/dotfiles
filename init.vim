" Basics {
    set shell=/bin/sh
" }

" Bundles {

    " Setup Bundle Support {
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " Deps {
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        Bundle 'mileszs/ack.vim'
        if executable('ag')
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
        endif
    " }


    " General {
        Bundle 'scrooloose/nerdtree'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-repeat'
        Bundle 'jiangmiao/auto-pairs'
        Bundle 'ctrlpvim/ctrlp.vim'
        Bundle 'tacahiroy/ctrlp-funky'
        Bundle 'kristijanhusak/vim-multiple-cursors'
        Bundle 'vim-scripts/sessionman.vim'
        Bundle 'matchit.zip'
        Bundle 'bling/vim-airline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'mbbill/undotree'
        Bundle 'nathanaelkane/vim-indent-guides'
        Bundle 'mhinz/vim-signify'
        Bundle 'tpope/vim-abolish.git'
        Bundle 'osyo-manga/vim-over'
        Bundle 'kana/vim-textobj-user'
        Bundle 'kana/vim-textobj-indent'
        Bundle 'kana/vim-textobj-entire'
        Plugin 'reedes/vim-textobj-quote'
        Plugin 'reedes/vim-textobj-sentence'
		Plugin 'kana/vim-textobj-function'
		Plugin 'thinca/vim-textobj-function-javascript'
        Bundle 'gcmt/wildfire.vim'
        Bundle 'junegunn/goyo.vim'
        Bundle 'amix/vim-zenroom2'
        Bundle 'nginx.vim'
        Bundle 'editorconfig/editorconfig-vim'
        Plugin 'maksimr/vim-jsbeautify'
        Plugin 'christoomey/vim-tmux-navigator'
    " }

    " Color {
        Bundle 'spf13/vim-colors'
        Plugin 'morhetz/gruvbox'
    " }
    "

    " General Programming {
        " Pick one of the checksyntax, jslint, or syntastic
        Bundle 'scrooloose/syntastic'
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'tpope/vim-commentary'
        Bundle 'godlygeek/tabular'
        Plugin 'Shougo/unite.vim'
        Plugin 'terryma/vim-expand-region'
    " }

    " Snippets & AutoComplete {
        Bundle 'honza/vim-snippets'
        Bundle 'Valloric/YouCompleteMe'
        Bundle 'SirVer/ultisnips'
        Bundle 'ervandew/supertab'
    " }

    " Javascript {
        Bundle 'elzr/vim-json'
        Bundle 'pangloss/vim-javascript'
        Bundle 'briancollins/vim-jst'
        Bundle 'kchmck/vim-coffee-script'
        Bundle 'jelera/vim-javascript-syntax'
        Plugin 'ternjs/tern_for_vim'
    " }

    " HTML {
        Bundle 'amirh/HTML-AutoCloseTag'
        Bundle 'hail2u/vim-css3-syntax'
        Bundle 'gorodinskiy/vim-coloresque'
        Bundle 'tpope/vim-haml'
        Bundle 'jade.vim'
        Bundle 'mattn/emmet-vim'
    " }

    " CSS {
        Bundle 'groenewege/vim-less'
    " }

" }


" General {

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8
    set relativenumber

    tnoremap <Esc> <C-\><C-n>

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    " To disable this, add the following to your .vimrc.before.local file:
    "   let g:spf13_no_restore_cursor = 1
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " Add exclusions to mkview and loadview
        " eg: *.*, svn-commit.tmp
        let g:skipview_files = [
            \ '\[example pattern\]'
            \ ]
    " }
" }

" Vim UI {

    let g:solarized_termcolors=256
    let g:rehash256 =1
    let g:molokai_original = 1
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    set noshowmode     "有了airline/powerline就不用在下面显示当前模式了
    "set t_Co=256
    colorscheme gruvbox
    set bg=dark         " Assume a dark background

    "set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    "let g:airline_theme = 'molokai'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_section_z=''

    if has('statusline')

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_keep_trailing_whitespace = 1
    "autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.jade set filetype=jade
    autocmd FileType jade setlocal expandtab shiftwidth=3 softtabstop=3

" }

" Key (re)Mappings {

    let mapleader = "\<Space>"
    let maplocalleader = '_'

    "let g:tmux_navigator_no_mappings = 1
   " tnoremap <M-h> <C-\><C-n><C-w>h
   " tnoremap <M-j> <C-\><C-n><C-w>j
   " tnoremap <M-k> <C-\><C-n><C-w>k
   " tnoremap <M-l> <C-\><C-n><C-w>l
   " nnoremap <M-h> <C-w>h
   " nnoremap <M-j> <C-w>j
   " nnoremap <M-k> <C-w>k
   " nnoremap <M-l> <C-w>l
    nnoremap  <M-h> :TmuxNavigateLeft<CR>
    nnoremap  <M-j> :TmuxNavigateDown<CR>
    nnoremap  <M-k> :TmuxNavigateUp<CR>
    nnoremap  <M-l> :TmuxNavigateRight<CR>
    "nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

    map <S-H> gT
    map <S-L> gt
    " Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cd. lcd %:p:h

    "缩进之后继续选择，也就是说可连续缩进
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Easier formatting
    nnoremap <silent> <leader>q gwip

    nnoremap <Leader>w :w<CR>
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
    vmap <Leader>P "+P
" }

" Plugins {

    "expand-region {
    vmap v <Plug>(expand_region_expand)
    vmap <S-v> <Plug>(expand_region_shrink)
    call expand_region#custom_text_objects({
        \ 'ic'  :0,
        \ 'i.'  :0,
        \ 'a"'  :0,
        \ 'a''' :0,
        \ 'a]'  :1,
        \ 'ab'  :1,
        \ 'aB'  :1,
        \ 'ii'  :1,
        \ 'ai'  :1,
        \ 'if'  :1,
        \ 'af'  :1,
        \ 'iF'  :1,
        \ 'aF'  :1,
        \ })
    "}


    " Unite {
    "
    if !exists('g:unite_source_menu_menus')
        let g:unite_source_menu_menus = {}
    endif
    let g:unite_source_menu_menus.git = {
        \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
    let g:unite_source_menu_menus.git.command_candidates = [
         \['▷ git status       (Fugitive)                                ⌘ ,gs',
            \'Gstatus']
    \]

    let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts = '--ignore ''node_modules''  '
    " }


    " TextObj User {
        if exists('g:loaded_textobj_camelcase')
          finish
        endif

        call textobj#user#plugin('camelcase', {
        \      '-': {
        \           '*pattern*': '[A-Za-z][a-z0-9]\+',
        \           'select': ['ac', 'ic'],
        \      },
        \   })

        let loaded_textobj_camelcase = 1

        if exists('g:loaded_textobj_dotseparated')
          finish
        endif


        call textobj#user#plugin('dotsep', {
        \   '-': {
        \     'select-a-function': 'FindDotA',
        \     'select-a': 'a.',
        \     'select-i-function': 'FindDotI',
        \     'select-i': 'i.',
        \   },
        \ })


        function! FindDotA()
            call search('\v(\.|\s|^)', 'eb', line('.'))
            let head_pos = getpos('.')
            call search('\v(\.|\s|$)', 'e', line('.'))
            let tail_pos = getpos('.')
            return ['v', head_pos, tail_pos]
        endfunction


        function! FindDotI()
            call search('\v(\.|\s|^)', 'eb', line('.'))
            " If not at the beginning of a line, move right.
            let char_under_cursor = getline('.')[col('.')-1]
            let in_first_col = col('.') == 1
            if !in_first_col || char_under_cursor =~ '\v(\.|\s)'
                normal! l
            endif
            let head_pos = getpos('.')
            call search('\v(\.|\s|$)', 'e', line('.'))
            " If not at the end of a line, move left.
            let char_under_cursor = getline('.')[col('.')-1]
            let in_last_col = col('.') == col('$') - 1
            if !in_last_col || char_under_cursor =~ '\v(\.|\s)'
                normal! h
            endif
            let tail_pos = getpos('.')
            return ['v', head_pos, tail_pos]
        endfunction


        let g:loaded_textobj_dotseparated = 1
    " }

    " TextObj Sentence {
        augroup textobj_sentence
          autocmd!
          autocmd FileType markdown call textobj#sentence#init()
          autocmd FileType textile call textobj#sentence#init()
          autocmd FileType text call textobj#sentence#init()
        augroup END
    " }

    " TextObj Quote {
        augroup textobj_quote
            autocmd!
            autocmd FileType markdown call textobj#quote#init()
            autocmd FileType textile call textobj#quote#init()
            autocmd FileType text call textobj#quote#init({'educate': 0})
        augroup END
    " }



    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " NerdTree {
        map <F1> <plug>NERDTreeTabsToggle<CR>
        map <S-F1> <plug>NERDTreeTabsFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
        let NERDTreeMinimalUI=1
        let NERDTreeDirArrows=1
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$','.DS_Store','.idea']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }

    " js-beautify {
        autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
        autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
        autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
        autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
    " }

    " Tabularize {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
        " 输入|时候自动format
        inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
        function! s:align()
          let p = '^\s*|\s.*\s|\s*$'
          if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
          endif
        endfunction
    " }

    " Session List {
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>
    " }

    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        let g:vim_json_syntax_conceal = 0
    " }

    " ctrlp {
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        if executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        elseif executable('ack-grep')
            let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
        elseif executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
        elseif WINDOWS()
            let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        if exists("g:ctrlp_user_command")
            unlet g:ctrlp_user_command
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }

        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        "funky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
    "}

    " TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
        endif
    "}


    " UndoTree {
            nnoremap <Leader>u :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle=1
    " }

    " indent_guides {
        if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    " }

    " Wildfire {
    let g:wildfire_objects = {
                \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
                \ "html,xml" : ["at"],
                \ }
    " }
    "  Youcompleteme with ultisnips and supertab
    let g:UltiSnipsExpandTrigger          =     "<tab>"
    let g:UltiSnipsListSnippets            =  "<c-l>"
    let g:UltiSnipsJumpForwardTrigger       = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger       ="<s-tab>"
    let g:ycm_key_list_select_completion = ['<C-n>','<DOWN>']
    let g:ycm_key_list_previous_completion = ['<C-p>','<UP>']
    let g:SuperTabDefaultCompletionType = '<C-n>'
    "  }

" }


" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        let common_dir = parent . '/.' . prefix
        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }
" }
