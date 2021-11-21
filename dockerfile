FROM rocker/geospatial:4.1.2

RUN R -e "install.packages('sf')"
RUN R -e "install.packages('GADMTools')"
RUN R -e "install.packages('tsiR')"
