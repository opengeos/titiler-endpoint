---
title: TiTiler Endpoint
emoji: 🚀
colorFrom: red
colorTo: red
sdk: docker
app_port: 7860
pinned: false
short_description: A TiTiler demo endpoint
license: mit
---

# titiler-endpoint

A TiTiler demo endpoint

To build the image:

```bash
docker build -t giswqs/titiler-endpoint:latest .
```

To run the image:

```bash
docker run --platform=linux/amd64 -p 7860:7860 --rm -it giswqs/titiler-endpoint
```
