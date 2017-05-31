FROM ubuntu:14.04
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Download and install wkhtmltopdf
RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi
# RUN wget http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvfJ wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN sudo mv wkhtmltox/bin/* /usr/local/bin/
RUN rm -Rf wkhtmltox*

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
