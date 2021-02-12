# largely based on rocker r-base image

FROM openanalytics/r-base

	
# system libraries of general use
RUN apt-get update && apt-get install -y sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.1 \
    libxml2-dev \
    python \
    python3-pip

RUN R -e "install.packages(c('devtools','shinydashboard','shinyjs','jsonlite','DT','shinycssloaders','shinytoastr','dplyr','shinyWidgets','httr','highcharter','googleAuthR','dplyr','jsonlite','collapsibleTree'),repos='http://cran.rstudio.com/')"

RUN R -e "devtools::install_github('MarkEdmondson1234/bigQueryR')"

CMD ["R"]
