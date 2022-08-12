# Ogive function for turbulent flux characterization


[![DOI](https://zenodo.org/badge/524076017.svg)](https://zenodo.org/badge/latestdoi/524076017)

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
