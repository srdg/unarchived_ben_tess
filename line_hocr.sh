#!/bin/bash
SOURCE="./010_LetterPress-Data/"
lang=ben
rm -rf ./data/ben-ground-truth && mkdir -p ./data/ben-ground-truth
set -- "$SOURCE"*.png
for img_file; do
    echo -e  "\r\n File: $img_file"
    OMP_THREAD_LIMIT=1 tesseract  "${img_file}" "${img_file%.*}"  --psm 6  --oem 1  -l $lang ben page_separator='' hocr
    PYTHONIOENCODING=UTF-8 ./hocr-tools-master/hocr-extract-images -b ./010_LetterPress-Data/ -p "${img_file%.*}"-%03d.exp0.tif  "${img_file%.*}".hocr 
done
#rename s/exp0.txt/exp0.gt.txt/ ./myfiles/*exp0.txt
!mv ./010_LetterPress-Data/*.tif ./data/ben-ground-truth/
!mv ./010_LetterPress-Data/*exp0.txt ./data/ben-ground-truth/
echo "Image files converted to tif. Correct the ground truth files and then run ocr-d train to create box and lstmf files"
