#!/bin/bash

current_branch=`git rev-parse --abbrev-ref HEAD`
current_branch_feature_env=${current_branch}-feature_env
rollout_name=":company_pages_show"

if git branch | grep ${current_branch_feature_env}
then
	git branch -D ${current_branch_feature_env} 
fi
git checkout -b ${current_branch_feature_env}

echo "\$rollout.activate(${rollout_name})" >> ./config/initializers/rollout.rb

git add --all
git commit -m "[auto] Add rollout [ci-skip]"
git push -f
git reset --hard HEAD~1
git checkout ${current_branch}

