function outlet = Nu_createLSLOutlet(name)
%   Input: 
%   - name: name of the LSL stream (string)
%   Output: 
%   - outlet: outlet to send markers to (LSL outlet object)
%
% creates an LSL outlet for a marker stream with the given name
% and returns the outlet object. 
%
% The outlet is an object that can be used to push markers to the LSL stream.

    streamInfo = lsl_streaminfo(lsl_loadlib(), name, 'Markers', 1, 0, 'cf_string', 'myuniquesourceid23443');
    outlet = lsl_outlet(streamInfo);
end