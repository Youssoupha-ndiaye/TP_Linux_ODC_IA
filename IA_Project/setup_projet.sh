#!/bin/bash

# ============================================
# Mon script d'automatisation de création de projet IA
# ============================================

# demande du nom du projet 
read -p "Nom du projet : " Nom_Projet

# création de l'arborescence 
mkdir -p "$Nom_Projet"/{datasets/brut,datasets/clean,config,logs,scripts,models,api,backup,documentation,shared}
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

# Installer les outils nécessaires
sudo apt update -qq
sudo apt install -y git curl wget htop tree python3 python3-pip unzip > /dev/null 2>&1
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
tar -czf "$Nom_Projet/backup/${nom_project}.tar.gz" "$Nom_Projet"
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