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


#Typical neuroimaging software installation here
#RUN apt-get -y install afni
#RUN apt-get -y install fsl

#Set up python
# Needed for the SPAMS install
RUN apt-get update && apt-get install -y python-numpy
RUN apt-get install -y python-scipy
# Install python-pip
RUN apt-get update && apt-get install -y python-pip

#Set up nipy and dipy
RUN apt-get install -y nipy-suite
RUN apt-get install -y python-dipy


# NODDI specific stuff here

#Set up linear algebra librarires
#Point to linear algebra libraries -- I think these get installed with numpy? 
#ENV LD_LIBRARY_PATH /usr/lib/:${LD_LIBRARY_PATH}
RUN apt-get install -y libblas-dev liblapack-dev

#Set up SPAMS
RUN wget http://spams-devel.gforge.inria.fr/hitcounter2.php?file=33816/spams-python-v2.5-svn2014-07-04.tar.gz
RUN mv hitcounter2.php?file=33816%2Fspams-python-v2.5-svn2014-07-04.tar.gz spams-python-v2.5-svn2014-07-04.tar.gz
RUN gunzip spams-python-v2.5-svn2014-07-04.tar.gz 
RUN tar xvf spams-python-v2.5-svn2014-07-04.tar
RUN cd spams-python && python setup.py build && python setup.py install

#install java JDK -- for camino 
RUN apt-get install -y default-jdk

#install unzip to unzip the camino file
RUN apt-get install -y unzip 

#install camino
COPY camino-code-be29107b79b741fea838a50cc419700dd79536bf.zip camino-code-be29107b79b741fea838a50cc419700dd79536bf.zip
ENV CAMINO_HEAP_SIZE 1800
RUN unzip camino-code-be29107b79b741fea838a50cc419700dd79536bf.zip && mv camino-code-be29107b79b741fea838a50cc419700dd79536bf camino
RUN ls && cd camino && make
RUN cd /usr/local/bin/ && ln -s /camino
ENV PATH /usr/local/bin/camino/bin:${PATH} 

#install lthe AMICO python libraries
#my vbox install was in /usr/local/lib/python2.7/dist-packages/amico
COPY AMICO-master AMICO-master 
RUN cd AMICO-master/python && pip install .


#set up fsl
RUN apt-get install -y fsl-core

#set up afni
RUN apt-get install -y afni

ENTRYPOINT /bin/bash

