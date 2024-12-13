# Data training manual

## Description

**These data are from a measurement of the cytotoxicity of mercury chloride HgCl2 on primary hippocampal neurons from rat embryos**.

Cells were labelled with ReadyProbes™ Cell Viability Imaging Kit, Blue/Green (Thermo Fisher Scientific).

Eight Hg concentrations were tested:
- 0, 0.1, 1, 5, 50, 100, 200 and 500 µM
- in triplicate (A, B and C)

Samples of microscopy images are in the **‘Hg_images’** directory. Read the corresponding *ReadMe* file to get the full dataset.

The name of the images consists of:
- name of the metal
- concentration
- replicate identifier
- measurement channel

Each acquisition consists of two images (channels):
- ‘GFP’ for dead cells
- ‘DAPI’ for total cells (dead+live)


## Nuclei counting with ImageJ

The segmentation and counting of nuclei in each image is carried out by the ImageJ macro *‘Survival_Thresh_Segmentation_Analyze.ijm’* in the **‘ImageJ macro’** directory.

Once the macro has been installed in ImageJ and has been launched, the input directory containing the images must be chosen and an output directory defined (here **‘ImageJ_output’**), which will include:
- images with background correction
- segmentation images
- ROIs of the segmented nuclei
- *‘Results.csv’* file with all the segmented nuclei
- *‘Summary.csv’* file.

!!! Attention !!!: only the *‘Results.csv’* and *‘Summary.csv’* file are saved in **‘ImageJ_output’** directory.
They're the result of the full dataset, but segmented images and nuclei ROI were not saved here because of storage limitation


## Data analysis with R (R notebook)

Detailed analysis of the *‘Results.csv’* results file is performed using the Rstudio notebook *‘cytotox_Hg.Rmd’* in the **‘R_Notebook’** directory, which requires the tidyverse and drc packages.

When running the notebook, the first step is to choose the *‘Results.csv’* file to import.
This will give detailed and also grouped results:
- size and number of nuclei
- cell viability and mortality per image, global and at different concentrations.

Dose-response curves for normalised viability and absolute viability are plotted for the 4-parameter models:
- log_logistic
- Weibull 1
- Weibull 2
- the mean of the 3 models
- IC10 and IC50

The IC10 and IC50 are calculated as the weighted mean of the three models

Output files include:
- grouped data and results files in .txt or .csv format
- plots in pdf format
- R notebook output can be saved in html format.

Be sure to discard any anomalous data.
This is the case, for example, in the supplied 'cytotox_Hg.Rmd' file, where one replicate has been removed from the analysis (see code).

Of course, the code will have to be adapted slightly for each experiment.


*Contact : Stephane Roudeau roudeau@lp2ib.in2p3.fr*
