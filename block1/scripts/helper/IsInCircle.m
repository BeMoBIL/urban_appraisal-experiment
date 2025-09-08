function isInCircle = IsInCircle(x, y, xCenter, yCenter, radius)
% Input:
% - x, y: mouse click coordinates [number]
% - xCenter, yCenter: circle center coordinates [number]
% - radius: circle radius [number]
%
% Output:
% - isInCircle: 1 if mouse click is within circle, 0 otherwise [boolean]
% 
% Check if a point is within a circle

    % Check if mouse click is within a circle
    dist = sqrt((x - xCenter)^2 + (y - yCenter)^2);

    % Add 10 pixels to radius to account for border and make selection easier
    isInCircle = dist <= radius + 10;
end