FROM debian:stable-slim AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates wget make pkg-config gcc g++ build-essential \
    libgcrypt20-dev nettle-dev unbound \
    libgtk-3-dev libgtk2.0-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools \
    libxml2-dev libxslt-dev libxmlsec1-dev \
    && rm -rf /var/lib/apt/lists/*


# libffi
RUN wget https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz \
 && tar -xf libffi-3.4.2.tar.gz \
 && cd libffi-3.4.2 \
 && ./configure \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf libffi-3.4.2*

# libtasn1
RUN wget https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz \
 && tar -xf libtasn1-4.19.0.tar.gz \
 && cd libtasn1-4.19.0 \
 && ./configure \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf libtasn1-4.19.0*

# p11-kit
RUN wget https://github.com/p11-glue/p11-kit/releases/download/0.24.1/p11-kit-0.24.1.tar.xz \
 && tar -xf p11-kit-0.24.1.tar.xz \
 && cd p11-kit-0.24.1 \
 && ./configure \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf p11-kit-0.24.1*

# gnutls
RUN wget https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz \
 && tar -xf gnutls-3.6.16.tar.xz \
 && cd gnutls-3.6.16 \
 && ./configure --with-included-unistring \
 && make \
 && make install \
 && cd .. \
 && rm -rf gnutls-3.6.16*

# gwenhywfar
RUN wget https://www.aquamaniac.de/rdm/attachments/download/415/gwenhywfar-5.9.0.tar.gz \
 && tar -xf gwenhywfar-5.9.0.tar.gz \
 && cd gwenhywfar-5.9.0 \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -rf gwenhywfar-5.9.0*

RUN ldconfig

# aqbanking
RUN wget https://www.aquamaniac.de/rdm/attachments/download/467/aqbanking-6.5.3.tar.gz \
 && tar -xf aqbanking-6.5.3.tar.gz \
 && cd aqbanking-6.5.3 \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -rf aqbanking-6.5.3*

RUN ldconfig

FROM debian:stable-slim AS runtime
ENV LD_LIBRARY_PATH=/usr/local/lib
COPY --from=builder /usr/local /usr/local
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates libgcrypt20 nettle unbound libgtk-3-0 libgtk2.0-0 \
    qt5-gtk-platformtheme libxml2 libxslt1.1 libxmlsec1 \
    && rm -rf /var/lib/apt/lists/*
RUN ldconfig
CMD ["bash"]
