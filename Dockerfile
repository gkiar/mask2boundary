FROM alpine:edge
MAINTAINER Greg Kiar <gkiar.github.io>

RUN apk update
RUN apk --no-cache --update-cache add gcc gfortran python3 python3-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN pip3 install --upgrade pip &&\
    pip3 install numpy>=1.9.0
RUN pip3 install scipy==1.2.0 nibabel

RUN mkdir -p /opt
COPY ./mask2boundary.py /opt/mask2boundary.py

ENTRYPOINT ["python3", "/opt/mask2boundary.py"]
