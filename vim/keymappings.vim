"remap ; -> : and viceversa
noremap ; :
nnoremap : ;

"move lines up down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"smart way to move through windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move splits
map <A-J> <C-W>J
map <A-K> <C-W>K
map <A-H> <C-W>H
map <A-L> <C-W>L

let mapleader = "\\"
" search actions
noremap <leader>nh :let @/=''<CR>
noremap <leader>hn :let @/=''<CR>

"tab shortcuts
noremap <Leader>tt :tabnew<CR>
noremap <Leader>TT :tabclose<CR>

" wrap lines to text width
noremap <Leader>wt 0gqG

" open file explorer
noremap <Leader>e :Ex<CR>

" source current file
noremap <Leader><F12> :source %<CR>

" copy to clipboard
noremap <Leader>ky "+y
noremap <Leader>kp "+p

" insert dates
noremap <Leader>dtn :put =strftime('%Y-%m-%d %H:%m:%S')<CR>
noremap <Leader>dtt :put =strftime('%H:%M:%S')<CR>
noremap <Leader>dtd :put =strftime('%Y-%m-%d')<CR>
noremap <Leader>dti :put =strftime('%FT%T%z')<CR>
noremap <Leader>dtr :put =strftime('%a, %d %b %Y %H:%M:%S %z')<CR>

" insert <br> on ctrl-space
inoremap <C-Space> <br><CR>

" twig tags
imap \{{ {{  }}<ESC>3ha
imap \%% {%  %}<ESC>3ha
