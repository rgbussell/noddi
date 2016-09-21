#This docker file builds the noddi scripts on top of the noddi base image
FROM rgbussell/noddi_base

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENV NODDI_PATH /usr/local/bin/noddi/
ENV PATH $NODDI_PATH/:${PATH}
COPY ./noddi_* $NODDI_PATH
RUN chmod a+x $NODDI_PATH/*
RUN chmod a+w $NODDI_PATH/*

ENTRYPOINT bash
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
