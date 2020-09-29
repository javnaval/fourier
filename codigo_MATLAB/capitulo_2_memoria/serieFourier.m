function [Sx] = serieFourier(x, N)
%SERIEFOURIER en los puntos x , de orden N para la función onda de sierra

xRep = repmat(x,N,1);
n = 1:1:N;
n = n';
nRep = repmat(n,1,size(xRep,2));
den = pi*nRep;
if N == 1
    Sx = 1/2 - (1./den .* sin(2*pi*nRep .*xRep));
else
    Sx = 1/2 - sum(1./den .* sin(2*pi*nRep .*xRep));
    Sx = Sx';
end
end

