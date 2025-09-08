# Urban Appraisal Experiment

This repository contains code, resources and instructions for running the Urban Appraisal Experiment. The experiment is implemented in MATLAB using Psychotoolbox and Lab Streaming Layer (LSL), and includes a web-based demographics questionnaire. 

## Overview
The experiment consists of two experimental blocks ([block1/](./block1/) and [block2/](./block2/)), each presenting a series of urban stimuli in a randomized order and collecting participant ratings on various scales including the Self Assessment Manikin (SAM). Event markers are sent via LSL for synchronization with physiological recordings. A separate web-based questionnaire collects demographic data and saves them as a `.csv` file.

The experiment starts with a baseline recording in which a timed screen is shown to participants. Subsequently, the 27/28 images of the respective blocks are being presented randomly with the nine scales arousal, dominance, and valence (all SAM; 9-point Likert scale) as well as beauty, fascination, hominess, openness, stress and safety. 
For each scale, a prime is shown for 1000ms _(stress: relaxed – stressful; openness: narrow – open; safety: unsafe – safe; beauty: ugly – beautiful; hominess: alienated – at home; fascination: boring – fascinating; arousal: excited – calm; valence: happy – unhappy; dominance: controlled – in control)_, followed by a 500ms fixation cross, 3000ms image presentation and the respective rating scale until an answer has been logged via mouse click. This repeats until every stimulus x scale compination has been presented.

The stimuli that can be found in the ressources folders were used in the Study ... (add study info here).

**_Schematic of experimental procedure:_**
![alt text](https://github.com/BeMoBIL/urban_appraisal-experiment/blob/main/block1/ressources/protocol.png?raw=true)


## Folder Structure

```
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
├── library/
│   ├── liblsl-Matlab
│
└── README.md
```

## Requirements
MATLAB
- MATLAB R2018b or newer recommended
- Psychtoolbox (for stimulus presentation)
- Lab Streaming Layer (LSL) (included in scripts/library/liblsl-Matlab/)

Node.js (for questionnaire, optional)
- Node.js (for running example servers in 'demographics-questionnaire')

## Setup
1. **Clone or download** this repository.
2. Ensure all subfolders are present, especially **`liblsl-Matlab`** in the folder [library/](./library/).
3. **Compile the mex-file** for liblsl-Matlab by running `build_mex` in [library/liblsl-Matlab/](./library/liblsl-Matlab/)
4. Install **Psychtoolbox** in MATLAB if not already done

## Running the Experiment

**Block 1**

1. Open MATLAB
2. Set the working directory to [block1/](./block1/)
3. Run `experiment_block1.m`
4. Follow the on-screen instructions to select language and enter participant ID.

**Block 2**

Proceed like with Block 1 but change working directory to [block2/](./block2/).

_Note:_ Results will be saved in the respective `results/` folder.
Event markers are sent via LSL for synchronization.



**Demographics Questionnaire**

The `demographics-questionnaire` folder contains a web-based questionnaire for collecting participant sociodemographic information. 

_(More info here)_

## Data Output
 - Experimental data:
saved as `.csv` files in `results` in [block1/](./block1/) and [block2/](./block2/) folders respectively.

- Demographics data:
Saved in 'Fragebogen_completed' (if using the example servers)

## Credits and License

- [LSL MATLAB library](https://github.com/sccn/liblsl) (MIT License)
- [Psychtoolbox](http://psychtoolbox.org)
- Experiment code: Original Code by Timo Berg, modified by Carolina Zähme

Feel free to use and adapt this code for academic purposes.
For questions, contact the repository maintainer.

## Citations

If you use this code or data, please cite the following resources as appropriate:

- **Self-Assessment Manikin (SAM):**  
  Bradley, M. M., & Lang, P. J. (1994). Measuring emotion: The Self-Assessment Manikin and the Semantic Differential. *Journal of Behavior Therapy and Experimental Psychiatry*, 25(1), 49–59. https://doi.org/10.1016/0005-7916(94)90063-9

- **Lab Streaming Layer (LSL):**  
  Kothe, C., Shirazi, S. Y., Stenner, T., Medine, D., Boulay, C., Grivich, M. I., ... & Makeig, S. (2025). The lab streaming layer for synchronized multimodal recording. Imaging Neuroscience. https://doi.org/10.1162/IMAG.a.136

- **Psychtoolbox:**  
  Brainard, D. H. (1997). The Psychophysics Toolbox. *Spatial Vision*, 10(4), 433–436.  
  Kleiner, M., Brainard, D., & Pelli, D. (2007). What's new in Psychtoolbox-3? *Perception*, 36(14), 1.  
  http://psychtoolbox.org/
