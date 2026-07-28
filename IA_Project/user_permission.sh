#!/bin/bash

echo "verification de la création de répertoire perso"

ls -ld /home/alice 
ls -ld /home/bob
ls -ld /home/charles
ls -ld /home/diane
ls -ld /home/eva

echo "affichage des UID et les groupes"

id alice 
id bob
id charles
id diane
id eva

echo "création des groupe"

sudo groupadd data
sudo groupadd models
sudo groupadd api
sudo groupadd mlops
sudo groupadd interns

echo "Ajout des users dans leur groupe respectifs"

sudo usermod -aG data,models alice 
sudo usermod -aG data bob
sudo usermod -aG api charles
sudo usermod -aG mlops diane
sudo usermod -aG interns eva

echo "vérifiaction des groupes"

groups alice 
groups bob 
groups charles 
groups diane 
groups eva

echo "5) création des sous dossiers documentatai api et shared"

mkdir -p api documentation shared

echo "6) attribution des propriétaire"

sudo chown alice datasets
sudo chown alice models
sudo chown charles api 
sudo chown diane logs 
sudo chown diane backup
sudo chown bob documentation 
sudo chown root shared
 

echo "7) Attribution des groupes"

sudo chgrp data datasets
sudo chgrp data models
sudo chgrp api api 
sudo chgrp mlops logs
sudo chgrp mlops backup
sudo chgrp data documentation
sudo chgrp data shared


echo "8) Configuration des droits"

sudo chmod 770 datasets  
sudo chmod 750 models
sudo chmod 770 api 
sudo chmod 740 logs
sudo chmod 700 backup 
sudo chmod 744 documentation
sudo chmod 775 shared

echo "verification des droits"

ls -ld datasets models api logs backup documentation shared
