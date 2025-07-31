#!/bin/bash

# 🏷️ Branch name input
echo "Enter feature branch name (e.g., feature/my-awesome-feature):"
read branch_name

# 🌱 Create & switch to new branch
git checkout -b "$branch_name"

# 📝 Code changes stage
echo "Staging changes..."
git add .

# 📦 Commit
echo "Enter commit message:"
read commit_msg
git commit -m "$commit_msg"

# ☁️ Push to origin
git push -u origin "$branch_name"

# 🔀 Create PR using GitHub CLI
read -p "Do you want to create a pull request now? (y/n): " create_pr

if [ "$create_pr" = "y" ]; then
    gh pr create --base main --head "$branch_name" --title "$commit_msg" --body "Auto-generated PR for $branch_name"
    echo "✅ Pull request created!"
else
    echo "🔔 PR not created. You can do it manually later."
fi




