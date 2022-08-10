FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get update && \
    apt-get install -y \
    make 

COPY build.sh c3.cc $SRC/
