echo "*******************Install dependencies***************************"
apt install tesseract-ocr bc libtesseract-dev 
echo "********************Verify installation**************************"
which tesseract
echo "*******************Install language***************************"
apt install tesseract-ocr-ben
echo "*********************Verify language*************************"
ls /usr/share/tesseract-ocr/4.00/tessdata | grep traineddata
echo "**********************Download training data************************"
mkdir -p ./data/ben-ground-truth
wget https://github.com/srdg/unarchived_ben_tess/releases/download/v0.0.2-alpha/data.zip -q --show-progress 
unzip -q ./data.zip -d ./data/ben-ground-truth && rm -rf data.zip
echo "***********************Move training  data***********************"
mv ./data ./tesstrain-master/
echo "======================= READY TO TRAIN ========================="
