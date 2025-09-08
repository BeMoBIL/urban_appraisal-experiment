function scale = Nu_createLikertScale(prompt, answers, type, screen, language)
%   Inputs:
%   - prompt: string to display above scale (character array)
%   - type: topic of the scale (character array)
%   - screen: screen information (struct)
%   Outputs:
%   - scale: scale information with the following fields (struct) 
%       - option_circles: coordinates of circles for each option (4 x numOptions matrix)
%       - selection_circles: coordinates of circles for each selection (4 x numOptions matrix)
%       - numOptions: number of options (integer)
%       - response: text and coordinates of response options (struct)
%       - prompt: text and coordinates of prompt (struct)
%       - type: topic of the scale (character array)
%
%   Creates a Likert scale with the given prompt and topic. The struct contains
%   all the necessary information to display the scale.

    % Scale settings
    gap = 75;
    radius_option = 10;
    radius_select = 7;
    
    numOptions = 5;
    textGap = 100;
    ycenter = screen.center.y;
    
    % Create rectangles and circles
    circles_select = nan(4, numOptions);
    circles_option = nan(4, numOptions);

    for i = 1:numOptions
        baseX = screen.center.x - (numOptions-1)/2 * gap + (i-1) * gap;
        circles_select(:, i) = [baseX - radius_select, ycenter - radius_select, baseX + radius_select, ycenter + radius_select];
        circles_option(:, i) = [baseX - radius_option, ycenter - radius_option, baseX + radius_option, ycenter + radius_option];
    end

    scale.option_circles.coords = circles_option;
    scale.option_circles.radius = radius_option;
    scale.option_circles.border_width = 2;

    scale.selection_circles.coords = circles_select;
    scale.selection_circles.radius = radius_select;
    
    scale.numOptions = numOptions;
    
    scale.response.text = answers;
    scale.response.pos = [circles_option(1, 1) - textGap - 10, ycenter - 10, circles_option(1, 1) - textGap + 10, ycenter + 10; circles_option(1, end) + textGap - 10, ycenter - 10, circles_option(1, end) + textGap + 10, ycenter + 10];
    scale.response.color = screen.colors.black;

    scale.prompt.text = prompt;
    scale.prompt.x = 'center';
    scale.prompt.y = ycenter - 50; %Abstand Text und Skalenpunkte
    scale.prompt.color = screen.colors.black;

    scale.type = ['Likert-' type];
    
end