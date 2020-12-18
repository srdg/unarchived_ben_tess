echo "*******************Install dependencies***************************"
sudo apt-get install tesseract-ocr bc libtesseract-dev 
echo "********************Verify installation**************************"
which tesseract
echo "*******************Install language***************************"
sudo apt-get install tesseract-ocr-ben
echo "*********************Verify language*************************"
ls /usr/share/tesseract-ocr/4.00/tessdata | grep traineddata
echo "**********************Download training data************************"
mkdir -p ./data/ben-ground-truth
wget https://github.com/srdg/unarchived_ben_tess/releases/download/v0.0.2-alpha/data.zip -q --show-progress 
unzip -q ./data.zip -d ./data/ben-ground-truth && rm -rf ./data.zip
echo "**********************Download training tools************************"
wget https://github.com/tesseract-ocr/tesstrain/archive/master.zip -q --show-progress && unzip -q ./master.zip # unzip training diretory
rm -rf ./master.zip && sample_data/
echo "***********************Move training  data***********************"
mv ./data ./tesstrain-master/
echo "======================= READY TO TRAIN ========================="
cd ./tesstrain-master/
echo "======================= TRAINING MODEL ========================="
make training MODEL_NAME=ben RATIO_TRAIN=0.80
echo "======================= TRAINING DONE! ========================="
