function [e] = error(f, Sf)
%ERROR Summary of this function goes here

e = max(abs(f - Sf));

end

