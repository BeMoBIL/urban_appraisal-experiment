function Nu_fixationScreen(screen, outlet)
    % Set the background color to white
    Screen('FillRect', screen.window, screen.colors.white);
    
    % Define the fixation cross characteristics
    fixCrossDimPix = 40; % Size of the cross arms
    lineWidthPix = 4; % Line width for the cross
    
    % Use the center coordinates directly from screenConfig
    xCenter = screen.center.x;
    yCenter = screen.center.y;
    
    % Set the lines for the fixation cross
    xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
    yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
    allCoords = [xCoords; yCoords];
    
    % Draw the fixation cross in black
    Screen('DrawLines', screen.window, allCoords, lineWidthPix, screen.colors.black, [xCenter, yCenter]);
    
    % Flip the screen to display the fixation cross
    Screen('Flip', screen.window);

    outlet.push_sample({'event: fixationCrossStart'});

    % Here you could add a delay or a wait for key press depending on your experiment's flow
    % Wait
    WaitSecs(0.5);
    
    outlet.push_sample({'event: fixationCrossEnd'});

end
