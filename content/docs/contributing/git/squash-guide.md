---
title: Squash Guide
weight: 960
---

Squashing is a way to simplify your commits and combine multiple commits into one.

### How do I squash my commits?

- **[Using Github Desktop](#using-github-desktop)**: Github Desktop will provide you with a user-friendly interface, it's mainly tailored to new software developers that are not familiar with the CLI and its uses.

- **[Using Git's CLI](#using-gits-cli)**: With Git's CLI (Command Line Interface), you can easily squash commits by 'rebasing', which is basically a way to re-write your commit history. It's an option tailored for users that have already been using Git for a while and are familiar with command line interfaces. It offers more flexibility and granularity, where a GUI may not.

### Using Github Desktop

#### Squashing commits

Squashing commits using [Github Desktop](https://desktop.github.com/) is a simple task, you can do so by following these steps:

1. Start Github Desktop
2. Once Github Desktop is open, head to View -> History on the topmost menu bar.  
    ![github-desktop-view-history](/contributing/git/squash-guide/github-desktop-view-history.png)
3. A history dialog showing the commits you want to squash will show. Select the ones you want to squash by holding down the `CTRL` key, or `SHIFT` key if there's a lot of commits you need to squash. Followed by right clicking the selected items and clicking on `Squash 'n' commits...`  

    ![github-desktop-commit-view](/contributing/git/squash-guide/github-desktop-squash-commits.png)  
4. A message box showing combined commit messages will show, you can modify this message if you need to. Click on `Squash 'n' Commits` to continue.

    ![github-desktop-squash-messagebox](/contributing/git/squash-guide/github-desktop-squash-commits-messagebox.png)
5. If you are pushing your changes to a remote repository, therefore re-writing commit history on the remote, you will get this message. Just click on 'Begin Squash'.  

    ![github-desktop-squash-push](/contributing/git/squash-guide/github-desktop-squash-requires-force-push.png)

6. Prior to pushing our changes, we should verify if our commit history is correct. This means not overwriting old commit history with the commits we just made. On Github Desktop, we can find the History tab on the left. By clicking on it we can see the history.  

    ![github-desktop-history](/contributing/git/squash-guide/github-desktop-commit-history.png)

    As shown in the image, our commits from two days ago (highlighted in blue) are still there, so that's good, we have kept our old commit history intact. _"Sentence seems better that way"_ would be our newly squashed commit. With this out of the way, we can now push our changes.

7. You should now click on a button that reads 'Force push origin', located on the topmost tooltip. It may take a few seconds before this button changes to the 'Force push origin' variant.

    ![github-desktop-force-push-tooltip](/contributing/git/squash-guide/github-desktop-squash-force-push-tooltip.png)

9. You will then get the following message box, warning you about what you're about to do and the implications it may have on any other collaborators. You may click on _I'm sure_ if you're the only collaborator.

    ![github-desktop-force-push-confirm](/contributing/git/squash-guide/github-desktop-squash-force-push-confirm.png)

10. Congratulations, you have squashed/combined multiple commits.

### Using Git's CLI

#### Prerequisites
 - Git
 - Basic knowledge on Git

#### Squashing commits
We can squash commits by using `git rebase -i HEAD~n` where `n` is the number of commits we want to combine from the `HEAD` commit and `-i`, which stands for interactive. 

So essentially, one would type the following into the console if we want to combine said commits (up to head, being the most recent commit):

```
git rebase -i HEAD~3
```

Doing so will show us the `vim` editor (or the one we have configured to use with git) where we can squash commits. For this guide, we will be using `vim`.

Once the editor is shown, press the `insert` key and change `pick` for `squash` on the commits you would like to squash/combine.

![squash-images](/contributing/git/squash-guide/vim-squash-commits.png "An image showing the commits we want to squash.")

Once you're happy with your changes, press the `escape` key to go into normal mode, followed by typing `:` (a colon) to enter command-line mode. Once command-line mode is available, type `wq` to write (save changes) and quit.

![squash-commit-messages](/contributing/git/squash-guide/vim-squash-commit-messages.png "An image showing a vim dialog with all the squash commit messages.")

A `vim` dialog (as shown in the image above) will show again in the console showing all the commit messages combined (you can edit it by pressing `insert`), to save and exit just repeat the previous step again (which entails going into console mode and saving changes).

And that's it... Your commits should now be squashed into one.

#### Verifying commit history

Before you push your changes to the remote branch, you should verify if your commit history is correct. What is meant by this is essentially; you are not overwriting old commit history with the commits you recently made. 

You can check this by typing `git log --pretty=oneline` or simply `git log --oneline`. You can find more about the `pretty` command-line argument [here](https://git-scm.com/docs/pretty-formats).

> Log documentation can also be found [here](https://git-scm.com/docs/git-log) if you are curious about it.

If the commit history looks correct (meaning commits before yours are still there) you can go ahead and push your changes.

#### Pushing your changes to the remote branch

You can now push your branch to the remote repository, to re-write your commit history remotely (in case you need to do so) you can do `git push --force-with-lease` which is less destructive than `git push --force` since it will prevent you from overwriting any new changes done by others, this is useful if you are working with other people.