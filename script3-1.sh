#!/bin/bash
# script3-1


echo "Users are:
Virus
doc1
doc2"
for doc in "doc1" "doc2"; do
    for((i=1;i<6;i++)); do
        echo "$doc"p"$i"
    done
done

read -p "Enter your username: " user
echo "To leave/log out of this user, enter <exit>"

su - $user