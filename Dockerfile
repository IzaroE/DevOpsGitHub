FROM ubuntu:22.04 AS build

COPY helloworld.c /opt/hellodocker.c
RUN apt update -qq \
&& apt install -y gcc \
&& gcc -o /opt/main /opt/hellodocker.c 
#&& rm /opt/hellodocker.c

FROM ubuntu:22.04 

COPY --from=build /opt/main /usr/main