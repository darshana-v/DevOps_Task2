#!/bin/bash
# script3-2b


# Installing 'members' package to list the members of a group
sudo apt install members


for doc in "doc1" "doc2"; do
if [ $(ls /home/$user/Symptoms| wc -l) -gt 20 ]
then
    sudo userdel -r $user
fi


# Looping through all the members of groups 'gdoc1' and 'gdoc2'
# which contains patients in a group for each doc

for user in $(members gdoc1); do
if [ $(ls /home/doc1/$user/Symptoms| wc -l) -gt 20 ]
then
    sudo userdel -r $user
fi

done

for user in $(members gdoc2); do
if [ $(ls /home/doc2/$user/Symptoms| wc -l) -gt 20 ]
then
    sudo userdel -r $user
fi

done

