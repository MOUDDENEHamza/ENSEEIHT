
function textStr = bin2str(binVector)
% STR2BIN Convert binary vector to text string
%
%     Syntax:           textStr = bin2str(binVector)
%
%     Example:          B = [ 0 1 0 1 0 1 0 0 0 1 1 0 1 0 0 0 ...
%                             0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 0 ...
%                             0 1 0 0 1 1 0 1 0 1 1 0 0 0 0 1 ...
%                             0 1 1 1 0 1 0 0 0 1 1 0 1 0 0 0 ...
%                             0 1 0 1 0 1 1 1 0 1 1 0 1 1 1 1 ...
%                             0 1 1 1 0 0 1 0 0 1 1 0 1 0 1 1 ...
%                             0 1 1 1 0 0 1 1   ].';
%                       aStr = bin2str(B);
%                       disp(aStr);
%                       
%
%     Written by:       Rick Rosson, 2007 December 19
%     Last Revised:     Rick Rosson, 2007 December 20
%
%
%     Copyright (c) 2007 The MathWorks, Inc.  All rights reserved.
%
%

    binValues = [ 128 64 32 16 8 4 2 1 ];
    
    binVector = binVector(:);
    
    if mod(length(binVector),8) ~= 0
        error('Length of binary vector is not a multiple of 8.');
    end
    
    binMatrix = reshape(binVector,8,[]);
    
    textStr = char(binValues*binMatrix);
    

end
