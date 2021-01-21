# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub hugo branch...\033[0m\n"

# Add changes to git
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin hugo

printf "\033[0;32mDeploying updates to GitHub master branch...\033[0m\n"

# Build the project.
hugo -t toha 

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master