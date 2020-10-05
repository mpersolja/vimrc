" enable syntax highlight
syntax on

" set tab width to 2 spaces
set tabstop=2
set shiftwidth=2
" replace tabs with spaces
set expandtab
" to insert real tab use 'Ctrl-V<TAB>'

set number relativenumber
set ai
" highlight search term (case insensitive)
set hls ic
" split policy
set splitbelow
set splitright

" timeout length
set timeoutlen=500

" text width for wrapping
set textwidth=80

" colorscheme
colorscheme dracula

highlight ColorColumn ctermfg=11 ctermbg=236 
set colorcolumn=80
set ruler

" show matching bracket
set showmatch
" time (tenth of a second) to highlight matching bracket
set mat=3

" emmet
let g:user_emmet_mode='a' " enable all functions in all mode
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-m>'
autocmd FileType html,css,vue,md,php,twig EmmetInstall " enable just for html/css


" notes
:let g:note_markdown_dir = '~/documents/notes'

" vim markdown
set conceallevel=0
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_strikethrough = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'python=py', 'javascript=js', 'php=php']

" nerdcommenter
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" show whitespaces (kinda)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

if exists("+showtabline")
  set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight for tab number and &modified
    let s .= '%#TabLineSel#'
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ':'
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0  " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLine#'
    else
      let s .= '%#TabLineSel#'
    endif
    " add buffer names
    let s .= n
    " switch to no underlining and add final space to buffer list
    let s .= '%#TabLineSel#' . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction

endif
