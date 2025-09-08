function screenConfig = Nu_setScreens()
%   Output:
%   - screenConfig: struct with screen configuration with the following fields (struct)
%       - screenNumber: number of the screen to be used (int)
%       - colors: struct with colorindeces of the screen (struct)
%       - window: window to be used (int)
%       - center: struct with center coordinates of the screen (struct)
%       - width: width of the screen (int)
%       - height: height of the screen (int)
%
%   Creates a struct that cointains the configuration of the screen to be used.
%   The screen used is the external screen if avaliable, otherwise the main screen is used.
%   Many other scripts use the returned struct to draw on the screen correctly.

    Screen('Preference', 'SkipSyncTests', 1);
    screens = Screen('Screens');

    % Draw to the external screen if avaliable
    screenConfig.screenNumber = max(screens);

    % Define black and white
    screenConfig.colors.white = WhiteIndex(screenConfig.screenNumber);
    screenConfig.colors.black = BlackIndex(screenConfig.screenNumber);
    % screenConfig.colors.grey = screenConfig.colors.white / 2;
    
    % Open an on screen window
    [window, windowRect] = PsychImaging('OpenWindow', screenConfig.screenNumber, screenConfig.colors.white);
    [centerX, centerY] = RectCenter(windowRect);

    screenConfig.window = window;
    screenConfig.center.x = centerX;
    screenConfig.center.y = centerY;
    screenConfig.width = windowRect(3);
    screenConfig.height = windowRect(4);
end