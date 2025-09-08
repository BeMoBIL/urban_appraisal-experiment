function Nu_drawScaleAnchors(scale, screen, outlet)
    Screen('TextSize', screen.window, 24);
    
    % Draw anchors for Likert Scale
  if contains(scale.type, 'Likert')
    disp(['Scale type: ', scale.type]);
    terms = Nu_createScaleAnchors(scale.type);

    % Calculate text width for each anchor
    boundsLeft = Screen('TextBounds', screen.window, terms{1});
    widthLeft = RectWidth(boundsLeft);
    boundsRight = Screen('TextBounds', screen.window, terms{2});
    widthRight = RectWidth(boundsRight);

    % Define a constant gap between the two words
    gap = 100; % adjust this value as needed

    % Calculate positions for each anchor
    % Position the left anchor's right edge
    leftAnchorRightEdge = screen.center.x - gap / 2;
    leftAnchorX = leftAnchorRightEdge - widthLeft;

    % Position the right anchor's left edge
    rightAnchorLeftEdge = screen.center.x + gap / 2;
    rightAnchorX = rightAnchorLeftEdge;

    % Draw left and right anchor text with adjusted positions
    DrawFormattedText(screen.window, terms{1}, leftAnchorX, 'center', screen.colors.black);
    DrawFormattedText(screen.window, terms{2}, rightAnchorX, 'center', screen.colors.black);
     
 elseif contains(scale.type, 'SAM')
    % For SAM scales, focus on the first and last anchors
    firstAnchorText = scale.response.text{1};
    lastAnchorText = scale.response.text{end};

    % Calculate text width for each anchor
    boundsFirst = Screen('TextBounds', screen.window, firstAnchorText);
    widthFirst = RectWidth(boundsFirst);
    boundsLast = Screen('TextBounds', screen.window, lastAnchorText);
    widthLast = RectWidth(boundsLast);

    % Define a constant gap between the two words
    gap = 100; % adjust this value as needed

    % Calculate positions for each anchor
    % Position the first anchor's right edge
    firstAnchorRightEdge = screen.center.x - gap / 2;
    firstAnchorX = firstAnchorRightEdge - widthFirst;

    % Position the last anchor's left edge
    lastAnchorLeftEdge = screen.center.x + gap / 2;
    lastAnchorX = lastAnchorLeftEdge;

    % Draw the first and last anchor text with adjusted positions
    DrawFormattedText(screen.window, firstAnchorText, firstAnchorX, 'center', screen.colors.black);
    DrawFormattedText(screen.window, lastAnchorText, lastAnchorX, 'center', screen.colors.black);
  end

    Screen('Flip', screen.window);
    outlet.push_sample({['event: anchorsPresented; scale: ' scale.type]});
end
