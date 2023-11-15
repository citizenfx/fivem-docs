---
title: Rebase Guide
weight: 970
---

Rebase or 'rebasing' is great for updating your branch to be up-to-date with another branch, this is done by picking a new 'base' for your working branch and apply all the changes you made on top. This is ideal when you made changes, let's say, a year ago and merging those are no longer viable as a result of merge conflicts or it would no longer be called if it was actually merged. You can rebase it instead, resolve any merge conflicts, test if it still works, and update or apply for another pull-request.

**To clarify:**

- Rebasing does not change the content of the original commits in the master branch (or the commits thereof).
- Rebasing adds new commits on top of the master branch, effectively extending the branch's commit history with the changes from the feature branch.
- Rebasing does not create an additional merge commit.

The original commit history of the master branch is preserved, and new commits from the feature branch are added (or replayed) on top of the tip of the master branch (also known as the most recent commit), creating a linear history.

# Prerequisites
 - [Git][git-download]
 - [Github Desktop][github-desktop] or [Visual Studio Code][vscode-download]

# Ways to Rebase
- [Rebasing using a GUI](#rebasing-using-a-gui)
    - [Rebasing using Github Desktop](#rebasing-using-github-desktop)
    - [Rebasing using Visual Studio Code](#rebasing-using-visual-studio-code)
- [Rebasing using Git's CLI](#rebasing-using-gits-cli)



# Rebasing using a GUI
### Rebasing using Github Desktop

1. Update your master branch to be in sync with our repository:
    1. Via browser and GitHub: go to your fork of the fivem repository and press `Sync fork`, followed by `Update branch`.

    ![image](/contributing/git/rebase-guide/github-sync-fork-update-branch.png)

    2. In GitHub Desktop press `Fetch origin` followed by `Pull origin`, if any new changes are available.

        ![image](/contributing/git/rebase-guide/github-desktop-fetch.png)

        ![image](/contributing/git/rebase-guide/github-desktop-pull.png)

    3. Your master branch is now up-to-date with our repository and can be used as your new base.
2. Rebase your working branch in GitHub Desktop:
    1. Switch to the branch you want to rebase, in this example we use `my-feature` as our branch name.  
        ![image](/contributing/git/rebase-guide/github-desktop-switch-branch.png)

    2. Once you're on the `my-feature` branch you want to rebase, go to `Branch` in the top menu bar and choose `Rebase current branch...`.
    3. It'll show you a window with all available branches to rebase it to, pick `master`.
    4. The same window will show you that it will update our `my-feature` branch by applying its `x` commits on top, make sure the amount of commits is the same as the commits you applied.  
        ![image](/contributing/git/rebase-guide/github-desktop-rebase-branch.png)

    5. Hit `Rebase` and it will pull in all commits of the master branch and then put your commits on top.
        1.  If there are any conflicts, you'll be prompted and you'll need to resolve those.
    6. Test if your code still compiles and that the changes are working as expected, adjust otherwise.
    7. Now you can force-push your `my-feature` branch to GitHub
        1. If you made extra changes then the force-push option is probably gone, you can go into the CLI and type `git push --force-with-lease` or to get the button back in GitHub Desktop you can right-click on the last commit, hit `Amend Commit...` and confirm the amendment without any changes, it'll show the force push option again. `--force-with-lease` allows you to push changes safely when working with other collaborators. You may want to use `git push -f` if you're the sole contributor.
        2. Any open PR will be automatically updated.

### Rebasing using Visual Studio Code

1. Launch Visual Studio Code
2. Switch to the branch you want to integrate changes to:
    - On the bottom left corner of the Visual Studio Code window you should see a button, click on it and select the branch you want to check out to. We're going to choose `my-feature`.

        ![img](/contributing/git/rebase-guide/visual-studio-code-switch-branch-btn.png)

        ![img](/contributing/git/rebase-guide/visual-studio-code-switch-branch-to-master.png)
3. Now that you're on the branch you want to integrate your changes onto, click on `Source Control` located on the left navigation bar.
4. Once you're on `Source Control`, click on three dots (...) -> Branch -> Rebase Branch...
    ![img](/contributing/git/rebase-guide/visual-studio-code-rebase-branch-btn.png)

5. Let's pick `master` by clicking on it for this tutorial.
    ![img](/contributing/git/rebase-guide/visual-studio-code-pick-rebase-branch.png)
    1. If there are conflicts, you will be prompted to resolve those in order to continue with the rebase process.

6. Test if your code still compiles and that the changes you made are working as expected, adjust otherwise.

7. Now you may force-push your `my-feature` branch to github using `git push --force-with-lease`, that's because you may be working with other collaborators that also happen to be working in the same branch (so you don't overwrite their changes). You may use `git push -f` otherwise.


# Rebasing using Git's CLI

To transfer all the commits from the feature branch into the master branch using rebase, you can follow these steps:

1. Update your master branch to be in sync with our repository (switch to the master branch if you're not on it, using `git switch master`):

    ```
    git pull upstream/master
    ```

    Your local master branch should now be up to date with our repository. Now you should push those changes back to your Github remote repository using the following command so your local changes are reflected on the remote:
    
    ```
    git push origin master
    ```

2. Now switch to the branch you want to rebase, for this example we're going to use `my-feature`, fetching may be needed if you don't have the branch locally yet (for this use case, we will assume you don't):

    ```
    git fetch
    git checkout my-feature
    ```
    
3. Now we will rebase our `my-feature` branch by taking the changes made in `master` and applying them into `my-feature`.

    ```
    git rebase master
    ```

    This will integrate the commits from `master` (which is specified as a target in the command up above) into your `my-feature` branch and put `my-feature`'s commits on top of those, while maintaining the continuity of your `my-feature` branch's history.

4. If there are merge conflicts between the `my-feature` and `master` branches, the rebase process will be paused and you will be asked to resolve said conflicts. Once the conflicts are resolved, you may run the following `Git` command down below.

    ```
    git rebase --continue
    ```

    1. You may need to repeat the previous step multiple times depending on the amount of conflicts between branches.

5. Test if your code still compiles and that the changes you made are working as expected, adjust otherwise.

6. Now you may force-push your `my-feature` branch to github using `git push --force-with-lease`, that's because you may be working with other collaborators that also happen to be working in the same branch (so you don't overwrite their changes). You may use `git push -f` otherwise.

# What will the changes look like?

Once you complete the steps (regardless of the guide you chose), all the commits from the `master` branch will be added to the `my-feature` branch, and the commit history will be linear. The original history of the `master` branch will remain intact, and it will look as if the work done in the `feature` branch was developed directly on the `master` branch.

## CLI

**This is how the commit log would look (using oneline parameter)**

```
6724b52 (HEAD -> my-feature) Add more screenshots.
96bdd8c (master) Add more changes so my-feature branch gets left behind.
bad9820 My files and stuff.
```

Commit `6724b52` indicates within parentheses that said commit was rebased from the `my-feature` branch.

## Github Desktop

On Github Desktop, you can view the change history (similar to the `git log` CLI command, but with a GUI) by going to the left pane and clicking on the History tab.

![image](/contributing/git/rebase-guide/github-desktop-history-tab.png)

## Visual Studio Code

While Visual Studio code doesn't have a way to view a detailed list of changes from its GUI, you may still view timeline changes on files by clicking 'Explorer' on the left pane at the top and clicking on a specific file under the 'TIMELINE' view.

![image](/contributing/git/rebase-guide/visual-studio-code-timeline-view.png)

_**Note:** Image doesn't match the previous commit history, it's mainly being used for demonstration purposes only._

### Extension: GitLens
You may also install an extension such as [GitLens][gitlens-extension] to see the commit history and access the commit log by going to `Source Control -> Commits`.

![image](/contributing/git/rebase-guide/visual-studio-code-source-control-commits-gitlens.png)

### Terminal
Last but not least, you may see the commit history by opening up the terminal and typing `git log`. You may also type `git log --oneline` to see the commits in a compact fashion. 

You can open the terminal by going to the topmost menu bar, clicking on `Terminal`, proceeded by `New Terminal`. 

> Hint: You may also open the terminal by using its hotkey ````CTRL + SHIFT + ` ````. The last key is backtick for users with a different keyboard layout.

![image](/contributing/git/rebase-guide/visual-studio-code-log-terminal.png)



[git-download]: https://git-scm.com/downloads
[github-desktop]: https://desktop.github.com/
[vscode-download]: https://code.visualstudio.com/download
[gitlens-extension]: https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
