ARG BASE_IMAGE=node:15.5.0
FROM ${BASE_IMAGE}

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

# c.f. https://techoverflow.net/2018/06/05/how-to-fix-puppetteer-error-while-loading-shared-libraries-libx11-xcb-so-1-cannot-open-shared-object-file-no-such-file-or-directory/
RUN apt-get -qq -y update && \
    apt-get -qq -y install \
        gconf-service \
        libasound2 \
        libatk1.0-0 \
        libc6 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgcc1 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libstdc++6 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        ca-certificates \
        fonts-liberation \
        libappindicator1 \
        libnss3 \
        lsb-release \
        xdg-utils wget && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Pin at versions of Docker image build
RUN yarn global add puppeteer@5.5.0 && \
    yarn global add mermaid@8.8.4 && \
    yarn global add @mermaid-js/mermaid-cli@8.8.4

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Strangely, it seems that errors occur if user is NOT "node"
USER node
ENV USER node
ENV HOME /home/node
WORKDIR ${HOME}
RUN mkdir /home/node/data
WORKDIR ${HOME}/data
ENV PATH ${HOME}/.local/bin:$PATH

COPY puppeteer-config.json /home/node/

ENTRYPOINT [ "mmdc", "-p", "/home/node/puppeteer-config.json" ]
CMD [ "--help" ]
