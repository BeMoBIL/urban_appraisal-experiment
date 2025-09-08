function response = Nu_drawSAMScale(scale, screen, stimulus, outlet)

%   Inputs:
%   - scale: structure containing scale information as produced by Nu_createSAMScale (struct)
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   - stimulus: structure containing stimulus information as produced by Nu_createStimulus (struct)
%   - outlet: LSL outlet for sending event markers (lsl_outlet)
%   Outputs:
%   - response: response selected by participant (int)
%
%   Draws the scale and stimulus to the screen and waits for a response. Returns the response selected by the participant.


    % Draw prompt
    Screen('TextSize', screen.window, 24);

    drawScale(scale, screen); %, stimulus);
    Screen('Flip', screen.window);
    outlet.push_sample({['event: scalePresented; scale: ' scale.type '; stimulus: ' stimulus.id]});
    
    % Initialize response
    response = -1;
    previous_response = -1;
    
    % Wait for response 
    while response == -1
        % Check for response
        [x, y, buttons] = GetMouse(screen.window);
        
        if any(buttons)
            for i = 1:scale.numOptions
                if IsInCircle(x, y, scale.option_circles.coords(1, i), scale.option_circles.coords(2, i), scale.option_circles.radius)
                    response = i;
                    
                    drawScale(scale, screen, stimulus);
                    Screen('FillOval', screen.window, screen.colors.black, scale.selection_circles.coords(:,i), scale.selection_circles.radius);
                    Screen('Flip', screen.window);
                    break;
                end
            end
        end         
    end

    % Send event marker
    outlet.push_sample({['event: optionConfirmed; scale: ' scale.type  '; stimulus: ' stimulus.id '; response: ' num2str(response)]});
end

function drawScale(scale, screen, stimulus)
%   Inputs:
%   - scale: structure containing scale information as produced by Nu_createSAMScale (struct)
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   - stimulus: structure containing stimulus information as produced by Nu_createStimulus (struct)
%
%   Draws the scale and stimulus to the screen.

    % Draw prompt
    DrawFormattedText(screen.window, scale.prompt.text, scale.prompt.x, scale.prompt.y, scale.prompt.color);
    % Draw response text
    for i = 1:2
        DrawFormattedText(screen.window, scale.response.text{i}, 'center', 'center', scale.response.color, [], [], [], [], [], scale.response.limit_pos(i,:));
    end
    % Draw scale image
    Screen('DrawTexture', screen.window, scale.response.texture, [], scale.response.pos);
    % Draw scale
    Screen('FillOval', screen.window, screen.colors.white, scale.option_circles.coords, scale.option_circles.radius);
    Screen('FrameOval', screen.window, screen.colors.black, scale.option_circles.coords, scale.option_circles.border_width);


    % Draw stimulus image
    %Screen('DrawTexture', screen.window, stimulus.texture, [], stimulus.pos);
end