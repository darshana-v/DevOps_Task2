#!/usr/bin/bash
# script3-2d


# for all patients

for patient in $(members pat); do
    if [ $USER = $patient ]
    then
    read -p "Enter your username: " user
    read -p "Enter your doctor's name: " doc
    read -p "Enter your request number: " no
    read -p "Enter your symptom: " sym

    # Creating a request to the doctor for each patient
    # in the form <patient name>_<request no.>.txt

    sudo touch /home/$doc/Requests/$user_$no.txt

    echo "$sym" | sudo tee /home/$doc/Requests/$user_$no.txt
    echo "$sym" | sudo tee /home/$doc/$user/Symptoms/Request_Sym_$no.txt

    echo "Requested successfully!"
    fi
done


# for the doctors

if [ $USER = 'doc1' ] || [ $USER = 'doc2' ]
then

read -p "Enter your username: " doc
echo "Remember: The request file name is in the form of: <patient name>_<request no.>.txt"
echo "Enter the info of the symptoms file you want to delete: "
read -p "Enter the patient's name " user
read -p "Enter the request no. " no

rm -f /home/$doc/$user/Symptoms/Request_Sym_$no.txt

echo "Deleted the symptom successfully! "









