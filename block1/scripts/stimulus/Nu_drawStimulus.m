function Nu_drawStimulus(stimulus, screen, outlet)
%   Input:
%   - stimulus: struct with stimulus information as produced by Nu_createStimulus (struct)
%   - screen: struct with screen information as produced by Nu_setScreens (struct)
%   - outlet: labstreaminglayer outlet (lsl_outlet)
%
%   Draws the stimulus on the screen and sends an event marker to the labstreaminglayer outlet.

    Screen('DrawTexture', screen.window, stimulus.texture, [], stimulus.pos);
    Screen('Flip', screen.window);
    outlet.push_sample({['event: presentedStimulus; stimulus:' stimulus.id]});
end