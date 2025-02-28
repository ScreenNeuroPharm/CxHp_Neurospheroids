# CxHp_Neurospheroids

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ScreenNeuroPharm/CxHp_Neurospheroids/blob/master/LICENSE)

> The repository contains the data and the functions needed to reproduce the analysis reported in the article "Building blocks for 3D brain-like structures: a multi-modal investigation of neurospheroid interactions in a cortical-hippocampal circuit".

## Details
The Data folder contains the raw data used for the analyses in the paper.
The Code folder contains the Matlab code necessary for the analysis. All uploaded scripts for the analyses work with a .m format in Matlab. 

### Data folder architecture:
- MEA recordings folder: it contains the MEA raw data from the electrophysiological recordings divided by configuration. To reproduce our analysis, it is necessary to convert the ```.txt``` format file to ```.mat``` format file using the function ```TxT2Mat.m``` in the Conversion folder. ```TxT2Mat.m``` function allows obtaining the raw data .mat file for each electrode.  All recordings were sampled at 10 KHz.

- CalciumImagingRecordings folder: it contains the fluorescence traces divided by DIV and configuration.  All recordings were sampled at 3.8 frame/s. The rows represent the fluorescence values over time in each ROI (column).

### Code folder architecture:
- Conversion folder:
    * Txt2Mat: function to convert ```.txt``` format file in ```.mat``` format file
      
- CalciumImagingAnalysis folder
    * event_train_detection: Function to detect the calcium events from the fluorescent traces.

