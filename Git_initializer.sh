#!/usr/bin/bash
# get for params
if [ $# -lt 2 ] ;then
echo "Welcom To Repo Initialiser ..."
echo "Usage :"
echo "$0 BranchName CreateReadMe[0-Create it , 1 SKip] "
echo "Exemple :"
echo "$0 main 0" 
exit 1
fi
echo "Enter The remote repository name : "
read git_repo_name
# initilize repo 
if [ $2 -eq 0 ];then
git init -b $1 && touch README.md && echo "# $git_repo_name" > README.md
else
git init -b $1 
fi
# git status
git status
echo "Add theme all ?"
select option in Add Quit
do
    case $option in
        "Add")
            clear
            git add .
            break;;
        "Quit")
            clear
            echo "Bye : '("
            exit 1
           break;;
        *)
           echo "Ooops ,wrong option ... Try again ";;
    esac
done
echo "You want To commit Changes ?"
select option in commit Quit
do
    case $option in
        "commit")
            clear
            echo "Commit Message Please : "
            read git_commit_message
            break;;
        "Quit")
            clear
            echo "Bye : '("
            exit 1
           break;;
        *)
           echo "Ooops ,wrong option ... Try again ";;
    esac
done
git commit -m "$git_commit_message"
clear
if [ $? -eq 0 ];then
echo "Done ,You can push Now  😎 😎"
else 
echo "An Unexpected Error Has Occurred  😭"
fi
