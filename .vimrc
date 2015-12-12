set fileencodings=iso-2022-jp,euc-jp,cp932,utf8,default,latin1
set number
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set autoindent
"Auto matching bracket
inoremap {<CR> {<CR><BS>}<Esc>ko
inoremap {} {}<Left>
inoremap        ()  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap "" ""<Left>
inoremap [] []<Left>
set title
set incsearch
set showmatch
set hlsearch
" Switching between mode 
inoremap ff <ESC><Right>
nnoremap ff <nop>
vnoremap ff <ESC>
inoremap gg <end>
nnoremap gg <end>i<right>
vnoremap gg <end>
inoremap ww <home>
nnoremap ww <home>i
vnoremap ww <home>
vnoremap cc y
nnoremap cc yy
inoremap cc <ESC>yyi
inoremap cv <ESC>pi
nnoremap cv p
nnoremap aa <ESC>i
nnoremap t<Right> :tabn<CR>
nnoremap t<Left> :tabp<CR>
 
 " Page up and Page down
 inoremap <C-f> <ESC><C-f>i
 inoremap <C-b> <ESC><C-b>i
  
 syntax on
 colorscheme slate
set ruler
set title 
set mouse=a

autocmd Filetype java set makeprg=javac\ %
""set eorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <C-m> :make<Return>:copen<Return>
map <F5> :cprevious<Return>
map <F6> :cnext<Return>
""set shellcmdflag=-ic
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
    let expanded_cmdline = a:cmdline
	  for part in split(a:cmdline, ' ')
		       if part[0] =~ '\v[%#<]'
				           let expanded_part = fnameescape(expand(part))
						           let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
								        endif
										  endfor
										    botright new
											  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
											    call setline(1, 'You entered:    ' . a:cmdline)
												  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
												    call setline(3,substitute(getline(2),'.','=','g'))
													  execute '$read !'. expanded_cmdline
													    setlocal nomodifiable
														  1
														  endfunction]]
command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)

