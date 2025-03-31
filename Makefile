prune-br:
	@git remote prune origin
	@git branch | xargs git branch -d 

apply-ssh-config:
	@cp -r ssh_config.d ~/.ssh/
