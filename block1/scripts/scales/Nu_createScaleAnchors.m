    function terms = Nu_createScaleAnchors(scaleType)
    
    % Create anchors for Likert Scale
    switch scaleType
        case 'Likert-safety'
            terms = {'unsafe', 'safe'}; % Englisch
        case 'Likert-Sicherheit'
            terms = {'unsicher', 'sicher'}; % Deutsch

        case 'Likert-fascination'
            terms = {'boring', 'fascinating'}; % Englisch
        case 'Likert-Faszination'
            terms = {'langweilig', 'faszinierend'}; % Deutsch

        case 'Likert-openness'
            terms = {'narrow', 'open'}; % Englisch
        case 'Likert-Offenheit'
            terms = {'dicht', 'offen'}; % Deutsch

        case 'Likert-hominess'
            terms = {'alienated', 'at home'}; % Englisch
        case 'Likert-Heimeligkeit'
            terms = {'fremd', 'zuhause'}; % Deutsch

        case 'Likert-beauty'
            terms = {'ugly', 'beautiful'}; % Englisch
        case 'Likert-Schönheit'
            terms = {'haesslich', 'schoen'}; % Deutsch

        case 'Likert-stress'
            terms = {'relaxed', 'stressful'}; % Englisch
        case 'Likert-Stress'
            terms = {'entspannt', 'stressig'}; % Deutsch
    % unhandled scale types
        otherwise
            terms = {'unknown', 'unknown'};
    end
end

