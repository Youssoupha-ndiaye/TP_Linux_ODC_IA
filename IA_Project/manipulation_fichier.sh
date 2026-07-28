#!/bin/bash

echo "1) Affichage du contenu readme.txt"

cat datasets/brut/readme.txt

echo "2) Affichage des 5 premiers ligne de train.csv"

cat datasets/brut/train.csv | head -5

echo "3) Affichage des trois derniér ligne de application.log"

cat logs/application.log | tail -3

echo "4) comptage du nombre de ligne de clients.csv"

wc -l datasets/brut/clients.csv

echo "5) rechercher toutes les lignes contenant WARNING"

grep  "WARNING" logs/application.log

echo "6) rechercher le mot INFO dans les journaux"

grep "INFO" logs/*.log

echo "7) copier train.csv dans datatsets/clean"

cp datasets/brut/train.csv datasets/clean


echo "8) renommer model.info en modele.txt"

mv models/model_info.txt models/modele.txt 

echo "9) supprimer le fichier test.csv"

rm datasets/brut/test.csv

echo "10) rechercher tous les fichiers .csv"

find . -type f -name "*.csv"

echo "11) rechercher tous les fichiers .log"

find . -type f -name "*.log"

echo "12) Afficher les fichiers triés par taille"

ls -lh

echo "13) Concaténer apllication.log et training.log dans un nouveau fichier"

cat logs/application.log logs/training.log > logs/concat.log

echo "14) extracation des lignes contenant Loss dans un fichier loss.log"

grep "Loss" logs/training.log > logs.loss.log


echo "15) compter le nombre de fichier du projet"

find . -type f | wc -l 

echo "16) création de l'archive Projet_IA.tar.gz"

mkdir -p backup

tar -czcf backup/Projet_IA.tar.gz .


echo "17) Restauration de la sauvegarde ailleur en dehors du projets"

mkdir -p ~/Restore

tar -xzvf backup/Projet_IA.tar.gz -C ~/Restore


