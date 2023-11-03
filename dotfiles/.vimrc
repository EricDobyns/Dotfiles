""
"  File:
"    .vimrc
"
"  Author:
"    created by Eric Dobyns
"
"  Version:
"    0.03
"
"  Table_of_Contents:
"    -> General
"    -> VIM User Interface
"    -> Colors & Fonts
"    -> Files & Backups
"    -> Text, Tab & Indents
"    -> Visual Mode Related
"    -> Moving Around, Tabs & Buffers
"    -> Status Line
"    -> Editing Mappings
"    -> Spell Checking
"    -> Miscellaneous
"    -> Helper Functions
""



"===========================================================
" => General
"===========================================================

set nocompatible                                                     " Use vim settings rather than vi
set history=700                                                      " Sets how many lines of history VIM has to remember
filetype plugin on                                                   " Enable filetype plugins
filetype indent on                                                   " Enable ???
set autoread                                                         " Set to auto read when a file is changed from the outside
let mapleader = ","                                                  " Set , as a secondary Map Leader - Same as /
let g:mapleader = ","                                                " With a map leader it's possible to do extra key combinations



"===========================================================
" => VIM User Interface
"===========================================================

set so=7                                                             " Set x lines away from the edge - when using j or k
set nowrap                                                           " Do not wrap lines at edge of screen
set ruler                                                            " Display row and column coordinates (bottom right)
set cmdheight=2                                                      " Height of the command bar
set hid                                                              " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent                                       " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l                                               " Configure backspace so it acts as it should act
set ignorecase                                                       " Ignore case when searching
set incsearch                                                        " Makes search act like search in modern browsers
set smartcase                                                        " When searching try to be smart about cases
set lazyredraw                                                       " Don't redraw while executing macros (good performance config)
set magic                                                            " For regular expressions turn magic on
set showmatch                                                        " Show matching brackets when text indicator is over them
set mat=2                                                            " How many tenths of a second to blink when matching brackets
set noerrorbells                                                     " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

"Enables Searching
set hlsearch                                                         " Enables Searching
nmap <c-h> :set hls!<cr>
nnoremap / :set hlsearch<cr>/

" Toggle Relative Numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <C-o>     :ShowSpaces 1<CR>
nnoremap <C-p>   m`:TrimSpaces<CR>``
vnoremap <C-i>   :TrimSpaces<CR>



"===========================================================
" => Auto Complete
"===========================================================

set wildmenu  "Enable ctrl-n and ctrl-p to scroll thru matches

set wildmode=list:longest

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif



"===========================================================
" => Colors and Fonts
"===========================================================

"syntax on // TEMPORARILY DISABLE ALL COLORS
set cursorline
set cursorcolumn

set colorcolumn=20,40,60,80,100,120,140,160,180,200,220,240,260

highlight colorcolumn ctermbg=232
highlight CursorLine cterm=underline ctermbg=234
highlight CursorColumn ctermbg=234
highlight Search cterm=underline ctermbg=255

"" General
"highlight Normal ctermfg=15
"highlight Folded ctermfg=241
"highlight VertSplit ctermfg=245
"highlight TabLine ctermfg=15
"highlight TabLineFill ctermfg=15
"highlight TabLineSel ctermfg=16
"highlight MatchParent ctermfg=221
"highlight NonText ctermfg=238
"highlight SpecialKey ctermfg=238
""highlight Visual
""highlight VisualNOS
"highlight Search ctermfg=16
"highlight IncSearch ctermfg=16
"highlight Underlined ctermfg=fg
"highlight StatusLine ctermfg=16
"highlight StatusLineNC ctermfg=15
"highlight Directory ctermfg=222
"highlight Title ctermfg=154
"highlight ErrorMsg ctermfg=196
"highlight MoreMsg ctermfg=221
"highlight ModeMsg ctermfg=222
"highlight Question ctermfg=222
"highlight WarningMsg ctermfg=211
""highlight Tag
"highlight LineNr ctermfg=15
""highlight SignColumn
"highlight FoldColumn ctermfg=241
"highlight Cursor ctermfg=16
"highlight vCursor ctermfg=16
"highlight iCursor ctermfg=16
"highlight Special ctermfg=15
"highlight Comment ctermfg=154
"highlight Todo ctermfg=15
"highlight SpecialComment ctermfg=15
"highlight String ctermfg=13
"highlight Statement ctermfg=196
"highlight Keyword ctermfg=196
"highlight Conditional ctermfg=196
"highlight Operator ctermfg=196
"highlight Label ctermfg=196
"highlight Repeat ctermfg=196
"highlight Identifier ctermfg=214
"highlight Function ctermfg=214
"highlight PreProc ctermfg=154
"highlight Macro ctermfg=154
"highlight Define ctermfg=154
"highlight PreCondit ctermfg=154
"highlight Constant ctermfg=137
"highlight Character ctermfg=137
"highlight Boolean ctermfg=137
"highlight Number ctermfg=137
"highlight Float ctermfg=137
"highlight SpecialChar ctermfg=211
"highlight Type ctermfg=211
"highlight StorageClass ctermfg=196
"highlight Structure ctermfg=196
"highlight Typedef ctermfg=196
"highlight Exception ctermfg=154
"highlight Error ctermfg=15
"highlight Debug ctermfg=15
"highlight Ignore ctermfg=243
"highlight Pmenu ctermfg=15
"highlight PmenuSel ctermfg=16
""highlight PmenuSbar
"highlight PmenuThumb ctermfg=252
"highlight DiffDelete ctermfg=16
""highlight DeffAdd
""highlight DiffChange
"highlight DiffText ctermfg=15
"highlight SpellCap ctermfg=221
""highlight SpellBad
""highlight SpellLocal
""highlight SpellRare

""Filetype-specific

"" Clojure
"highlight clojureSpecial ctermfg=196
"highlight clojureDefn ctermfg=196
"highlight clojureDefMacro ctermfg=196
"highlight clojureDefine ctermfg=196
"highlight clojureMacro ctermfg=196
"highlight clojureCond ctermfg=196
"highlight clojureKeyword ctermfg=214
"highlight clojureFunc ctermfg=211
"highlight clojureRepeat ctermfg=211
"highlight clojureParen0 ctermfg=245
"highlight clojureAnonArg ctermfg=15

"" CSS
"highlight cssColorProp ctermfg=222
"highlight cssBoxProp ctermfg=222
"highlight cssTextProp ctermfg=222
"highlight cssRenderProp ctermfg=222
"highlight cssGeneratedContentProp ctermfg=222
"highlight cssValueLength ctermfg=137
"highlight cssColor ctermfg=137
"highlight cssBraces ctermfg=245
"highlight cssIdentifier ctermfg=214
"highlight cssClassName ctermfg=214

"" HTML
"highlight htmlTag ctermfg=95
"highlight htmlEndTag ctermfg=95
"highlight htmlTagName ctermfg=173
"highlight htmlSpecialTagName ctermfg=173
"highlight htmlSpecialChar ctermfg=154
"highlight htmlArg ctermfg=173
"highlight htmlLink ctermfg=245

"" Java
"highlight javaClassDecl ctermfg=196
"highlight javaScopeDecl ctermfg=196
"highlight javaCommentTitle ctermfg=243
"highlight javaDocTags ctermfg=15
"highlight javaDocParam ctermfg=221

"" Python
"highlight pythonBuiltin ctermfg=211
"highlight pythonBuiltinObj ctermfg=211
"highlight pythonBuiltinFunc ctermfg=211
"highlight pythonEscape ctermfg=211
"highlight pythonException ctermfg=154
"highlight pythonExceptions ctermfg=154
"highlight pythonPrecondit ctermfg=154
"highlight pythonDecorator ctermfg=196
"highlight pythonRun ctermfg=243
"highlight pythonCoding ctermfg=243

"" Javascript



"" Objective-C



"" PHP



"===========================================================
" => Files & Backups
"===========================================================
set nobackup "No backup file
set noswapfile "No .swp file
set nowb "No ???



"===========================================================
" => Text, tab and indent related
"===========================================================

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent



"===========================================================
" => Visual mode related
"===========================================================


"===========================================================
 " => Moving around, tabs, windows and buffers
"===========================================================


"===========================================================
 " => Status line
"===========================================================


"===========================================================
" => Editing mappings
"===========================================================


"===========================================================
" => vimgrep searching and cope displaying
"===========================================================


"===========================================================
" => Spell checking
"===========================================================


"===========================================================
" => Misc
"===========================================================


"===========================================================
" => Helper functions
"===========================================================

set showcmd
set showmode
set autoread
set hidden

set mouse=a
set autochdir

set showmatch
set expandtab
set t_Co=256
set virtualedit=all
set autoindent
set number
set numberwidth=1

inoremap jk <ESC>