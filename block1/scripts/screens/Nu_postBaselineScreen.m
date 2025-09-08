function Nu_postBaselineScreen(screen, language)
%   Inputs:
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   - language: language for the displayed text (string)
%
%   Displays a post-baseline message and waits for 5 seconds.

    % Define the post-baseline text to be displayed
    if strcmp(language, 'english')
        postBaselineText = 'The experiment starts in a few seconds.';
    else
        postBaselineText = 'Das Experiment beginnt in wenigen Sekunden.';
    end
    
    % Set the font size
    Screen('TextSize', screen.window, 24);
    
    % Draw the post-baseline text centered in the screen
    DrawFormattedText(screen.window, postBaselineText, 'center', 'center', screen.colors.black);
    
    % Flip the screen to display the post-baseline text
    Screen('Flip', screen.window);
    
    % Wait for 5 seconds
    WaitSecs(5);

    % Wait for a key press
    % KbWait;
end
