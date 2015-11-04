"Quick editing of tex config
nmap <leader>et :split ~/.vim/ftplugin/tex/tex.vim<cr>
nmap <leader>st :source ~/.vim/ftplugin/tex/tex.vim<cr>

"Three letter maps in insert mode
"call IMAP('NOM', '\nomenclature{<++>}<++>', 'tex')
"
"Useful Maps that are missing
"
call IMAP('`F', '\Phi', 'tex')
call IMAP('`P', '\Pi', 'tex')
call IMAP('`O', '\Omega', 'tex') "also mapped to `W
call IMAP('mbb', '\mathbb{<++>}<++>', 'tex')
call IMAP(',.b', '\mathbb{<++>}<++>', 'tex')
call IMAP('mbf', '\mathbf{<++>}<++>', 'tex')
call IMAP(',.f', '\mathbf{<++>}<++>', 'tex')
call IMAP('CAL', '\mathcal{<++>}<++>', 'tex')
call IMAP(',.c', '\mathcal{<++>}<++>', 'tex')
call IMAP('`n', '\eta', 'tex') "currently maps to \nu"
call IMAP('`w', '\omega', 'tex') 
call IMAP('`o', '\omega', 'tex') 
call IMAP('`-', '\bar{<++>}<++>', 'tex')
call IMAP('`_', '\ubar{<++>}<++>', 'tex') "needs macro in preface
call IMAP('`..', '\cdot', 'tex') "needs macro in preface

"quadratic variation
call IMAP('<>', "<<++>><++>", 'tex')

"Nicer indentation on parens maps
call IMAP('((', "\\left(<++>\\right)<++>", 'tex')
call IMAP('{{', "\\left\\{<++>\\right\\}<++>", 'tex')
call IMAP('[[', "\\left[<++>\\right]<++>", 'tex')

	"Fancy vs flat fractions
"call IMAP('`/', "\\frac{<++>}{<++>}<++>", 'tex')
call IMAP('`./', "\\frac{<++>}\<CR>{<++>}<++>", 'tex')

"Own equation standards
call IMAP('EEQ', "\\begin{equation*}\<CR><++>\<CR>%\\label{<++>}\<CR>\\end{equation*}\<CR><++>", 'tex')
"Good shortcuts
"call IMAP('`6', "\\partial<++>", 'tex')
call IMAP('`.6', "\\frac{\\partial<++>}<++}{\\partial<++>}<++>", 'tex')


"%Editing in insert mode
call IMAP(mapleader.'tt', "\\todo[size = \\tiny]{\<CR><++>\<CR>}<++>", 'tex')
"Editing in normal mode
nnoremap <leader>tt a<CR>\todo[size = \tiny]{<CR><CR>}<CR><++><esc>2ki
"Compiler customization
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
"Set pdf target (why do people use dvi? don't get it. Also it gives me
"problems using .png images.
"
let g:Tex_DefaultTargetFormat = 'pdf'
"For F5 fill in. I believe once defined they can be added to prompted environments
"Recall notation: special keys are '\<key>', backslashes are doubled/escaped
"let g:Tex_Env_theorem = "\\begin{theorem}\<CR>\<CR>\\end{theorem}"
let g:Tex_Env_frame = "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_Env_subfigure = "\\begin{figure}\<CR>\\centering\<CR>\\begin{subfigure}[b]{<++>\\textwidth}\<CR>\\includegraphics[width= <++> \\textwidth]{<+filenamehere+>}\<CR>\\end{subfigure}\<CR>\\begin{subfigure}[b]{<++>\textwidth}\<CR> \includegraphics[width=<++>\textwidth]{<++>}\<CR>\\end{subfigure}\<CR> \caption{<++>}\<CR>\\label{<++>}\<CR> \end{figure}\<CR><++>"

"Generally, things set in texrc with TexLet have to be set here with let
"Prompted Menus. Unclear what the relative gains are versus "TMacro" in macros folder
let g:Tex_PromptedEnvironments =
	\ 'frame,theorem,theorem*,equation,equation*,gather,gather*,$$,align,align*,center'

"Note that any macros defined at the top of the document will be inserted in
"this menu, too.
let g:Tex_PromptedCommands = 
   \ 'text,frac,tilde,bar,footnote,ref,eqref,cite,pageref,label,uncover'

let g:Tex_Com_uncover = "\\uncover<<+number+>>{\<CR><++>\<CR>}"

let g:Tex_Com_frac = "\\frac{\<CR><++>\<CR>}\<CR>{\<CR><++>\<CR>}\<CR><++>"
