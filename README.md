FFmpeg-for-aks README
=====================

This is the custom FFmpeg library used in [insensiv's](https://insensiv.de/en/) [BIRD.IFICATION](https://insensiv.de/produkte/bird-ification/) product.
The build steps are provided as a Dockerfile. Use the following commands to build the library files:
```shell
docker buildx b -t ffmpeg-for-aks .
```
The installed library files are located in `/opt/insensiv/ffmpeg-for-aks` in the image.
