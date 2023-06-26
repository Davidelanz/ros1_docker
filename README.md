# Dockerized setup for ROS 1

This dockerized environment provides:
- [ROS 1](https://www.ros.org/) with [Catkin](https://wiki.ros.org/catkin/)-ready workspace
- GUI available via [noVNC](https://novnc.com/)

<img width=600 align=center alt="noVNC preview" src=".readme_assets/preview_noVNC.jpg">

---

## Run the docker compose setup

Run setup with:
```
docker compose up
```

The noVNC GUI is available at `http://localhost:8080/vnc.html`.

To wipe the docker environment:
```
docker compose down -v
```

> To to freshly build the docker image change from:
> ```yml
> image: ghcr.io/davidelanz/ros1_${ROS_DISTRO}_docker
> ```
> to:
> ```yml
> build:
>     dockerfile: ./Dockerfile
> ```
> and use:
> ```sh
> docker compose up --build
> ```


## Use the catkin workspace

The catkin workspace `catkin_ws` is in the `catkin_ws` docker compose container at `/root/catkin_ws/`.

<p align=center>
    <img width=600 alt="noVNC preview" src=".readme_assets/catkin_workspace.jpg"><br>
    <em>Catkin workspace file structure (courtesy: <a href="https://developpaper.com/" target="_blank">Develop Paper</a>)</em>
</p>


To work with the container, connect to it with `docker exec -it <container_name> bash` and then use catkin as usual:
```sh
# Build workspace
catkin build
```

> To spawn multiple processes, execute multiple commands via docker.

To manage packages in the catkin workspace, check out [catkin/Tutorials/CreatingPackage](http://wiki.ros.org/catkin/Tutorials/CreatingPackage) and [catkin/Tutorials/using_a_workspace](http://wiki.ros.org/catkin/Tutorials/using_a_workspace)

