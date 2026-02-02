# CxHp_Neurospheroids

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ScreenNeuroPharm/CxHp_Neurospheroids/blob/master/LICENSE)

> The repository contains the data and the functions needed to reproduce the analysis reported in the article "Building blocks for 3D brain-like structures: a multi-modal investigation of neurospheroid interactions in a cortical-hippocampal circuit".

## Details
The Data folder contains the raw data used for the analyses in the paper.
The Code folder contains the Matlab code necessary for the analysis. All uploaded scripts for the analyses work with a .m format in Matlab. 

### Data folder architecture:
- AFM: includes two .csv files (cortical and hippocampal spheroids) containing stiffness measurements derived from atomic force microscopy (AFM) at different day in vitro (DIV). 

- AssembloidsMorphology: includes .csv files (cortical–cortical, hippocampal–hippocampal, and cortical–hippocampal assembloid-like structures) containing contact ratio/perimeter values of assembloids coupled at different days in vitro (DIV).

- CalciumEvents: includes .csv files (cortical–cortical, hippocampal–hippocampal, and cortical–hippocampal assembloid-like structures) containing the eveant train extract from calcium activity signal of assembloids recorded at different days in vitro (DIV).

- Cell composition analysis: includes .csv files (cortical and hippocampal spheroids) reporting the percentages of astrocytes, neurons, and GABAergic neurons quantified from immunostaining.
CellCount: includes two .csv files (cortical and hippocampal spheroids) containing the number of cells counted at different day in vitro (DIV). 

- SpheroidMorphology: includes .csv files (cortical and hippocampal spheroids) reporting the area and the perimeter measurements quantified from images acquired using differential interference contrast (DIC) microscopy. 

- Viability: includes two .csv files (cortical and hippocampal spheroids) containing the viability extracted from the MTT assay at different day in vitro (DIV). 

 

### Code folder architecture:
- Conversion folder:
    * Txt2Mat: function to convert ```.txt``` format file in ```.mat``` format file
      
- CalciumImagingAnalysis folder
    * event_train_detection: Function to detect the calcium events from the fluorescent traces.

