FROM rocker/verse:4.1.2

RUN apt-get update
RUN apt-get -y install libudunits2-dev
RUN apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update
RUN apt-get install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev 
RUN R -e "install.packages('sf')"
# First fix
# RUN apt-get install -y libproj15
# Second fix
# RUN apt-get install -y libgdal26
# Third fix
# RUN apt-get install -y libgeos-3.8.0
# GADMTools can not be installed
# RUN R -e "install.packages('sp')"
# RUN R -e "install.packages('rgeos')"
# RUN R -e "install.packages('GADMTools')"
