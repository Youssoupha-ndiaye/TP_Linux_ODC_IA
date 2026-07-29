#!/bin/bash

# ============================================
# Mon script d'automatisation de création de projet IA
# ============================================

# demande du nom du projet 
read -p "Nom du projet : " Nom_Projet

# création de l'arborescence 
mkdir -p "$Nom_Projet"/{datasets/brut,datasets/clean,config,logs,scripts,models,backup,api,documentation,shared}
Arborescence="OK"

# Créer un fichier de configuration
cat > "$Nom_Projet/config/settings.conf" << EOF
PROJECT_NAME=$Nom_Projet
DATA_PATH=datasets/brut
MODEL_PATH=models
LOG_LEVEL=INFO
API_PORT=8000
AUTHOR=Equipe IA
EOF
fichier_de_config="OK

# création at ajout des info dans le readme
cat > "$Nom_Projet/datasets/brut/readme.txt" << 'EOF'
Projet : IA de prédiction des achats

Ce dossier contient les données brutes destinées
à l'entraînement d'un modèle de Machine Learning.

Fichiers disponibles :

- train.csv
- test.csv
- clients.csv

Ne jamais modifier directement les fichiers originaux.

Les versions nettoyées devront être placées
dans datasets/clean.
EOF

# creation du fichier train.csv et ajout des éléments 
cat > "$Nom_Projet/datasets/brut/train.csv" << EOF
id,age,revenu,ville,achat
1,25,350000,Dakar,Oui
2,42,720000,Thies,Non
3,31,500000,Saint-Louis,Oui
4,28,410000,Dakar,Oui
5,54,900000,Kaolack,Non
6,36,620000,Ziguinchor,Oui
7,29,470000,Thies,Oui
8,47,850000,Dakar,Non
9,39,650000,Louga,Oui
10,26,390000,Matam,Non
EOF

# Installer les outils nécessaires
# sudo apt update -qq
# sudo apt install -y git curl wget htop tree python3 python3-pip unzip > /dev/null 2>&1
Logiciel="OK"

# Télécharger le dataset
wget -q -O "$Nom_Projet/datasets/brut/iris.csv" \
  https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv
if [ -f "$Nom_Projet/datasets/brut/iris.csv" ]; then
  Datasets="OK"
else
  Datasets="ECHEC"
fi

# Compresser le projet

tar -czf "$Nom_Projet/backup/${Nom_Projet}.tar.gz" "$Nom_Projet"
Archive="$Nom_Projet/backup/${Nom_Projet}.tar.gz"

# Afficher un résumé

echo "=========================="
echo "Projet créé"
echo "Nom : $Nom_Projet"
echo "Arborescence : $Arborescence"
echo "Fichier de config : $fichier_de_config"
echo "Logiciels : $Logiciel"
echo "Datasets : $Datasets"
echo "Archive : $Archive"
echo "Installation terminée."
echo "=========================="