git stash --all

git checkout $(git rev-parse master)
git cherry-pick origin/ca-test
HEAD=$(git rev-parse HEAD)
git checkout -B ca-test
git reset --hard ${HEAD}

git stash pop