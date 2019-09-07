ARG BASE_IMAGE=node:10.16.3
FROM ${BASE_IMAGE}

MAINTAINER Matthew Feickert <matthewfeickert@users.noreply.github.com>

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -y install chromium && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/*

RUN yarn global add mermaid && \
    yarn global add mermaid.cli

# Enable tab completion by uncommenting it from /etc/bash.bashrc
# The relevant lines are those below the phrase "enable bash completion in interactive shells"
RUN export SED_RANGE="$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+1)),$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+7))" && \
    sed -i -e "${SED_RANGE}"' s/^#//' /etc/bash.bashrc && \
    unset SED_RANGE

# Create user "docker" with sudo powers
RUN useradd -m docker && \
    usermod -aG sudo docker && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/docker/ && \
    mkdir /home/docker/data && \
    chown -R --from=root docker /home/docker

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV HOME /home/docker
WORKDIR ${HOME}/data
ENV USER docker
USER docker
ENV PATH ${HOME}/.local/bin:$PATH

CMD [ "/bin/bash" ]
