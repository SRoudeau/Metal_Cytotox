	
function segmentation(input, output, filename) {

	open(input + filename);
	filename = getTitle();
	print(filename);	
	run("Duplicate...", " "); // ok
	run("Subtract Background...", "rolling=50");
	run("Set Scale...", "distance=1 known=0.65 unit=µm");
	saveAs("Tiff", output+filename+"_bgd_substracted");
	setAutoThreshold("Triangle dark");
	run("Convert to Mask");
	run("Watershed");
	run("Analyze Particles...", "size=10-2000 circularity=0.20-1.00 show=Overlay display include summarize add");
	saveAs("Jpeg", output+filename+"_8bit_mask");
	close();
	selectWindow(filename);
	roiManager("Show All without labels");
	run("Flatten");
	saveAs("Jpeg", output+filename+"_overlay_particles");
	close();
	selectWindow(filename);
	close();
	roiManager("Save", output+filename+".zip" );
	roiManager("Delete");
		
}

run("Set Measurements...", "area mean standard modal min integrated stack display redirect=None decimal=9");
input = getDirectory("Choose an Input Directory");
output = getDirectory("Choose an Output Directory");

setBatchMode(true); 
list = getFileList(input);
list = Array.filter(list, "TIF") 
for (i = 0; i < list.length; i++){
        segmentation(input, output, list[i]);
}
setBatchMode(false);


	selectWindow("Results");
	saveAs("Text", output+"Results.csv");
	selectWindow("Summary");
	saveAs("Text", output+"Summary.csv");
	beep();
	print("Done!")	;


