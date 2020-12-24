# DEPRECATED

This Docker image is deprecated in favor of the mermaid project supported tool [`mermaid-js/mermaid-cli`](https://github.com/mermaid-js/mermaid-cli) and its Docker image.

To get the `mermaid-js/mermaid-cli` Docker image run

```
docker pull minlag/mermaid-cli:latest
```

# mermaid-CLI headless Docker image

Docker image with headless [mermaid JS](https://mermaidjs.github.io/#/) and [mermaid CLI](https://github.com/mermaidjs/mermaid.cli)

[![Docker Automated build](https://img.shields.io/docker/automated/matthewfeickert/mermaid-cli.svg)](https://hub.docker.com/r/matthewfeickert/mermaid-cli/)
[![Docker Build Status](https://img.shields.io/docker/build/matthewfeickert/mermaid-cli.svg)](https://hub.docker.com/r/matthewfeickert/mermaid-cli/builds/)
[![Docker Pulls](https://img.shields.io/docker/pulls/matthewfeickert/mermaid-cli.svg)](https://hub.docker.com/r/matthewfeickert/mermaid-cli/)
[![download-size number-of-layers](https://images.microbadger.com/badges/image/matthewfeickert/mermaid-cli.svg)](https://microbadger.com/images/matthewfeickert/mermaid-cli)

## Node.js Installed Dependencies

All node dependencies installed with `yarn`


- node [v15.5.0](https://nodejs.org/dist/v15.5.0/docs/api/)
- [puppeteer](https://www.npmjs.com/package/puppeteer) [v5.5.0](https://www.npmjs.com/package/puppeteer/v/5.5.0)
- [mermaid](https://www.npmjs.com/package/mermaid) [v8.8.4](https://www.npmjs.com/package/mermaid/v/8.8.4)
- [@mermaid-js/mermaid-cli](https://www.npmjs.com/package/@mermaid-js/mermaid-cli) [v8.8.4](https://www.npmjs.com/package/@mermaid-js/mermaid-cli/v/8.8.4)

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

To get a listing of all the options just run

```
docker run --rm matthewfeickert/mermaid-cli:latest
```

as the Docker image `CMD` is `--help`.

```
$ docker run --rm matthewfeickert/mermaid-cli:latest
Usage: mmdc [options]

Options:
  -V, --version                                   output the version number
  -t, --theme [theme]                             Theme of the chart, could be default, forest, dark or neutral. Optional. Default: default (default: "default")
  -w, --width [width]                             Width of the page. Optional. Default: 800 (default: "800")
  -H, --height [height]                           Height of the page. Optional. Default: 600 (default: "600")
  -i, --input <input>                             Input mermaid file. Required.
  -o, --output [output]                           Output file. It should be either svg, png or pdf. Optional. Default: input + ".svg"
  -b, --backgroundColor [backgroundColor]         Background color. Example: transparent, red, '#F0F0F0'. Optional. Default: white
  -c, --configFile [configFile]                   JSON configuration file for mermaid. Optional
  -C, --cssFile [cssFile]                         CSS file for the page. Optional
  -s, --scale [scale]                             Puppeteer scale factor, default 1. Optional
  -f, --pdfFit                                    Scale PDF to fit chart
  -p --puppeteerConfigFile [puppeteerConfigFile]  JSON configuration file for puppeteer. Optional
  -h, --help                                      display help for command
```
