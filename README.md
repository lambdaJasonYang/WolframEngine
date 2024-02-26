# Dockerized Wolfram Engine 14.0

## Why?

Sometimes the official site doesnt have the most up-to-date image so you have to make your own.

## How to use

```bash
docker pull ghcr.io/lambdajasonyang/wolframengine:main
```

## building your own image with this image as a base

```yml
FROM ghcr.io/lambdajasonyang/wolframengine:main

ARG WOLFRAM_ID
ARG WOLFRAM_PASSWORD
RUN test -n "$WOLFRAM_ID" || (echo "WOLFRAM_ID build-arg not set" && false)
RUN test -n "$WOLFRAM_PASSWORD" || (echo "WOLFRAM_PASSWORD build-arg not set" && false)

#yes we need two activate commands
RUN wolframscript -activate -username $WOLFRAM_ID -password $WOLFRAM_PASSWORD
RUN wolframscript -activate

CMD ["wolframscript"]
```

```bash
docker build -t my-wolfram-engine-14  --build-arg="WOLFRAM_ID=yourusername@example.com" --build-arg="WOLFRAM_PASSWORD=yourpassword" .
```
