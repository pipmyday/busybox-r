FROM busybox:glibc

ENV R_HOME_DIR /usr/local/lib/R/
ENV R_HOME $R_HOME_DIR

ADD ./shared-libs /

RUN mkdir -p $R_HOME

ADD ./r-install $R_HOME
ADD ./r-install/lib /lib/

RUN mkdir -p /usr/bin \
    && ln -s $R_HOME"bin/exec/R" /usr/bin/R \
    && ln -s $R_HOME"bin/Rscript" /usr/bin/Rscript

CMD R