Building a Docker image for SWI-Prolog Pengines
========

Clone this repo to get the Dockerfile, then build with the following command, which tags the image as 'pengines'.

```
docker build -t pengines .
```

The image takes a few minute to build, as Pengines requires a recent SWI-Prolog that needs to be build from source on Linux.

Once the image is built, launch a Pengines container as follows, which will start on port 3030 of the container, mapped to the host.  The Dockerfile sets credentials for the admin section to both username and password of 'admin'. 

```
docker run -p 0.0.0.0:3030:3030 -t pengines
```

If you'd like to interact with the Pengines server, run it interactively:
```
docker run -p 0.0.0.0:3030:3030 -i -t pengines
```

You may also prefer to use `--rm` to ensure the container is removed when stopped, since it maps to the 3030 port on the host.

```
docker run --rm -p 0.0.0.0:3030:3030 -i -t pengines
```

By the way, if you are running it interactively, use `halt.` to stop the server.

```
?- halt.
```

If you experience any issues with this image or have any suggestions, please open an Issue or PR.
