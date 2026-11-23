FROM eclipse-temurin:17-jdk-jammy

ARG USERNAME=jpfdev
ARG UID=1000
ARG GID=1000

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Create a group and user matching your host UID/GID
RUN groupadd --gid ${GID} ${USERNAME} \
    && useradd --uid ${UID} --gid ${GID} -m -s /bin/bash ${USERNAME}

# Ensure your user owns the working directory and Gradle cache directory
RUN mkdir -p /home/jpf-core /home/${USERNAME}/.gradle \
    && chown -R ${UID}:${GID} /home/jpf-core /home/${USERNAME}/.gradle

WORKDIR /home/jpf-core

RUN git config --system --add safe.directory /home/jpf-core

# Set the default user so you no longer need 'user:' in docker-compose.yml
USER ${USERNAME}

CMD ["bash"]