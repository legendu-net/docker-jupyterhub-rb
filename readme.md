# [dclong/jupyterhub-rb](https://hub.docker.com/r/dclong/jupyterhub-rb/)

JupyterLab with R base. 
**It is recommended that you use the image
[dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)
for data science related work.**

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Usage in Linux/Unix

```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -v $HOME:/workdir \
    dclong/jupyterlab-rb
```
```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -v $HOME:/workdir \
    dclong/jupyterlab-rb
```

```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=ubuntu \
    -e DOCKER_USER_ID=`id -u ubuntu` \
    -e DOCKER_PASSWORD=ubuntu \
    -v /home/ubuntu:/workdir \
    dclong/jupyterlab-rb
```
```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=ubuntu \
    -e DOCKER_USER_ID=`id -u ubuntu` \
    -v /home/ubuntu:/workdir \
    dclong/jupyterlab-rb
```


