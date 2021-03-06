FROM debian:latest

RUN apt-get update && apt-get install -y \
    wget \
    sudo \
    gdebi-core \
    # r-needed:
    r-base \
    # for devtools: https://stackoverflow.com/questions/31114991/installation-of-package-devtools-had-non-zero-exit-status-in-a-powerpc
    libcurl4-gnutls-dev \
    libxt-dev \
    libssl-dev \
    libxml2 \
    libxml2-dev

# Download and install shiny server
RUN R -e "install.packages(c('shiny', 'devtools'), repos='http://cran.rstudio.com/')"
RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb \
    && gdebi -n shiny-server-1.5.9.923-amd64.deb \
    && rm -f shiny-server-1.5.9.923-amd64.deb

# IDEA part:
<<<<<<< HEAD
RUN R -e "devtools::install_github('likelet/shinyBS')"
=======
>>>>>>> d
RUN R -e "devtools::install_github('likelet/IDEA')"

# shiny server application & configuration
COPY inst/IDEA /srv/shiny-server/

EXPOSE 3838

CMD ["/bin/bash"]