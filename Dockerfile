FROM ubuntu

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl tmate && \
    mkdir /root/.ssh && \
    curl https://github.com/riklempens.keys >> /root/.ssh/authorized_keys && \
    curl -sSL https://get.docker.com/ | sh
ADD .tmate.conf /root/
ENV tmateName=SUPPORT
CMD tmate -F -n $tmateName
