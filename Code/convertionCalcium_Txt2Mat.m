% This script converts the events train stored in .txt to Matlab format.
%
% INPUT: Each input file contains information about the Regions of Interest (ROIs) and the corresponding
% time stamps of detected events. The first row of each file reports the total number of ROIs and the total
% number of frames in the recording, formatted as:
% [number_of_ROIs, number_of_frames].
% Each subsequent row represents a detected event: the first column indicates the ROI index, while the 
% second column specifies the temporal frame at which the event was detected.
% Time is expressed in samples, with a temporal resolution of 3.8 Hz.
%
% OUTPUT: .mat file containing an M × N matrix, where M is the number of
% Regions of Interest (ROIs) and N is the number of frames.
% 
%                 Ilaria DOnati della Lunga - last update January 12, 2026

% ============================
% Select the txt file

[file, path] = uigetfile('*.txt', 'Select txt file');
if isequal(file,0)
    error('No file fonud');
end

txtFile = fullfile(path, file);

fid = fopen(txtFile);
dims = fscanf(fid, '%d %d', 2); %Find matrix dimentions 
fclose(fid);
m = dims(1);
n = dims(2);
eventMatrix = readmatrix(txtFile, 'NumHeaderLines', 1); %detection of events

% Event matrix
event_train = zeros(m, n);
idx = sub2ind([m n], eventMatrix(:,1), eventMatrix(:,2));
event_train(idx) = 1;

