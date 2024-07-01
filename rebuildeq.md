git remote add peq-quests git@github.com:ProjectEQ/projecteqquests.git
git fetch peq-quests
git checkout -b quests-master peq-quests/master
git checkout main
git branch xackery/2024-07-01 # create a new branch based on latest main
git checkout xackery/2024-07-01 # switch to the new branch
git merge quests-master xackery/2024-07-01 --allow-unrelated-histories # merge all the changes
git remote rm peq-quests # remove the peq-quests remote ref
git branch -d quests-master # remove the quests-master branch locally