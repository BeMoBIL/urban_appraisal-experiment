function Nu_drawPrompt(scale, screen, outlet)
    %   Inputs:
    %   - screen: structure containing screen information as produced by Nu_setScreens (struct)
    %   - scale: structure containing the scale information as produced by Nu_createLikertScale or Nu_createSAMScale (struct)
    %   - outlet: outlet for the lab streaming layer (lsl_outlet)
    %
    %   Draws the prompt of the scale on the screen
        
        % Set the font size
        Screen('TextSize', screen.window, 24);
        
        % Draw the text centered in the screen
        DrawFormattedText(screen.window, scale.prompt.text, 'center', 'center', screen.colors.black);
        
        % Flip the screen to display the text
        Screen('Flip', screen.window);
        outlet.push_sample({['event: promptPresented; scale: ' scale.type]});
    end