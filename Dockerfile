FROM ubuntu:latest 

LABEL AUTHOR="ben@lobmueller.com"

ENV LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update --fix-missing
RUN apt -y install software-properties-common 
RUN add-apt-repository universe
RUN apt-get update --fix-missing
RUN apt-get -y install wget make pkg-config gcc libgcrypt20-dev nettle-dev unbound libgtk-3-dev build-essential libgtk2.0-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libxml2-dev libxslt-dev --fix-missing

RUN wget http://www.aleksey.com/xmlsec/download/xmlsec1-1.2.34.tar.gz
RUN tar -xf xmlsec1-1.2.34.tar.gz
RUN cd xmlsec1-1.2.34 && ./configure && make && make install

RUN wget https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
RUN tar -xf libffi-3.4.2.tar.gz
RUN cd libffi-3.4.2 && ./configure && make && make check && make install

RUN wget https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz
RUN tar -xf libtasn1-4.19.0.tar.gz
RUN cd libtasn1-4.19.0 && ./configure && make && make check && make install

RUN wget https://github.com/p11-glue/p11-kit/releases/download/0.24.1/p11-kit-0.24.1.tar.xz
RUN tar -xf p11-kit-0.24.1.tar.xz
RUN cd p11-kit-0.24.1 && ./configure && make && make check && make install

RUN wget https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz
RUN tar -xf gnutls-3.6.16.tar.xz
RUN cd gnutls-3.6.16 && ./configure --with-included-unistring && make && make install

RUN wget https://www.aquamaniac.de/rdm/attachments/download/415/gwenhywfar-5.9.0.tar.gz
RUN tar -xf gwenhywfar-5.9.0.tar.gz
RUN cd gwenhywfar-5.9.0 && ./configure && make && make install

RUN ldconfig

RUN wget https://www.aquamaniac.de/rdm/attachments/download/467/aqbanking-6.5.3.tar.gz
RUN tar -xf aqbanking-6.5.3.tar.gz
RUN cd aqbanking-6.5.3 && ./configure && make && make install

RUN ldconfig