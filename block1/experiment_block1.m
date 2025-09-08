
addpath(genpath(".\scripts\"));

clear

% Initialize variables
session = struct();

% Create LSL outlet
outlet = Nu_createLSLOutlet('NeurUrbanismMarkers');

% Ask for language:
disp('Please select the language:');
disp('1. English');
disp('2. German');
choice = input('Enter the number corresponding to your choice: ');

if choice == 1
    language = 'english';
    disp('English selected');
else
    language = 'german';
    disp('German selected');
end

% Get the participant ID via the console
session.participant.id = string(input('Please enter the participant ID: ', 's'));

% Create an empty table for the results with the following columns
% participantID, stimulusID, pleasure, arousal, dominance, openness, hominess, safety, fascination, beauty
session.results = table('Size', [0, 4], 'VariableTypes', {'string', 'string', 'char', 'double'}, 'VariableNames',  {'participantID', 'stimulusID', 'scaleType', 'response'});

% Set the screen configuration
screenConfig  = Nu_setScreens();

% Hide the mouse cursor
HideCursor;

%shuffle seed
rng('shuffle');

% Create scales
scales = Nu_createAllScales(screenConfig, language);
% Create a stimulus
stimuli = Nu_createAllStimuli(screenConfig, ".\ressources\stimuli\");

% Create a random permutation of the stimuli and the scales
stimulus_scale_order = RandomPermutation(length(stimuli), length(scales));

IdxStimuli = floor(length(stimulus_scale_order));

% Welcome screen
Nu_welcomeScreen(screenConfig, language);

outlet.push_sample({'event: experimentPt1Start'});

% First Baseline % 3 minutes 3*60
Nu_baselineScreen(screenConfig, 3*60, outlet, language);

% Post Baseline Screen
Nu_postBaselineScreen(screenConfig, language);

% Present the stimuli [für Tests trailIdx = 13]
for trialIdx = 1:IdxStimuli % Adjusted to loop through all stimuli
    % Set the stimuluss
    stimulus = stimuli(stimulus_scale_order(trialIdx,1));
    scale = scales{stimulus_scale_order(trialIdx,2)};

    % Present the scales
    response = Nu_presentScale(scale, stimulus, screenConfig, outlet);

    % Append the responses to the session.results table
    trialResults = table(session.participant.id, string(stimulus.id), string(scale.type), response, 'VariableNames', {'participantID', 'stimulusID', 'scaleType', 'response'});
    session.results = [session.results; trialResults];
end

% Break screen, AFTER all stimuli have been presented
Nu_breakScreen(screenConfig, 30, outlet, language); % 30 seconds break here% Present the stimuli second half


% Write the results to a csv file
writetable(session.results, ['.\results\results_' convertStringsToChars(session.participant.id) '.csv']);

outlet.push_sample({'event: experimentPt1End'});

% Close the screen 
Screen('CloseAll');

