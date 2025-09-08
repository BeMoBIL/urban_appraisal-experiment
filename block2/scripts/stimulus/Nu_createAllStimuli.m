function stimuli = Nu_createAllStimuli(screen, ressourceFolder)
%   Inputs:
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   - ressourceFolder: path to the folder containing the stimuli (string)
%   Outputs:
%   - stimuli: array of stimuli as created by Nu_createStimulus (array of struct)
%
%   Loads all pictures in the ressources/stimuli folder and creates a stimulus for each of them.
%   The stimuli are then shuffled and returned in an array.

    % Get list of all pictures in the ressources/stimuli folder
    stimuli_filenames = dir(strcat(ressourceFolder, "*.jpg"));

    % Create an empty array of structs
    stimuli = [];

    % Create a stimulus for every picture with random order
    for i = randperm(length(stimuli_filenames))
        % Get full filepath
        stimuliPath = strcat(ressourceFolder, stimuli_filenames(i).name);
        
        % Create stimulus and add it to the array
        stimuli = [stimuli Nu_createStimulus(stimuliPath, screen)];
    end
    
    % Every stimulus is repeated 3 times 
    % stimuli = [stimuli stimuli stimuli];
end