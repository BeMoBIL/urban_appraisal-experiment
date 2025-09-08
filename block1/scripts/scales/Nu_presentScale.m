function response = Nu_presentScale(scale, stimulus, screenConfig, outlet)
%   Inputs:
%   - scale: structure containing the scale information as produced by Nu_createLikertScale or Nu_createSAMScale (struct)
%   - stimulus: structure containing the stimulus information as produced by Nu_createStimulus (struct)
%   - screenConfig: structure containing the screen configuration as produced by Nu_setScreens (struct)
%   - outlet: LSL outlet (lsl_outlet)
%   Outputs:
%   - response: response to the question (int)
%
%   Wrapper function to present a scale and record the response. Presents the stimulus first and after 500ms the scale.

    
    % Present the prompt Änderung 09-11: präsentieren nur
    % Skalenverankerung!
    Nu_drawScaleAnchors(scale, screenConfig, outlet);

    % Wait 
    WaitSecs(1);

    % Present the fixation cross
    Nu_fixationScreen(screenConfig, outlet);
    
    % Wait
    WaitSecs(0.5);

    % Present the stimulus
    Nu_drawStimulus(stimulus, screenConfig, outlet);
    
    % Wait
    WaitSecs(3);
    
    % Show Cursor
    ShowCursor;  

    % Present the scale
    if contains(scale.type, 'SAM')
        response = Nu_drawSAMScale(scale, screenConfig, stimulus, outlet);
    elseif contains(scale.type, 'Likert')
        response = Nu_drawLikertScale(scale, screenConfig, stimulus, outlet);
    end
    
    % Hide the mouse cursor
    HideCursor;
    
end