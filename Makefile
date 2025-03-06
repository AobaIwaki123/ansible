prune-branch:
	@git remote prune origin
	@gir branch | xargs git branch -d 
