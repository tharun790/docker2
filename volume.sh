[vemulatharun790@localhost ~]$ pwd
/home/vemulatharun790
[vemulatharun790@localhost ~]$ nano Dockerfile
[vemulatharun790@localhost ~]$ docker build -t my-image .
[+] Building 267.4s (9/9) FINISHED                                              
 => [internal] load build definition from Dockerfile                       0.5s
 => => transferring dockerfile: 259B                                       0.5s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest           6.9s
 => [1/5] FROM docker.io/library/ubuntu:latest@sha256:9a0bdde4188b896a37  11.4s
 => => resolve docker.io/library/ubuntu:latest@sha256:9a0bdde4188b896a372  0.0s
 => => sha256:9a0bdde4188b896a372804be2384015e90e3f84906b 1.13kB / 1.13kB  0.0s
 => => sha256:c985bc3f77946b8e92c9a3648c6f31751a7dd972e066047 424B / 424B  0.0s
 => => sha256:58db3edaf2be6e80f628796355b1bdeaf8bea1692b4 2.30kB / 2.30kB  0.0s
 => => sha256:677076032cca0a2362d25cf3660072e738d1b96fe 29.53MB / 29.53MB  6.4s
 => => extracting sha256:677076032cca0a2362d25cf3660072e738d1b96fe860409a  3.8s
 => [internal] load build context                                          6.8s
 => => transferring context: 140.84MB                                      6.8s
 => [2/5] RUN apt-get update && apt-get install -y python3-pip           239.7s
 => [3/5] COPY . /app                                                      5.5s 
 => [4/5] WORKDIR /app                                                     0.1s 
 => ERROR [5/5] RUN pip3 install -r requirements.txt                       3.0s 
------                                                                          
 > [5/5] RUN pip3 install -r requirements.txt:                                  
#0 2.862 ERROR: Could not open requirements file: [Errno 2] No such file or directory: 'requirements.txt'
------
Dockerfile:5
--------------------
   3 |     COPY . /app
   4 |     WORKDIR /app
   5 | >>> RUN pip3 install -r requirements.txt
   6 |     CMD ["python3", "app.py"]
   7 |     
--------------------
ERROR: failed to solve: process "/bin/sh -c pip3 install -r requirements.txt" did not complete successfully: exit code: 1
[vemulatharun790@localhost ~]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
nginx        latest    3f8a00f137a0   6 days ago   142MB
[vemulatharun790@localhost ~]$ nano Dockerfile
[vemulatharun790@localhost ~]$ docker build -t my-image .
[+] Building 20.8s (9/9) FINISHED                                               
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 220B                                       0.0s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest           3.7s
 => [1/4] FROM docker.io/library/ubuntu:latest@sha256:9a0bdde4188b896a372  0.0s
 => [internal] load build context                                          1.0s
 => => transferring context: 682.01kB                                      0.9s
 => CACHED [2/4] RUN apt-get update && apt-get install -y python3-pip      0.0s
 => [3/4] COPY . /app                                                      4.5s
 => [4/4] WORKDIR /app                                                     0.1s
 => exporting to image                                                    11.5s
 => => exporting layers                                                   11.5s
 => => writing image sha256:ace18e7f027ca1fbde7141fe9a1cc324eb70637f3bd29  0.0s
 => => naming to docker.io/library/my-image                                0.0s
[vemulatharun790@localhost ~]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
my-image     latest    ace18e7f027c   20 seconds ago   607MB
nginx        latest    3f8a00f137a0   6 days ago       142MB
[vemulatharun790@localhost ~]$ nano DockerCompose.yaml
version: '3'
services:
  myservice:
    image: myimage
    volumes:
      - /home/vemulatharun790:/app/data
