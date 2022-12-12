# Ogive function for turbulent flux characterization

[![View Ogive function for turbulent flux characterization on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/71852-ogive-function-for-turbulent-flux-characterization)
[![DOI](https://zenodo.org/badge/524076017.svg)](https://zenodo.org/badge/latestdoi/524076017)
[![Donation](https://camo.githubusercontent.com/a37ab2f2f19af23730565736fb8621eea275aad02f649c8f96959f78388edf45/68747470733a2f2f77617265686f7573652d63616d6f2e636d68312e707366686f737465642e6f72672f316339333962613132323739393662383762623033636630323963313438323165616239616439312f3638373437343730373333613266326636393664363732653733363836393635366336343733326536393666326636323631363436373635326634343666366536313734363532643432373537393235333233303664363532353332333036313235333233303633366636363636363536353264373936353663366336663737363737323635363536653265373337363637)](https://www.buymeacoffee.com/echeynet)

## Summary

One method to compute the friction velocity knowing the along-wind and vertical turbulence components relies on the ogive function. For turbulence modelling, it is useful to ensure that the simulation duration is long enough to reduce the random error and to include all turbulent ranges.

The present submission implements a simple ogive function model based on the semi-empirical model proposed by Kaimal et al. [1]. In the example file, it is fitted in the least square sense to the ogive function computed with simulated data. The output of the fitting is an estimate of the friction velocity.

## Content

The submission contains:

• The function ogiveFun.m computes the ogive from the cospectral estimate.

• The function fitOgive.m that fits the analytical ogive model to the one estimated with the function ogiveFun.m.

• A data file data.m containing time series of u and w

• An interactive example file Example.mlx

Any question or suggestion or comment is welcomed.

## References

[1] Kaimal, J. C., Wyngaard, J. C. J., Izumi, Y., & Coté, O. R. (1972). Spectral characteristics of surface‐layer turbulence. Quarterly Journal of the Royal Meteorological Society, 98(417), 563-589.
