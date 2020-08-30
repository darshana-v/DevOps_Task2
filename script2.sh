#!/bin/bash
# script2


# Creating files
# 5 files in each doctor's 'Vaccines' dir with the name of a vaccine in each file
for((i=1;i<6;i++)); do
    sudo touch /home/doc1/Vaccines/Vaccine_$i.txt
done

for((i=1;i<6;i++)); do
    sudo touch /home/doc2/Vaccines/Vaccine_$i.txt
done

for doc in "doc1" "doc2" ; do
    echo "mRNA-1273" | sudo tee /home/$doc/Vaccines/Vaccine_1.txt
    echo "CoronaVac" | sudo tee /home/$doc/Vaccines/Vaccine_2.txt
    echo "AZD1222" | sudo tee /home/$doc/Vaccines/Vaccine_3.txt
    echo "BNT162" | sudo tee /home/$doc/Vaccines/Vaccine_4.txt
    echo "Ad5-nCoV" | sudo tee /home/$doc/Vaccines/Vaccine_5.txt
done

# Creating two symptoms files for each patient
for doc in "doc1" "doc2"; do
    for((i=1;i<6;i++)); do
        sudo touch /home/$doc/$doc"p"$i/Symptoms/Symptom_1.txt
        echo "Difficulty in breathing" | sudo tee /home/$doc/$doc"p"$i/Symptoms/Symptom_1.txt
        sudo touch /home/$doc/$doc"p"$i/Symptoms/Symptom_2.txt
        echo "Sore throat" | sudo tee /home/$doc/$doc"p"$i/Symptoms/Symptom_2.txt
    done
done

# Creating file for each patient in the directory of his/her doctor
for doc in "doc1" "doc2"; do
    for((i=1;i<6;i++)); do
        sudo touch /home/$doc/Requests/p$i.txt
    done
done

# the patient can read and write on these files
# changing the owner of each file to the patient
for doc in "doc1" "doc2"; do
    for((i=1;i<6;i++)); do
        sudo chown $doc"p"$i /home/$doc/Requests/p$i.txt
    done
done





