# SphereSrvX 

> Nightly linux64 build of SphereSrvX

## About

A base image to be used for running Ultima Online servers. This image contains
[SphereSvrX-linux64-nightly.tar.gz](https://forum.spherecommunity.net/sshare.php?srt=4)
already installed. 

## Usage

Sphere requires specific folders to exist, since those folders can be
configured in the `sphere.ini` file and that file is highly coupled with each
shard, it's then up to you how to create them.

The usual convention is this folder structure:

```
/sphere 
 | spheresvr
 | sphere.ini
 | sphereCrypt.ini
 |--- accounts/
 |--- logs/
 |--- muls/
 |--- save/
 |--- scripts/
```

To run this container directly:

```bash
docker run -it ghcr.io/infernalholm/spheresvrx:main
```

**Notice**: SphereSrv requires the `--interactive` and `--tty` flags to be set.
