FROM debian:jessie

#RUN echo 'deb http://neuro.debian.net/debian jessie main' > /etc/apt/sources.list.d/neurodebian.sources#.list
#RUN echo 'deb http://neuro.debian.net/debian data main' >> /etc/apt/sources.list.d/neurodebian.sources.list
#RUN echo 'deb-src http://neuro.debian.net/debian-devel jessie main' >> /etc/apt/sources.list.d/neurodebian.sources.list
#RUN apt-key adv --recv-keys --keyserver pgp.mit.edu 0xA5D32F012649A5A9

# This resolved popularity-contest error with interactive dialog
ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get -y update
RUN apt-get install -y apt-utils

RUN apt-get install -y wget
RUN wget -O- http://neuro.debian.net/lists/jessie.us-ca.full |  tee /etc/apt/sources.list.d/neurodebian.sources.list
RUN apt-key adv --recv-keys --keyserver hkp://pgp.mit.edu:80 0xA5D32F012649A5A9

RUN apt-get -y update
RUN apt-get install -y apt-utils

RUN apt-get clean # This resolved a missing libxdamage error

#Set up python
# Needed for the SPAMS install
RUN apt-get install -y python-numpy
RUN apt-get install -y python-scipy


#Set up nipy and dipy
RUN apt-get install -y nipy-suite
RUN apt-get install -y python-dipy


# NODDI specific stuff here

#Set up SPAMS
RUN wget http://spams-devel.gforge.inria.fr/hitcounter2.php?file=33816/spams-python-v2.5-svn2014-07-04.tar.gz
RUN mv hitcounter2.php?file=33816%2Fspams-python-v2.5-svn2014-07-04.tar.gz spams-python-v2.5-svn2014-07-04.tar.gz
RUN gunzip spams-python-v2.5-svn2014-07-04.tar.gz 
RUN tar xvf spams-python-v2.5-svn2014-07-04.tar
RUN cd spams-python && python setup.py build
#RUN python setup.py install --prefix=/usr/local/

#install the AMICO python libraries
#my vbox install was in /usr/local/lib/python2.7/dist-packages/amico

RUN /bin/bash

#RUN echo installing python-dipy
#RUN apt-get -y install python-dipy
#RUN echo finished installing python-dipy


#RUN apt-get -y install afni
#RUN apt-get -y install fsl

