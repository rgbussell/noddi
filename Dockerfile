#This docker file builds the noddi scripts on top of the noddi base image
FROM rgbussell/noddi_base


ENV NODDI_PATH /usr/local/bin/noddi/
ENV PATH $NODDI_PATH/:${PATH}
COPY ./noddi_* $NODDI_PATH
RUN chmod a+wx $NODDI_PATH/*

COPY setupFslEnv /usr/local/bin/
RUN chmod a+x /usr/local/bin/setupFslEnv

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
