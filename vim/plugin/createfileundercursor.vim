" Create or go to file under cursor
" # TODO: add mkdir -p in order to create directories if they don't still exist
nnoremap <silent> gf :call JumpOrCreateFile()<CR>
function! JumpOrCreateFile()
 " Get the filename under the cursor
 let filename = expand("<cfile>")

 " Expand the tilde in the file path
 let expanded_filename = expand(filename)

 " Check if the file path starts with "./"
 if expanded_filename =~# '^\.\/'
   " Get the current directory of the editing file
   let current_directory = expand('%:p:h')

   " Create the full path by appending the relative file path
   let expanded_filename = current_directory . '/' . expanded_filename
 endif

 " Check if the file exists
 if !filereadable(expanded_filename)
   " Prompt the user for file creation with the full path
   let choice = confirm('File does not exist. Create "' . expanded_filename . '"?', "&Yes\n&No", 1)

   " Handle the user's choice
   if choice == 1
     " Create the file and open it
     execute 'edit ' . expanded_filename
   endif
 else
   " File exists, perform normal gf behavior
   execute 'normal! gf'
 endif
endfunction
