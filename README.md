# mermaid-CLI headless Docker image

Docker image with headless [mermaid JS](https://mermaidjs.github.io/#/) and [mermaid CLI](https://github.com/mermaidjs/mermaid.cli)

[![Docker Automated build](https://img.shields.io/docker/automated/matthewfeickert/mermaid-cli.svg)](https://hub.docker.com/r/matthewfeickert/mermaid-cli/)
[![Docker Build Status](https://img.shields.io/docker/build/matthewfeickert/mermaid-cli.svg)](https://hub.docker.com/r/matthewfeickert/mermaid-cli/builds/)
[![Docker Pulls](https://img.shields.io/docker/pulls/matthewfeickert/mermaid-cli.svg)](https://hub.docker.com/r/matthewfeickert/mermaid-cli/)
[![download-size number-of-layers](https://images.microbadger.com/badges/image/matthewfeickert/mermaid-cli.svg)](https://microbadger.com/images/matthewfeickert/mermaid-cli)

## Node.js Installed Dependencies

All node dependencies installed with `yarn`

- node [v10.16.3](https://nodejs.org/dist/v10.16.3/docs/api/)
- [phantomjs-prebuilt](https://www.npmjs.com/package/phantomjs-prebuilt) [v2.1.16](https://www.npmjs.com/package/phantomjs-prebuilt/v/2.1.16) ![](https://img.shields.io/badge/package-deprecated-red.svg)
- [mermaid](https://www.npmjs.com/package/mermaid) [v8.2.6](https://www.npmjs.com/package/mermaid/v/8.2.6)
- [mermaid.cli](https://www.npmjs.com/package/mermaid.cli) [v0.5.1](https://www.npmjs.com/package/mermaid.cli/v/0.5.1)

## Install

Get the [image from Docker Hub](https://hub.docker.com/r/matthewfeickert/mermaid-cli)

```
docker pull matthewfeickert/mermaid-cli:<tag>
```

## Run

The `ENTRYPOINT` is `mmdc -p /home/node/puppeteer-config.json` so you can use the image as a CLI utility via

```
docker run --rm -v $PWD:/home/node/data matthewfeickert/mermaid-cli:latest -i <input_file.mmd> -o <output_file.ext>
```

where `ext` is one of the supported extensions.
