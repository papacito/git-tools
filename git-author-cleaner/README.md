# git-author-cleaner

Clean up your Git history by rewriting all commits with a new author — while preserving original commit and author dates.

Perfect for fixing cached work emails, cleaning old repos, and keeping your GitHub contribution graph accurate.

## Usage

```shell
./git-author-cleaner.sh "Your Name <you@example.com>"
```

- Rewrites all commits in the current branch (starting from root)
- Keeps original author and committer dates
- Does not modify commit messages

This operation rewrites Git history. You’ll need to force-push your branch afterward:
```shell
git push --force
```

## When to use
- You accidentally used a work Git config on a side project
- You want to open-source a project under your personal identity
- You’re migrating old code into a cleaned-up repo

---
Built by [Michał Kozioł (@papacito)](https://github.com/papacito)
