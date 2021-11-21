# sf-dependency-issue

The lastest sf R package will look for libgeos-3.8.0, libproj15 and libgdal26. Since those are relatively old packages, it caues denpendency issue for other R packages (such as sp, rgeos, and GADMTools).

To reproduce the issue, `docker-compose build` to create docker image and `docker-compose up` to open the Rstudio in `localhost:8787`. When `library(df)` in RStudio, one can see

```
Error: package or namespace load failed for ‘sf’ in dyn.load(file, DLLpath = DLLpath, ...):
unable to load shared object '/usr/local/lib/R/site-library/sf/libs/sf.so':
libproj.so.15: cannot open shared object file: No such file or directory
```

The error can be fixed by `RUN apt-get install -y libproj15`.
