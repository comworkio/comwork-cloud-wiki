# Git

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/git.md)

## Disclaimer

This tutorial is a translation of this [training repository](https://gitlab.comwork.io/comwork_public/training/git) (which was originaly written in French).

## Cloning a repository

In order to download a local working copy of a distant git repo:

```shell
git clone <repository url>
```

## Creating a branch

All branches must start from the `main` branch (previously the `master` branch but you can rename your default protected branch all you want, we'll keep `main` in this tutorial). 

```shell
git pull --rebase origin main
git checkout -b <feature or bug ticket number>
git push origin <feature or bug ticket number>
```

## Updating a branch

```shell
git pull --rebase origin <feature or bug ticket number>
```

## Commit and push on a branch

It's important to do it regularly and not waiting for too much changes.

Warning: the commit doesn't reflect the modifications on the remote git server. It is the push operation that will do so.

```shell
git add . # run it in the root folder repository
git commit -m "<feature or bug ticket number> comment"
git push origin <feature or bug ticket number>
```

## Renaming a branch

```shell
git checkout your_branch
git checkout -b your_new_branchname
git push origin your_new_branchname
git branch -D your_branch # delete the old branch locally
git push -d origin your_branch # delete on the remote server
```

## Stash

`stash` is usefull to keep a changes in sort of clipboard without making a commit revision in your history.

```shell
git stash
git stash list # list the existing stash
git stash pop <stash id> # take out the changes from the stash (generally in order to commit) 
git stash pop # take out all the changes that had been stashed
git stash clear # emptying the stash stack
```

## Resolving conflicts during the branch update

Conflicts occurs sometimes when you execute this command: `git pull --rebase origin <feature or bug ticket number>`

```shell
CONFLICT (content): Merge conflict in FILENAME
```

It's necessary to resolve all the conflicts on the mentioned files. In order to achieve that, use your favorite IDE which should have a `git > resolved conflicts` kind of feature. Be careful to take the correct version of the conflicting lines and `add` the files in the conflict has been resolved.

Here's an example using VSCode:

![conflicts](../img/conflicts.png)

* Click on `Accept Incoming Change` if the version of reference branch (here `main`) is more up to date than your local version

* Click on `Accept Current Change` if your local version is more up to date than the `main`'s one

* Click on `Accept Both Changes` and modify manually behind if you must have both codes at the same time.

Go back and rerun the tests to check that there is no regression.

If you resolve the conflicts manually, then here are the commands to perform once you judge that the file in conflict is well resolved:

```shell
git add FILENAME
git rebase --continue
```

Aborting:

```shell
git rebase --abort # abort the rebase
git reset --hard origin/<feature or bug ticket number> # reset from the remote branch
```

## Merge main into a feature branch

In order to gradually integrate the changes of `main` in our branch in order to avoid that the desynchronization is too heavy, it's necessary to regularly merge `main` in this branch. 

At each end of sprint, this merge is mandatory. Also before performing the local merge you should update your branch to be able to push this merge commit immediately afterwards.

The reason is the following: if in the meantime another commit has been made on the branch, the merge commit will appear as the branch commit and all changes to `main` will end up in the merge resquest.

```shell
git checkout main
git pull --rebase origin main
git checkout <feature or bug ticket number>
git pull --rebase origin <feature or bug ticket number>
git merge main
git push origin <feature or bug ticket number>
```

This can be automated with the following bash script:

```shell
#!/usr/bin/env bash

if [[ ! $1 =~ ^[0-9\\-]+]]; then
    echo "Missing number of story"
    exit 1
fi

branchref="main"
if [[ $2 =~ ^[0-9\\-]+]]; then
    branchref="$2"
fi

git checkout "$branchref"
git pull --rebase origin "$branchref"
git checkout "$1"
git pull --rebase origin "$1"
git merge "$branchref"
git push origin "$1"
```

## Resolving conflicts during the merge

Conflicts occurs sometimes when you execute this command `git merge main`:

```shell
CONFLICT (content): Merge conflict in FILENAME
```

It's necessary to resolve all the conflicts on the mentioned files. In order to achieve that, use your favorite IDE which should have a `git > resolved conflicts` kind of feature. Be careful to take the correct version of the conflicting lines and `add` the files in the conflict has been resolved.

Here's an example using VSCode:

![conflicts](../img/conflicts.png)

* Click on `Accept Incoming Change` if the version of reference branch (here `main`) is more up to date than your local version

* Click on `Accept Current Change` if your local version is more up to date than the `main`'s one

* Click on `Accept Both Changes` and modify manually behind if you must have both codes at the same time.

Repassez derrière et refaite des tests pour vérifier qu'il n'y a pas de régression.

Si vous resolvez les conflits manuellement, voici ensuite les commandes à effectuer une fois que vous jugez que le fichier en conflit est bien résolu :

```shell
git add FILENAME
git merge --continue
```

Aborting:

```shell
git merge --abort # abort the merge
git reset --hard origin/<feature or bug ticket number> # reset from the remote branch
```

## Manual merge from a branch into main

Not all developers have the permission to do so. It's generally better to use a "merge request" or a "pull request" on your git repository provider (Gitlab, Github, Gitea, whatever).

In order to perform the merge locally, you have to update `main` first then push the merge commit immediatly afterwards.

```shell
git checkout <feature or bug ticket number>
git pull --rebase origin <feature or bug ticket number>
git checkout main
git pull --rebase origin main
git merge <feature or bug ticket number>
git push origin main
```

Then you can delete the remote branch:

```shell
git push -d origin <feature or bug ticket number>
```

## Demo

Here's the demo scenario:

```shell
#################
# Init git repo #
#################
 
# User 1
mkdir poc-git; cd poc-git; git init; touch README; touch BRANCH; git add README BRANCH; git commit -m 'first commit'; git remote add origin https://gitlab.comwork.io/comwork_public/training/git; git push -u origin main
 
#################
# Basic usecase #
#################
 
# User 2
git clone https://gitlab.comwork.io/comwork_public/training/git poc-git-2; cd poc-git-2; git checkout -b 0000; echo "branch changes" >> BRANCH; git add BRANCH; git commit -m "branch changes"; git push origin 0000
 
# User 1
echo "main changes" >> README; git add README; git commit -m "main changes"; git push origin main; echo "bis changes" >> README; git add README; git commit -m "bis changes"; git push origin main
 
# User 3
git clone https://gitlab.comwork.io/comwork_public/training/git poc-git-3; cd poc-git-3; git checkout 0000; echo "branch bis changes" >> BRANCH; git add BRANCH; git commit -m "branch bis changes"
 
# User 2
git checkout main; git pull --rebase origin main; git checkout 0000; git pull --rebase origin 0000; git merge main
git push origin 0000
 
# User 3
git pull --rebase origin 0000; git push origin 0000
 
==>> Merge request: OK
 
#####################################
# Conlit during the merge with main #
#####################################
 
# User 1
echo "my changes" >> BRANCH; git add BRANCH; git commit -m "main changes on branch"; git push origin main
 
# User 2
git checkout main; git pull --rebase origin main; git checkout 0000; git pull --rebase origin 0000; git merge main
==>> CONFLIT (content) : Conflict merge into BRANCH
vi BRANCH
git add BRANCH; git commit
git push origin 0000
 
==>> Merge request: only on the branch changes
 
###################
# Conflit on 0000 #
###################
 
# User 3
git pull --rebase origin 0000; echo "branch conflict changes" >> BRANCH; git add BRANCH; git commit -m "branch conflict changes"; git push origin 0000
 
# User 2
echo "branch conflit bis resolution" >> BRANCH; git add BRANCH; git commit -m "branch conflit bis resolution"; git pull --rebase origin 0000
==>> CONFLIT (content) : Conflict merge into BRANCH
vi BRANCH
git add BRANCH; git rebase --continue
==>> Application : modif branch conflit bis
git push origin 0000
 
==>> Network GitLab: OK
 
#######################
# Last optional merge #
#######################
 
# User 1
echo "ter changes" >> README; git add README; git commit -m "ter changes"; git push origin main
==>> Merge request: Accept Merge Request
```

## Commit and push changes on a branch

```shell
git commit -am "Deleting useless file"
[develop2 aab887a] Deleting useless file
 1 file changed, 31 deletions(-)
 delete mode 100644 .classpath
git push origin <feature or bug ticket number>
Counting objects: 2, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 233 bytes | 0 bytes/s, done.
Total 2 (delta 1), reused 0 (delta 0)
remote: 
remote: Create merge request for develop2:
remote:   https://gitlab.comwork.io/xxxxxxxxx?merge_request%5Bsource_branch%5D=develop2
remote: 
To https://gitlab.comwork.io/xxxxxxxxx.git
   a778234..aab887a  develop2 -> develop2
```

## Deleting a branch

```shell
git branch -d <feature or bug ticket number> # local delete
git push -d afterwards <feature or bug ticket number> # delete the remote branch
```

## Reseting a branch

```shell
git reset --hard origin/<feature or bug ticket number>
```

## Squashing commit and cleaning/rewriting history

Sometimes we might want to merge commits or rewrite the history for various reasons. For example :

* The branch or ticket number is missing in the comment (or the comment is not following a mandatory semantic)
* There is too many commits because a lot of code review's returns were processed in the merge request and we risk losing the readability of the history logs
* We need to be easily able to defer a change in another branch (`git cherry-pick`) or rollback (`git revert`)
* Etc

For this reason, there is an amazing tool which is called the "interactive rebase". However, this procedure must only be used if the following conditions are met:

* The commits we want to rebase are consecutives (there is no merge commit between them for example)
* The branch is not merged yet on a protected branch (`main` for example)

Here's an example to merge the last 46 commits and change the comment of the first one:

1. Run the following command:

```shell
git rebase -i HEAD~46
```

2. An editor is opening:

![git_rebase_i_1](../img/git_rebase_i_1.png)

=> Replace the `pick` of the first commit by `r` (or `reword`) the the following by `f` (or `fixup` which is pretty similar to `squash` or `s` except that it will not propose a merge of all the comments but will automatically take the first one).

Save-it.

1. Another editor is opening:

![git_rebase_i_2](../img/git_rebase_i_2.png)

Then rewrite the result commit message with a message that sums up the whole feature (try to make it better ;) ).

N.B: you should add the number of tickets or issues (with a `#` in front of them when they are issues of gitlab or github so that the latter directly repatriate the comments of the commits in the issues in question).

1. Check the history log:

```shell
git log
```

1. Push and check on your git repo provider (Gitlab, Github, Gitea, whatever):

```shell
git push origin <feature or bug ticket number> -f
```
