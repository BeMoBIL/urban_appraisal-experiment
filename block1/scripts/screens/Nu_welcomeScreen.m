function Nu_welcomeScreen(screen, language)
%   Inputs:
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%
%   Draws a welcome screen and waits for a key press to continue.

    % Set up the screen
    Screen('TextSize', screen.window, 24);
    Screen('TextFont', screen.window, 'Arial');
    Screen('FillRect', screen.window, screen.colors.white);

    % Draw the welcome message
    if strcmp(language, 'english')
        message = 'Welcome to the experiment!\n\nClick to continue.';
    else
        message = 'Willkommen zum Experiment!\n\nKlicken Sie, um fortzufahren.';
    end
    
    DrawFormattedText(screen.window, message, 'center', 'center', screen.colors.black);
    Screen('Flip', screen.window);

    buttonPressed = false;
    while ~buttonPressed
        [x, y, buttons] = GetMouse;
        if any(buttons)  % Check if any button is pressed
            buttonPressed = true;
        else
            % Pause for a short duration to avoid overloading the CPU
            WaitSecs(0.01);  
        end
    end
    % Clear the screen before the start of the experiment
    Screen('FillRect', screen.window, screen.colors.white);
    Screen('Flip', screen.window);
end