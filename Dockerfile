ARG ROS_DISTRO=noetic
FROM osrf/ros:${ROS_DISTRO}-desktop-full

LABEL org.opencontainers.image.description="Docker enabled ROS ${ROS_DISTRO} workspace"
LABEL org.opencontainers.image.authors="info@davidelanza.it"
LABEL org.opencontainers.image.url="https://github.com/Davidelanz/ros1_docker/"
LABEL org.opencontainers.image.documentation="https://github.com/Davidelanz/ros1_docker/"
LABEL org.opencontainers.image.source="https://github.com/Davidelanz/ros1_docker/"
LABEL org.opencontainers.image.licenses="gpl-3.0"

WORKDIR /root/catkin_ws
ENV DEBIAN_FRONTEND noninteractive

# Use bash in Dockerfile (https://stackoverflow.com/a/39777387)
SHELL ["/bin/bash", "-c"]

# Install catkin tools
RUN apt-get update -y \
    && apt-get install -y python3-osrf-pycommon python3-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

# Create the catkin workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
    && mkdir -p /root/catkin_ws/src/ \
    && cd /root/catkin_ws \
    && catkin build -DPYTHON_VERSION=3

# Append the following commands to ~/.bashrc
RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> /root/.bashrc \
    && echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc

# Set the entrypoint back to bash
ENTRYPOINT ["/bin/bash"]
