#!/bin/bash

set -e

# -------- Configuration -------- #
NEW_AUTHOR="$1"

if [ -z "$NEW_AUTHOR" ]; then
  echo "Usage: $0 \"New Name <email@domain.com>\""
  exit 1
fi

# Safety check
echo "⚠️WARNING: This will rewrite ALL commits in this branch."
read -p "Are you sure you want to proceed? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
  echo "Aborted."
  exit 0
fi

# -------- Rewriting History -------- #
echo "Rewriting history with author: $NEW_AUTHOR"

git rebase -i --root --exec \
  "GIT_COMMITTER_DATE=\$(git show -s --format=%cI) \
   git commit --amend \
   --author=\"$NEW_AUTHOR\" \
   --no-edit \
   --date=\$(git show -s --format=%aI)"

echo "Rebase complete. Don't forget to force-push:"
echo "   git push --force"
