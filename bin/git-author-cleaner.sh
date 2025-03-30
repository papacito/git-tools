#!/bin/bash

set -e

# -------- Configuration -------- #
NEW_AUTHOR="$1"

if [ -z "$NEW_AUTHOR" ]; then
  echo "Usage: $0 \"New Name <email@domain.com>\""
  exit 1
fi

echo "🔍 Inspecting Git history..."
COMMIT_COUNT=$(git rev-list --count HEAD)
COMMIT_CHANGE_COUNT=$((COMMIT_COUNT-1))

echo "🧼 Preparing to rewrite $COMMIT_CHANGE_COUNT commits with author:"
echo "   $NEW_AUTHOR"

# Safety checks
if [[ -n $(git ls-files --others --exclude-standard) ]]; then
  echo "⚠️ Untracked files detected! Please clean your working directory before proceeding:"
  echo "    git clean -fd && git reset --hard"
  echo "Or stash with:"
  echo "    git stash push -u -m \"pre-rebase cleanup\""
  exit 1
fi

echo "⚠️ WARNING: This will rewrite ALL commits in this branch, except for the initial commit."
read -p "Are you sure you want to proceed? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
  echo "Aborted."
  exit 0
fi

# -------- Rewriting History -------- #
echo "Rewriting history with author: $NEW_AUTHOR"

git rebase -i HEAD~$COMMIT_CHANGE_COUNT --exec \
  "GIT_COMMITTER_DATE=\$(git show -s --format=%cI) \
   git commit --amend \
   --author=\"$NEW_AUTHOR\" \
   --no-edit \
   --date=\$(git show -s --format=%aI)"

echo "Rebase complete. Don't forget to force-push:"
echo "   git push --force"
