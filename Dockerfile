FROM ubuntu

RUN apt update

# OS dependencies for execution and ingestion scripts
RUN apt install git wget python3 python3-pip -y

# Python dependencies for execution scripts
RUN pip3 install tiffile

# OS dependencies for R packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y r-base libxml2-dev libssl-dev curl libcurl4-openssl-dev libgdal-dev
# for R, RNRCS, openssl, RCurl, RCurl respectively.

# R dependencies for rainfall scripts
# HADS, NWS
RUN R -e 'install.packages(c("ggplot2","xts","RNRCS","metScanR","lubridate","plyr"))'
# QAQC
RUN R -e 'install.packages(c("reshape2","raster","sp","doParallel","foreach","fitdistrplus","tidyr","e1071","Metrics","rgdal","geosphere","data.table","randomForest", "caret", "dplyr"))'

# Python dependencies for ingestion scripts
RUN pip3 install agavepy python-dotenv pathlib