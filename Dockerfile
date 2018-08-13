FROM ubuntu

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    openssl \
    python3 \
    python3-pip \
 && debconf-set-selections <<< "postfix postfix/mailname string iwalkbionic.com" \
 && debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'" \
 && apt-get install -y mailutils \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/log/iwalkbionic \
 && touch /var/log/iwalkbionic/info.log \
 && pip3 install --upgrade \
    pip \
    setuptools \
 && pip install \
    "pyramid==1.9.2" \
    paste \
    pyramid_chameleon

WORKDIR /root

ADD . /root/

RUN chmod 744 /root/iwalkbionic-starter \
 && cd /root \
 && pip3 install -e .

EXPOSE 80

CMD ["/root/iwalkbionic-starter"]
