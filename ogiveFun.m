function [Og,fOg] = ogiveFun(f,Co_uw)
% [Og,fOg] = ogiveFun(f,Co_uw) computes the ogive function from the
% cospectral densities estimate.
% 
% Inputs:
%   f: [N x 1] Frequency vector.
%   Co_uw: [N x 1] Co-spectral densities between the along-wind and
%   vertical wind components
% 
% Output
%   Og: [N x 1] Ogive function estimate
%   f: [N x 1]  frequency vector associated with Og
% 
% Author. E. Cheynet - Universitetet i Stavanger - Norway
% Last modified: 13.06.2019
% 
% see also fitOgive.m
% 


[fOg,indF] = sort(f,'descend');
Og = -cumtrapz(fOg,Co_uw(indF));



% syms Suw f0 A B fr0 meanU z f
% Suw = -A.*(z./meanU)./(1+B.*(z.*f./meanU)).^(7/3);
% int(Suw,f)
% % int is (3*A)/(4*B*((B*f*z)/meanU + 1)^(4/3))
% % A = 4/3*B;

end

