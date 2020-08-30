#!/bin/bash
# script3-2a


# Listing the usernames as options to choose from:
echo "Virus
doc1
doc2"
for doc in "doc1" "doc2"; do
    for((i=1;i<6;i++)); do
        echo "$doc"p"$i"
    done
done

read -p "Enter the username of the citizen: " user
read -p "Enter the number of the symptom: " no



# for doc1 and doc2
if [ $user = 'doc1' ] || [ $user = 'doc2' ]
then

sudo touch /home/$user/Symptoms/Symptom_$no.txt

read -p "Enter the symptom: " text
echo "$text" | sudo tee /home/$user/Symptoms/Symptom_$no.txt

echo "Symptom created successfully!"
fi

# for patients in gdoc1 (under doc1)
for patient in $(members gdoc1); do
    if [ $user = $patient ]
    then

    read -p "Enter the symptom: " text
    echo "$text" | sudo tee /home/doc1/$user/Symptoms/Symptom_$no.txt

    echo "Symptom created successfully!"
    fi
done


# for patients in gdoc2 (under doc2)
for patient in $(members gdoc2); do
    if [ $user = $patient ]
    then

    read -p "Enter the symptom: " text
    echo "$text" | sudo tee /home/doc2/$user/Symptoms/Symptom_$no.txt

    echo "Symptom created successfully!"
    fi
done














