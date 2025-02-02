
## git命令

暂存区中的变更到本地仓库，并添加一个描述信息：

```sql
git commit -m "Initial commit"
```

**版本回退**
要将Git存储库版本回退，请使用git reset命令。如果您想要撤消上次提交并返回到上一个提交，则可以使用以下命令：

```
git reset HEAD~1
```

这将使HEAD指向上一个提交，但不会删除您最新的更改。如果您希望完全返回到以前的提交并放弃所有更改，则可以添加--hard选项：

```
git reset --hard HEAD~1
```

添加远程仓库的URL，其中 `<remote-name>`是自定义名称，`<remote-url>`是远程仓库的URL：

```
git remote add 
```

可以使用以下命令确认远程仓库是否已成功添加：

```
git remote -v
```

创建与合并分支
创建一个新的分支可以使用以下命令：

```
git branch 
```

这将在当前所在的提交上创建一个名为 <branch_name> 的新分支。

要切换到新创建的分支，可以使用以下命令：

```
git checkout 
```

创建并立即切换到该分支，可以使用以下命令：

```
git checkout -b 
```

合并分支可以使用以下命令：

```
git merge 
```

当前开发分支（如 develop 分支）创建一个新的 bug 分支：

```
git checkout -b bug/fix-xxx
```

删除远程分支：

```
git push --delete origin
```

查看远程分支

git branch -f

抓取分支
在 Git 中，抓取分支指从远程仓库拉取最新的代码和分支信息，并在本地创建相应的分支。以下是在 Git 中抓取分支的一些常用命令：

拉取所有远程分支并更新本地分支：

```
git fetch --all
```

拉取一个特定的远程分支到本地：

```
git fetch origin xx
```

取回更新后，会返回一个 `FETCH_HEAD` ，指的是某个branch在服务器上的最新状态，我们可以在本地通过它查看刚取回的更新信息：

```
git log -p FETCH_HEAD
```

如要合并

```
git merge FETCH_HEAD
```

在本地创建基于远程分支的新分支

```
git checkout -b `<new-branch-name>` origin/`<remote-branch-name>`
```

**推送新分支到远程仓库**

git push origin `<new-branch-name>`

**设置远程跟踪分支**

git push -u origin `<new-branch-name>`
