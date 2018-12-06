FROM arm32v7/ubuntu

MAINTAINER jakezp@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# Update and install packages
RUN apt-get update && apt-get upgrade -yq && apt-get install curl git python-pip -yq && rm -rf /var/lib/apt/lists/*

# Adding webnut
RUN mkdir /app && cd /app && git clone https://github.com/rshipp/python-nut2.git && cd python-nut2 && python setup.py install && cd .. && git clone https://github.com/rshipp/webNUT.git && cd webNUT  && pip install -e .

# Add run and set permissions
ADD run.sh /run.sh
RUN chmod +x /run.sh

WORKDIR /app/webNUT

EXPOSE 6543

CMD ["/run.sh"]
