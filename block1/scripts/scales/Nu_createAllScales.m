function scales = Nu_createAllScales(screenConfig, language)
%   Input:
%   - screenConfig: screen configuration struct as provided by Nu_setScreens (struct)
%   Output:
%   - scales: struct containing all scales with the following fields (struct)
%       - sam: SAM scales (struct)
%       - likert: Likert scales (struct)
%
%   Creates all scales used in the experiment and returns them in a struct.

    % Create scales
    % Initiate scales struct with 7 entries
    scales = {};
    

    scales{end+1} = Nu_createSAMScale('valence', language, screenConfig);
    scales{end+1} = Nu_createSAMScale('arousal', language, screenConfig);
    scales{end+1} = Nu_createSAMScale('dominance', language, screenConfig);


    if strcmp(language, 'english')
        scales{end+1} = Nu_createLikertScale('How safe do you perceive the environment to be?',{'not at all', 'very much'}, 'safety' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('How fascinating do you find this place?', {'not at all', 'very much'}, 'fascination' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('How open do you perceive the environment to be?', {'not at all', 'very much'}, 'openness' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('How homey do you find this place?', {'not at all', 'very much'}, 'hominess' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('How beautiful do you find this place?', {'not at all', 'very much'}, 'beauty' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('How stressful do you perceive this place?', {'not at all', 'very much'}, 'stress' ,screenConfig, language);
    else
        % German
        scales{end+1} = Nu_createLikertScale('Wie sicher finden Sie dieses Umfeld?', {'gar nicht', 'sehr'}, 'Sicherheit' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('Wie faszinierend finden Sie diesen Ort?', {'gar nicht', 'sehr'}, 'Faszination' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('Wie offen empfinden Sie dieses Umfeld?', {'gar nicht', 'sehr'}, 'Offenheit' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('Wie sehr wuerden Sie sich an diesem Ort zu Hause fuehlen?', {'gar nicht', 'sehr'}, 'Heimeligkeit' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('Wie schoen finden Sie diesen Ort?', {'gar nicht', 'sehr'}, 'Schönheit' ,screenConfig, language);
        scales{end+1} = Nu_createLikertScale('Wie stressig nehmen Sie diesen Ort wahr?', {'gar nicht', 'sehr'}, 'Stress' ,screenConfig, language);

    end
end