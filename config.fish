function fish_prompt
	echo (prompt_pwd) "λ "
end

# Aliases
## Text Editor
alias emd "Emacs --daemon"
alias em  "emacsclient -c -n"

## Git
alias gs   "git status"
alias ga   "git add -A"
alias gc   "git commit"
alias gpom "git push origin master"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

