function [e] = errorL1(f,Sf,h)
%ERRORL1 Summary of this function goes here
e = sum(abs(f -Sf),1) * h;

end

