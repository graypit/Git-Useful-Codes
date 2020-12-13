# Git Cherry Picker
### This script is going to get last commit of your file that your select on your current repository branch and apply to another one (branch)

<img src="https://mattstauffer.com/assets/images/content/opengraph/cherry-pick.png">

### How to install:
```bash
$ curl  > /usr/bin/git-cherry-picker 2>/dev/null
$ chmod +x /usr/bin/git-cherry-picker
```
### How to Use:
When you'll be into git repository directory just execute: `git-cherry-picker`

### Example:
For example you have a file - `mycode.go` in `staging` branch (your current branch),and you want to copy last modify of this file (last commit) to another branch as commit (e.g `delta-branch`).For it,you just run the following command:
```bash
$ git-cherry-picker mycode.go delta-branch
```
That's all.Cherry Pick Official documentation from GIT: 

https://git-scm.com/docs/git-cherry-pick
