FROM rocker/verse:4.1.2

RUN apt-get update
RUN apt-get -y install libudunits2-dev
RUN apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update
RUN apt-get install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev 
# RUN apt-get install -y libudunits2-dev
# RUN apt-get install -y libgeos-3.8.0
# RUN apt-get install -y libproj15
# RUN apt-get install -y libgdal26
RUN R -e "install.packages('sf')"
# RUN R -e "install.packages('sp')"
# RUN R -e "install.packages('rgeos', version='0.5-1')"

# RUN R -e "install.packages('GADMTools', version = '3.6.1')"
# RUN R -e "install.packages('tsiR')"
# sudo ln -s /usr/lib/x86_64-linux-gnu/libproj.so.19 /usr/lib/x86_64-linux-gnu/libproj.so.15
