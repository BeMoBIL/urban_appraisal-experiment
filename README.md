# urban_appraisal-experiment

This repository contains code, resources and instructions for running the Urban Appraisal Experiment. The experiment is implemented in MATLAB using Psychotoolbox and Lab Streaming Layer (LSL), and includes a web-based demographics questionnaire. 

## Overview
The experiment consists of two experimental blocks ('block1' and 'block2')., each presenting a series of urban stimuli in a randomized order and collecting participant ratings on various scales including the Self Assessment Manikin (SAM). Event markers are sent via LSL for synchronization with physiological recordings. A separate web-based questionnaire collects demographic data and saves them as a .csv file.

## Folder Structure
urban_appraisal-experiment/
│
├── block1/
│   ├── experiment_block1.m
│   ├── ressources/
│   ├── results/
│   └── scripts/
│
├── block2/
│   ├── experiment_block2.m
│   ├── ressources/
│   ├── results/
│   └── scripts/
│
├── demographics-questionnaire/
│   ├── demographics.html
│   ├── example_export_nodejs_upload.js
│   ├── example_websockets_nodejs_server_echo.js
│   ├── example_websockets_nodejs_server_relay.js
│   ├── example.css
│   ├── package.json
│   ├── thefragebogen.js
│   └── Fragebogen_completed/
│
└── README.md

## Requirements
MATLAB
- MATLAB R2018b or newer recommended
- Psychtoolbox (for stimulus presentation)
- Lab Streaming Layer (LSL) (included in scripts/library/liblsl-Matlab/)

Node.js (for questionnaire, optional)
- Node.js (for running example servers in 'demographics-questionnaire')

## Setup
1. Clone or download this repository.
2. Ensure all subfolders are present, especially 'liblsl-Matlab' in the folders 'block1' and 'block2'.
3. Compile the mex-file by running build_mex.m
4. Install Psychtoolbox in MATLAB if not already done

## Running the Experiment

Block 1 

1. Open MATLAB
2. Set the working directory to 'block1'
3. Run 'experiment_block1.m'
4. Follow the on-screen instructions to select language and enter participant ID.

Block 2 

Proceed like with Block 2 but change working directory to 'block2'.


Note:

Results will be saved in the respective results/ folder.
Event markers are sent via LSL for synchronization.

Demographics Questionnaire

The 'demographics questionnaire' folder contains a web-based questionnaire for collecting participant sociodemographic information. 

(More info here)

## Data Output
 - Experimental data:
saved as '.csv' files in 'results' in 'block1' and 'block2' folders respectively.

- Demographics data:
Saved in 'Fragebogen_completed' (if using the example servers)

## Credits and License

- LSL MATLAB library: BSD License
- Psychtoolbox: GPL
- Experiment code: Original Code by Timo Berg, modified by Carolina Zähme

Feel free to use and adapt this code for academic purposes.
For questions, contact the repository maintainer.