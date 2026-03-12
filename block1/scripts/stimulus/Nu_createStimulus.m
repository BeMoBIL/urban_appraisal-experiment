function stimulus = Nu_createStimulus(filepath, screen)
%   Input:
%   - filepath: path to the stimulus image (string)
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   Output:
%   - stimulus: structure containing the stimulus information with the following fields (struct)
%       - id: stimulus id (string)
%       - texture: texture of the stimulus (integer)
%       - pos: position of the stimulus on the screen (rect)
%
%   Creates a stimulus structure from the image file at the given path.

    % Get the filename of the path as the stimulus id
    [~, id, ~] = fileparts(filepath);

    stimulusImage = imread(filepath);

    stimulusHeight = 0.75 * screen.height;
    % Stimulus width is calculated to keep the aspect ratio of the image
    stimulusWidth = stimulusHeight * size(stimulusImage, 2) / size(stimulusImage, 1);

    stimulus.id = convertStringsToChars(id);
    stimulus.texture = Screen('MakeTexture', screen.window, stimulusImage);
    stimulus.pos = CenterRectOnPointd([0 0 stimulusWidth stimulusHeight], screen.center.x, screen.center.y);
end