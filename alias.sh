#!/usr/bin/bash
# creating all the alias bash commands



# script1, script2
# Running the basic mode commands under the same alias
alias create='chmod +x script1.sh;./script1.sh;chmod +x script2.sh;./script2.sh'



# script3-1
alias login='chmod +x script3-1.sh;./script3-1.sh'

# script3-2a
# only Virus can perform this command
sudo chown Virus script3-2a.sh
chmod 704 script3-2a.sh
alias symptoms='./script3-2a.sh'

# script3-2b (running it)
chmod +x script3-2b.sh;./script3-2b.sh

# script3-2c
# the two doctors (doc1, doc2) can create new vaccines
for doc in "doc1" "doc2"; do
    sudo chown $doc script3-2a.sh
    chmod 704 script3-2c.sh
    alias new_vaccine='./script3-2c.sh'
done

# script3-2d-e
# Patients can request the doctors to provide them vaccines
# Doctors can delete the requests of patients
# using the same command
alias request='chmod +x script3-2d.sh;./script3-2d.sh'


crontab -e
12 00 * * * symptoms