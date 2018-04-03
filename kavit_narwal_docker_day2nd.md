Run a docker container from &quot;hello-world&quot; image. :-

[root@web01 ~]#

[root@web01 ~]# docker run hello-world

Unable to find image &#39;hello-world:latest&#39; locally

latest: Pulling from library/hello-world

ca4f61b1923c: Pull complete

Digest: sha256:97ce6fa4b6cdc0790cda65fe7290b74cfebd9fa0c9b8c38e979330d547d22ce1

Status: Downloaded newer image for hello-world:latest

Hello from Docker!

This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:

1. The Docker client contacted the Docker daemon.

2. The Docker daemon pulled the &quot;hello-world&quot; image from the Docker Hub.

   (amd64)

3. The Docker daemon created a new container from that image which runs the

   executable that produces the output you are currently reading.

4. The Docker daemon streamed that output to the Docker client, which sent it

   to your terminal.

To try something more ambitious, you can run an Ubuntu container with:

$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:

https://cloud.docker.com/

For more examples and ideas, visit:

https://docs.docker.com/engine/userguide/

[root@web01 ~]#

[root@web01 ~]#



Pull &quot;alpine&quot; image from docker registry and see if image is available in your local image list. :-



[root@web01 ~]# docker pull alpine

Using default tag: latest

latest: Pulling from library/alpine

ff3a5c916c92: Pull complete

Digest: sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0

Status: Downloaded newer image for alpine:latest

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB

test1               latest              8a912ef63f8b        4 hours ago         209MB

ubuntu              latest              f975c5035748        3 weeks ago         112MB

alpine              latest              3fd9065eaf02        2 months ago        4.15MB

hello-world         latest              f2a91732366c        4 months ago        1.85kB

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#



Pull some specific version of docker &quot;alpine&quot; image from docker registry. :-

[root@web01 ~]# docker pull alpine:3.6

3.6: Pulling from library/alpine

605ce1bd3f31: Pull complete

Digest: sha256:3d44fa76c2c83ed9296e4508b436ff583397cac0f4bad85c2b4ecc193ddb5106

Status: Downloaded newer image for alpine:3.6

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB

test1               latest              8a912ef63f8b        4 hours ago         209MB

ubuntu              latest              f975c5035748        3 weeks ago         112MB

alpine              latest              3fd9065eaf02        2 months ago        4.15MB

alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB

hello-world         latest              f2a91732366c        4 months ago        1.85kB

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#



Run a docker container from local image &quot;alpine&quot; and run an inline command &quot;ls -l&quot; while running container. :-



[root@web01 ~]#

[root@web01 ~]# docker run -d -it 3fd9065eaf02 ls -la

37959a1f4415d0d8a00b906248198f81b26ab1bc50709e3cc15d4d6927db8141

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker ps -a

CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS                      PORTS               NAMES

37959a1f4415        3fd9065eaf02        &quot;ls -la&quot;                 11 seconds ago       Exited (0) 10 seconds ago                       awesome\_stonebraker

2b3ad7bacfdf        alpine              &quot;--name linux-alpine&quot;   33 minutes ago      Created                                         brave\_archimedes

50b07b072d31        hello-world         &quot;/hello&quot;                 39 minutes ago      Exited (0) 39 minutes ago                       optimistic\_jones

281ad7e8728b        ubuntu              &quot;useradd kavit&quot;          5 hours ago         Exited (9) 5 hours ago                          dazzling\_pike

d2a64e1df3fd        ubuntu              &quot;/bin/bash&quot;              5 hours ago         Up 5 hours                                      gracious\_booth

7f9669c199a3        ubuntu              &quot;/bin/bash&quot;              5 hours ago         Up 5 hours                                      sharp\_newton

d434613852ef        ubuntu              &quot;/bin/bash&quot;              7 hours ago         Up 7 hours                                      kavit1

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker stop d2a64e1df3fd

d2a64e1df3fd

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker ps -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES

37959a1f4415        3fd9065eaf02        &quot;ls -la&quot;                 33 minutes ago      Exited (0) 10 minutes ago                       awesome\_stonebraker

2b3ad7bacfdf        alpine              &quot;--name linux-alpine&quot;   35 minutes ago      Created                                         brave\_archimedes

50b07b072d31        hello-world         &quot;/hello&quot;                 41 minutes ago      Exited (0) 41 minutes ago                       optimistic\_jones

281ad7e8728b        ubuntu              &quot;useradd kavit&quot;          5 hours ago         Exited (9) 5 hours ago                          dazzling\_pike

d2a64e1df3fd        ubuntu              &quot;/bin/bash&quot;              5 hours ago         Up 2 seconds                                    gracious\_booth

7f9669c199a3        ubuntu              &quot;/bin/bash&quot;              5 hours ago         Up 5 hours                                      sharp\_newton

d434613852ef        ubuntu              &quot;/bin/bash&quot;              7 hours ago         Up 7 hours                                      kavit1

[root@web01 ~]#



Try to remove &quot;alpine&quot; image from your local system. :-



[root@web01 ~]# docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

test1               latest              8a912ef63f8b        4 hours ago         209MB

kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB

ubuntu              latest              f975c5035748        3 weeks ago         112MB

alpine              latest              3fd9065eaf02        2 months ago        4.15MB

alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB

hello-world         latest              f2a91732366c        4 months ago        1.85kB

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker rmi -f 3fd9065eaf02

Untagged: alpine:latest

Untagged: alpine@sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0

Deleted: sha256:3fd9065eaf02feaf94d68376da52541925650b81698c53c6824d92ff63f98353

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB

test1               latest              8a912ef63f8b        4 hours ago         209MB

ubuntu              latest              f975c5035748        3 weeks ago         112MB

alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB

hello-world         latest              f2a91732366c        4 months ago        1.85kB

[root@web01 ~]#

Again pull &quot;alpine&quot; image from docker registry. :-

[root@web01 ~]# docker pull alpine

Using default tag: latest

latest: Pulling from library/alpine

ff3a5c916c92: Already exists

Digest: sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0

Status: Downloaded newer image for alpine:latest

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

test1               latest              8a912ef63f8b        4 hours ago         209MB

kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB

ubuntu              latest              f975c5035748        3 weeks ago         112MB

alpine              latest              3fd9065eaf02        2 months ago        4.15MB

alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB

hello-world         latest              f2a91732366c        4 months ago        1.85kB

[root@web01 ~]#



Take interactive login to bash while running docker container from &quot;alpine&quot; image. :-

[root@web01 ~]# docker run -d -it 3fd9065eaf02

ee4eaffff0baaa25392dae8152a751087630151a2e0edc0b4e35738c6060ac5e

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker ps -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                         PORTS               NAMES

ee4eaffff0ba        3fd9065eaf02        &quot;/bin/sh&quot;                6 seconds ago       Up 5 seconds                                       elegant\_panini

02e3e463a4c1        3fd9065eaf02        &quot;/bin/bash&quot;              2 minutes ago       Created                                            priceless\_euler

a30499fa154e        3fd9065eaf02        &quot;/bin/bash&quot;              7 minutes ago       Created                                            clever\_hopper

37959a1f4415        3fd9065eaf02        &quot;ls -la&quot;                 About an hour ago   Exited (0) 24 minutes ago                          awesome\_stonebraker

2b3ad7bacfdf        alpine              &quot;--name linux-alpine&quot;   About an hour ago   Created                                            brave\_archimedes

50b07b072d31        hello-world         &quot;/hello&quot;                 About an hour ago   Exited (0) About an hour ago                       optimistic\_jones

281ad7e8728b        ubuntu              &quot;useradd kavit&quot;          6 hours ago         Exited (9) 6 hours ago                             dazzling\_pike

d2a64e1df3fd        ubuntu              &quot;/bin/bash&quot;              6 hours ago         Up 27 minutes                                      gracious\_booth

7f9669c199a3        ubuntu              &quot;/bin/bash&quot;              6 hours ago         Up 6 hours                                         sharp\_newton

d434613852ef        ubuntu              &quot;/bin/bash&quot;              7 hours ago         Up 7 hours                                         kavit1

[root@web01 ~]# docker exec -it 886696533f0d /bin/sh

/ #

/ #

/ # ls

bin    etc    lib    mnt    root   sbin   sys    usr

dev    home   media  proc   run    srv    tmp    var

/ #



Stop a container using Container ID. :-

[root@web01 ~]# docker ps -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                         PORTS               NAMES

886696533f0d        3fd9065eaf02        &quot;/bin/sh&quot;                2 minutes ago       Up 2 minutes                                       dazzling\_sinoussi

ee4eaffff0ba        3fd9065eaf02        &quot;/bin/sh&quot;                16 minutes ago      Up 16 minutes                                      elegant\_panini

02e3e463a4c1        3fd9065eaf02        &quot;/bin/bash&quot;              19 minutes ago      Created                                            priceless\_euler

a30499fa154e        3fd9065eaf02        &quot;/bin/bash&quot;              24 minutes ago      Created                                            clever\_hopper

37959a1f4415        3fd9065eaf02        &quot;ls -la&quot;                 About an hour ago   Exited (0) 41 minutes ago                          awesome\_stonebraker

2b3ad7bacfdf        alpine              &quot;--name linux-alpine&quot;   About an hour ago   Created                                            brave\_archimedes

50b07b072d31        hello-world         &quot;/hello&quot;                 About an hour ago   Exited (0) About an hour ago                       optimistic\_jones

281ad7e8728b        ubuntu              &quot;useradd kavit&quot;          6 hours ago         Exited (9) 6 hours ago                             dazzling\_pike

d2a64e1df3fd        ubuntu              &quot;/bin/bash&quot;              6 hours ago         Up 29 minutes                                      gracious\_booth

7f9669c199a3        ubuntu              &quot;/bin/bash&quot;              6 hours ago         Up 6 hours                                         sharp\_newton

d434613852ef        ubuntu              &quot;/bin/bash&quot;              7 hours ago         Up 7 hours                                         kavit1

[root@web01 ~]#



Start same container using ID and exec a command &quot;echo &#39;hello world!&#39;&quot; in docker container without instantiating a new container. :-

[root@web01 ~]# docker start 886696533f0d

886696533f0d

[root@web01 ~]#

[root@web01 ~]# docker exec -it 886696533f0d /bin/sh

/ # echo &quot;hello world!&quot;

hello world!

/ # read escape sequence

[root@web01 ~]# docker exec -it 886696533f0d /bin/sh

/ # &quot;echo &#39;hello world!&#39;&quot;

/bin/sh: echo &#39;hello world!&#39;: not found

/ #

/ # echo &quot;hello world!&quot;

hello world!

/ #



Inspect already downloaded &quot;alpine&quot; docker image using docker inspect command. :-

[root@web01 ~]# docker inspect 3fd9065eaf02

[

   {

       &quot;Id&quot;: &quot;sha256:3fd9065eaf02feaf94d68376da52541925650b81698c53c6824d92ff63f98353&quot;,

       &quot;RepoTags&quot;: [

           &quot;alpine:latest&quot;

       ],

       &quot;RepoDigests&quot;: [

           &quot;alpine@sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0&quot;

       ],

       &quot;Parent&quot;: &quot;&quot;,

       &quot;Comment&quot;: &quot;&quot;,

       &quot;Created&quot;: &quot;2018-01-09T21:10:58.579708634Z&quot;,

       &quot;Container&quot;: &quot;30e1a2427aa2325727a092488d304505780501585a6ccf5a6a53c4d83a826101&quot;,

       &quot;ContainerConfig&quot;: {

           &quot;Hostname&quot;: &quot;30e1a2427aa2&quot;,

           &quot;Domainname&quot;: &quot;&quot;,

           &quot;User&quot;: &quot;&quot;,

           &quot;AttachStdin&quot;: false,

           &quot;AttachStdout&quot;: false,

           &quot;AttachStderr&quot;: false,

           &quot;Tty&quot;: false,

           &quot;OpenStdin&quot;: false,

           &quot;StdinOnce&quot;: false,

           &quot;Env&quot;: [

               &quot;PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot;

           ],

           &quot;Cmd&quot;: [

               &quot;/bin/sh&quot;,

               &quot;-c&quot;,

               &quot;#(nop) &quot;,

               &quot;CMD [\&quot;/bin/sh\&quot;]&quot;

           ],

           &quot;ArgsEscaped&quot;: true,

           &quot;Image&quot;: &quot;sha256:fbef17698ac8605733924d5662f0cbfc0b27a51e83ab7d7a4b8d8a9a9fe0d1c2&quot;,

           &quot;Volumes&quot;: null,

           &quot;WorkingDir&quot;: &quot;&quot;,

           &quot;Entrypoint&quot;: null,

           &quot;OnBuild&quot;: null,

           &quot;Labels&quot;: {}

       },

       &quot;DockerVersion&quot;: &quot;17.06.2-ce&quot;,

       &quot;Author&quot;: &quot;&quot;,

       &quot;Config&quot;: {

           &quot;Hostname&quot;: &quot;&quot;,

           &quot;Domainname&quot;: &quot;&quot;,

           &quot;User&quot;: &quot;&quot;,

           &quot;AttachStdin&quot;: false,

           &quot;AttachStdout&quot;: false,

           &quot;AttachStderr&quot;: false,

           &quot;Tty&quot;: false,

           &quot;OpenStdin&quot;: false,

           &quot;StdinOnce&quot;: false,

           &quot;Env&quot;: [

               &quot;PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot;

           ],

           &quot;Cmd&quot;: [

               &quot;/bin/sh&quot;

           ],

           &quot;ArgsEscaped&quot;: true,

           &quot;Image&quot;: &quot;sha256:fbef17698ac8605733924d5662f0cbfc0b27a51e83ab7d7a4b8d8a9a9fe0d1c2&quot;,

           &quot;Volumes&quot;: null,

           &quot;WorkingDir&quot;: &quot;&quot;,

           &quot;Entrypoint&quot;: null,

           &quot;OnBuild&quot;: null,

           &quot;Labels&quot;: null

       },

       &quot;Architecture&quot;: &quot;amd64&quot;,

       &quot;Os&quot;: &quot;linux&quot;,

       &quot;Size&quot;: 4147781,

       &quot;VirtualSize&quot;: 4147781,

       &quot;GraphDriver&quot;: {

           &quot;Data&quot;: {

               &quot;MergedDir&quot;: &quot;/var/lib/docker/overlay2/a89127b97e590db248eb9f17ece06c99551bd15684b48f6447ded2d87966c83f/merged&quot;,

               &quot;UpperDir&quot;: &quot;/var/lib/docker/overlay2/a89127b97e590db248eb9f17ece06c99551bd15684b48f6447ded2d87966c83f/diff&quot;,

               &quot;WorkDir&quot;: &quot;/var/lib/docker/overlay2/a89127b97e590db248eb9f17ece06c99551bd15684b48f6447ded2d87966c83f/work&quot;

           },

           &quot;Name&quot;: &quot;overlay2&quot;

       },

       &quot;RootFS&quot;: {

           &quot;Type&quot;: &quot;layers&quot;,

           &quot;Layers&quot;: [

               &quot;sha256:cd7100a72410606589a54b932cabd804a17f9ae5b42a1882bd56d263e02b6215&quot;

           ]

       },

       &quot;Metadata&quot;: {

           &quot;LastTagTime&quot;: &quot;0001-01-01T00:00:00Z&quot;

       }

   }

]

[root@web01 ~]#



Tag your local &quot;alpine&quot; image with name &quot;myimage&quot; along with version 1.0 :-

[root@web01 ~]# docker tag 3fd9065eaf02 kavitnarwal/java:myname

[root@web01 ~]# docker tag 3fd9065eaf02 kavitnarwal/java:1.0

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

kavitnarwal/java    test1               8a912ef63f8b        5 hours ago         209MB

test1               latest              8a912ef63f8b        5 hours ago         209MB

ubuntu              latest              f975c5035748        3 weeks ago         112MB

kavitnarwal/java    1.0                 3fd9065eaf02        2 months ago        4.15MB

kavitnarwal/java    myname              3fd9065eaf02        2 months ago        4.15MB

alpine              latest              3fd9065eaf02        2 months ago        4.15MB

alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB

hello-world         latest              f2a91732366c        4 months ago        1.85kB

[root@web01 ~]#

[root@web01 ~]#
