import os

txt=[i for i in os.listdir(".") if i.endswith(".txt")]

for gt_file in txt:
	content=[]
	with open(gt_file, 'r', encoding="utf-8") as gt_handler:
		content=[i.strip().rstrip('\n') for i in gt_handler.readlines()]
	content=[i for i in content if i!=""]
	counter=1
	for line in content:
		with open(gt_file[:gt_file.find('.')]+"-"+str(counter).zfill(3)+".exp0.gt.txt","w+", encoding="utf-8") as hocr_handler:
			hocr_handler.write(line)
		counter+=1
