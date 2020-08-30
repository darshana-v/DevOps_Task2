#!/usr/bin/bash
# script 3-2c


# doc1
if [ $USER = 'doc1' ]
then 

read -p "Enter the vaccine number: " no
sudo touch /home/$USER/Vaccines/Vaccine_$no.txt

read -p "Enter the information of vaccine: " text
echo "$text" | sudo tee /home/$USER/Vaccines/Vaccine_$no.txt

echo "New vaccine file created successfully!"
fi


# doc2
if [ $USER = 'doc2' ]
then 

read -p "Enter the vaccine number: " no
sudo touch /home/$USER/Vaccines/Vaccine_$no.txt

read -p "Enter the information of vaccine: " text
echo "$text" | sudo tee /home/$USER/Vaccines/Vaccine_$no.txt

echo "New vaccine file created successfully!"
fi










