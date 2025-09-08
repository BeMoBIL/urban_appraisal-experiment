function Nu_goodbyeScreen(screen)
%   Inputs:
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%
%   Draws a goodbye screen and waits for a keypress to close the screen.

    % Draw a goodbye screen
    DrawFormattedText(screen.window, 'Thank you for participating!', 'center', 'center', screen.colors.white);
    Screen('Flip', screen.window);
    KbWait;
end