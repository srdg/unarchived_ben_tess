echo "*******************Install dependencies***************************"
apt install -q tesseract-ocr bc libtesseract-dev tesseract-ocr-ben
echo "********************Verify installation**************************"
which tesseract
echo "*********************Verify language*************************"
ls /usr/share/tesseract-ocr/4.00/tessdata | grep traineddata
echo "**********************Download training data************************"
mkdir -p ./data/ben-ground-truth
wget https://github.com/srdg/unarchived_ben_tess/releases/download/v0.0.2-alpha/data.zip -q --show-progress 
unzip -q ./data.zip -d ./data/ben-ground-truth && rm -rf data.zip
echo "***********************Move training  data***********************"
mv ./data ./tesstrain-master/
echo "======================= READY TO TRAIN ========================="
