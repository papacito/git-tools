# git-author-cleaner

Clean up your Git history by rewriting all commits with a new author — while preserving original commit and author dates.
Perfect for fixing cached work emails, cleaning old repos, and keeping your GitHub contribution graph accurate.

## When to use
- You accidentally used a work Git config on a side project
- You want to open-source a project under your personal identity
- You’re migrating old code into a cleaned-up repo

## Installation (make globally available)

To use the tools globally in your terminal, you can add the repo to your system `PATH`

### Clone the repo
```bash
git clone https://github.com/papacito/git-tools.git ~/.git-tools
```

### Add it to your shell config (e.g., ~/.zshrc or ~/.bashrc)
```bash
echo 'export PATH="$HOME/.git-tools/bin:$PATH"' >> ~/.zshrc
```

### Apply the change
```bash
source ~/.zshrc
```

### Make the script executable
```bash
chmod +x $HOME/.git-tools/bin/git-author-cleaner.sh
```

## Usage

```shell
git-author-cleaner.sh "Your Name <you@example.com>"
```
- Rewrites all commits in the current branch (starting from root)
- Keeps original author and committer dates
- Does not modify commit messages

When a "vi" shows up press `i` to edit then press `ESC` to leave the edit mode.
At the end type `:wq` to write down all the changes and close the "vi" editor 

In case of any errors, you can edit the todo file like this:
```
git rebase --edit-todo
```
If you want to abort the rebase, run this command:
```shell
git rebase --abort
```

This operation rewrites Git history. You’ll need to force-push your branch afterward:
```shell
git push --force
```

---
Built by [Michał Kozioł (@papacito)](https://github.com/papacito)
