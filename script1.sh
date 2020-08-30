#!/bin/bash
# script1



# Creating accounts with the passwords the same as that of the username
sudo useradd -m Virus
echo "Virus:Virus" | sudo chpasswd


for user in "doc1" "doc2"; do
    sudo useradd -m $user
    echo "$user:$user" | sudo chpasswd

    # creating 3 directories in the home dir of each doctor
    sudo mkdir -p /home/$user/{Vaccines,Requests,Symptoms}
done

# Creating accounts for 5 patients for each doctor (doc1p1,doc1p2...)
# with their home directories inside the doctor's directory
for doc in "doc1" "doc2"; do
    for((i=1;i<6;i++)); do
        sudo useradd -m -d /home/$doc/$doc"p"$i $doc"p"$i
        echo "$doc"p"$i:$doc"p"$i" | sudo chpasswd

        # Creating 'Symptoms' dir for each patient
        sudo mkdir -p /home/$doc/$doc"p"$i/Symptoms
    done
done

echo "Accounts created. The passwords are the same as the usernames!"




# Creating groups

# Creating a group(virus) with Virus
sudo addgroup virus
sudo adduser Virus virus

# Creating two groups(gdoc1, gdoc2) with all the patients for each doc
sudo addgroup gdoc1
for((i=1;i<6;i++)); do
    sudo adduser "doc1p"$i gdoc1
done

sudo addgroup gdoc2
for((i=1;i<6;i++)); do
    sudo adduser "doc2p"$i gdoc2
done

# Creating a group for all citizens (doctors + patients)
sudo addgroup cit
sudo adduser doc1 cit
sudo adduser doc2 cit
for((i=1;i<6;i++)); do
    sudo adduser "doc1p"$i cit
    sudo adduser "doc2p"$i cit
done

# Creating a group for all patients
sudo addgroup pat
for((i=1;i<6;i++)); do
    sudo adduser "doc1p"$i pat
    sudo adduser "doc2p"$i pat
done




# Assigning access permissions to the users

# doctors can read and write content in dir of their patients
for user in "doc1" "doc2"; do
    sudo chmod -R u+rw /home/$user
done

# Virus can read and write content in home dir of all citizens
sudo chgrp -R virus /home/doc1
sudo chgrp -R virus /home/doc2

sudo chmod -R g+rw /home/doc1
sudo chmod -R g+rw /home/doc2
sudo chmod -R g-x /home/doc1
sudo chmod -R g-x /home/doc2

# All citizens can read the contents of Virus dir
sudo chgrp -R cit /home/Virus
sudo chmod -R g+r /home/Virus
sudo chmod -R g-wx /home/Virus

# All patients are allowed to read content in 'Vaccines' dir of their doctor
sudo chgrp -R gdoc1 /home/doc1/Vaccines
sudo chgrp -R gdoc2 /home/doc2/Vaccines

sudo chmod -R g+r /home/doc1/Vaccines
sudo chmod -R g+r /home/doc2/Vaccines
sudo chmod -R g-wx /home/doc1/Vaccines
sudo chmod -R g-wx /home/doc2/Vaccines







 