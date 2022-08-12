function [Og1,f1,u_star] = fitOgive(f,Og,z,meanU,varargin)
% [Og1,f1,u_star] = fitOgive(f,Og,z,meanU,varargin) fits an empirical Ogive
% model derived from the co-spectral density model proposed by ref.[1] 
% to the one estimated from time series. 
% 
% Inputs:
%   f: [N x 1] Frequency vector.
%   Og: [N x 1] Target Ogive function estimated from time series.
%   z: [1 x 1] measurement height.
%   meanU: [1 x 1] mean wind speed at height z.
%   Varargin: 
%       * guess [1 x 2] vector og inital parameters values. 
%       guess(1) is an empirical parameters with values around 10; guess(2)
%       is an initial estimate of the covariance <u'w'>.
%       * tolX and tolFun are parameters used in the fitting algorithm (cf,
%       lsqcurvefit)
%       * fmin [1x1] scalar is the minimal frequency considereed for the 
%       fitting
%       * fmax [1x1] scalar is the maximal frequency considered for the 
%       fitting
% 
% Output
%   Og1: [N x 1] Fitted ogive function
%   f1: [N x 1]  frequency vector associated with Og1
%   u_star: estimated covariance <u'w'>, equal to the friction velocity if 
%   the covariance <v'w'> is zero
% 
% Reference:
% [1] Kaimal, J. C., Wyngaard, J. C. J., Izumi, Y., & Coté, O. R. (1972). 
% Spectral characteristics of surface?layer turbulence. 
% Quarterly Journal of the Royal Meteorological Society, 98(417), 563-589.
% 
% Author. E. Cheynet - Universitetet i Stavanger - Norway
% Last modified: 13.06.2019
% 
% see also ogiveFun.m
% 

%% INPUT parser
p = inputParser();
p.CaseSensitive = false;
p.addOptional('guess',[14 0.5]);
p.addOptional('tolX',1e-6);
p.addOptional('tolFun',1e-6);
p.addOptional('fmin',f(1));
p.addOptional('fmax',f(end));
p.parse(varargin{:});
% check number of input: Number of outputs must be >=5 and <=17.
% shorthen the variables name
guess = p.Results.guess ;
tolX = p.Results.tolX ;
tolFun = p.Results.tolFun ;
fmin = p.Results.fmin ;
fmax = p.Results.fmax;


%% Fitting function
options=optimset('TolX',tolX,'TolFun',tolFun,'Display','iter');

indF = find(f>=fmin & f<=fmax);
Coeff = lsqcurvefit(@(para,f) targetOgive(para,f,z,meanU),guess,f(indF),Og(indF),[0.01 0.01],[50 4],options);

[Og1,f1] = targetOgive(Coeff,f,z,meanU);
u_star = Coeff(2);

    function [Og,varargout] = targetOgive(para,f,z,meanU)
        fr = f.*z./meanU;
        Suw = -(para(1).*z./meanU.*para(2).^2)./(1+3/4*para(1).*fr).^(7/3);
        [fOg,indF1] = sort(f,'descend');
        Og = -cumtrapz(fOg,Suw(indF1));
        if nargout==2,            varargout{1} = fOg;        end
    end
end

