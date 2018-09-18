#!/bin/bash
# Change rootdir to your project directory
ROOTDIR='/home/oguz/Desktop/DeepLearning'

KAGGLE_DOG_CAT_URL='https://download.microsoft.com/download/3/E/1/3E1C3F21-ECDB-4869-8368-6DEBA77B919F/kagglecatsanddogs_3367a.zip'


cd $ROOTDIR

if [ ! -d out/inputs/KAGGLE_DOG_CAT/ ]
then
	mkdir -p out/inputs/KAGGLE_DOG_CAT/
fi


cd out/inputs/KAGGLE_DOG_CAT/

if [ ! -f kaggle_dog_cat.zip ]
then
	curl $KAGGLE_DOG_CAT_URL --output kaggle_dog_cat.zip
	unzip kaggle_dog_cat.zip -d Dog\ and\ Cat\ Recognition/
else
	unzip kaggle_dog_cat.zip -q -d ../../../Dog\ and\ Cat\ Recognition/
fi

cd ../../..


