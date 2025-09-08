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

% Hide the mouse cursor (cursor loading icon appears)
%HideCursor;

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

%halfIdxStimuli = floor(length(stimulus_scale_order)/2); 
% Experimental procedure
% 
% 1. Present the stimulus for 500ms
% 2. Present the scale
% 3. Get the response
% 4. Repeat 1-3

% Welcome screen
% Nu_welcomeScreen(screenConfig, language);

outlet.push_sample({'event: experimentPt2Start'});

% First Baseline % 3 minutes 3*60
%Nu_baselineScreen(screenConfig, 3*60, outlet, language);

% Post Baseline Screen
%Nu_postBaselineScreen(screenConfig, language);

% Present the stimuli [für Tests trailIdx = 1:3]
for trialIdx = 1:IdxStimuli %halfIdxStimuli %1:3
    % Set the stimulus
    stimulus = stimuli(stimulus_scale_order(trialIdx,1));
    scale = scales{stimulus_scale_order(trialIdx,2)};
       
    % Present the scales
    response = Nu_presentScale(scale, stimulus, screenConfig, outlet);

    % Append the responses to the session.results table
    trialResults = table(session.participant.id, string(stimulus.id), string(scale.type) ,response, 'VariableNames', {'participantID', 'stimulusID', 'scaleType', 'response'});
    session.results = [session.results; trialResults];
end

% Break screen
%Nu_breakScreen(screenConfig, 3*60, outlet, language); 

% Present the stimuli second half
%for trialIdx = 4:6 %halfIdxStimuli+ length(stimulus_scale_order)
     % Set the stimulus
     %stimulus = stimuli(stimulus_scale_order(trialIdx,1));
     %scale = scales{stimulus_scale_order(trialIdx,2)};
 
    % Present the scales
   % response = Nu_presentScale(scale, stimulus, screenConfig, outlet);
 
     % Append the responses to the session.results table
    % trialResults = table(session.participant.id, string(stimulus.id), string(scale.type) ,response, 'VariableNames', {'participantID', 'stimulusID', 'scaleType', 'response'});
    % session.results = [session.results; trialResults];
%end

% Write the results to a csv file
writetable(session.results, ['.\results\results_' convertStringsToChars(session.participant.id) '.csv']);

Nu_baselineScreen(screenConfig, 3*60, outlet, language); % 3 minutes

% Experiment end message
Nu_goodbyeScreen(screenConfig);

outlet.push_sample({'event: experimentPt2End'});

% Close the screen 
Screen('CloseAll');

