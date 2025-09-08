function Nu_breakScreen(screen, waitTime, outlet, language)
%   Inputs:
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   - waitTime: time to wait in seconds (numeric)
%   - outlet: outlet for the lab streaming layer (lsl_outlet)
%
%   Draws a break screen for the specified amount of time.

    % Define the text to be displayed
    if strcmp(language, 'english')
        breakText = 'Taking a 3-minute break. Click with the mouse to end the break early.';
    else
        breakText = 'Sie machen eine 3-minuetige Pause. Klicken Sie mit der Maus, um die Pause vorzeitig zu beenden.';
    end
    
    % Set the font size
    Screen('TextSize', screen.window, 24);
    
    % Draw the text centered in the screen
    DrawFormattedText(screen.window, breakText, 'center', 'center', screen.colors.black);
    
    % Flip the screen to display the text
    Screen('Flip', screen.window);
    outlet.push_sample({'event: breakStart'});
    
    % Wait for the specified amount of time or button press
    WaitSecs(1);  
    % Get the start time
    startTime = GetSecs;

    % Initialize a flag to check if a mouse button was pressed
    buttonPressed = false;

    while (GetSecs - startTime) < waitTime && ~buttonPressed
        [x, y, buttons] = GetMouse;
        if any(buttons)  % Check if any button is pressed
            buttonPressed = true;
        else
            % Pause for a short duration to avoid overloading the CPU
            WaitSecs(0.01);  
        end
    end
    
    outlet.push_sample({'event: breakEnd'});
end