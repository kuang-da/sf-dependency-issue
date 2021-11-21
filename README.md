# sf-dependency-issue

The lastest sf R package will look for `libgeos-3.8.0`, `libproj15` and `libgdal26`. Since those are relatively old packages, it caues denpendency issue for other R packages (such as sp, rgeos, and GADMTools).

To reproduce the issue, `docker-compose build` to create docker image and `docker-compose up` to open the Rstudio in `localhost:8787`. 

## libproj15

When `library(sf)` in RStudio, one can see

```
Error: package or namespace load failed for ‘sf’ in dyn.load(file, DLLpath = DLLpath, ...):
unable to load shared object '/usr/local/lib/R/site-library/sf/libs/sf.so':
libproj.so.15: cannot open shared object file: No such file or directory
```

The error can be fixed by adding `RUN apt-get install -y libproj15` to the Dockerfile. 

## libgdal26

But then we will have

```
Error: package or namespace load failed for ‘sf’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/usr/local/lib/R/site-library/sf/libs/sf.so':
  libgdal.so.26: cannot open shared object file: No such file or directory
```

This error can be fixed by adding `RUN apt-get install -y libgdal26` to the Dockerfile. 

## libgeos-3.8.0

But then we will have the following warning

```
Linking to GEOS 3.9.1, GDAL 3.0.4, PROJ 6.3.1
WARNING: different compile-time and runtime versions for GEOS found:
Linked against: 3.9.1-CAPI-1.14.2 compiled against: 3.8.0-CAPI-1.13.1
It is probably a good idea to reinstall sf, and maybe rgeos and rgdal too
```
This can be fixed by adding `RUN apt-get install -y libgeos-3.8.0` to the Dockerfile.

## Downstream conflictions

But if I install and import `rgeos`, it will show the following warning.

```
rgeos version: 0.5-8, (SVN revision 679)
 GEOS runtime version: 3.9.1-CAPI-1.14.2 
 Please note that rgeos will be retired by the end of 2023,
plan transition to sf functions using GEOS at your earliest convenience.
 GEOS using OverlayNG
 Linking to sp version: 1.4-6 
 Polygon checking: TRUE 

Warning message:
In fun(libname, pkgname) :
  rgeos: versions of GEOS runtime 3.9.1-CAPI-1.14.2
and GEOS at installation 3.8.0-CAPI-1.13.1diffe
```
Morevoer, the installation of `GADMTools` will fail.
