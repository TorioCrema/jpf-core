# Run via Docker

First change the directory of the assignment repo inside the `docker-compose.yml` file, change `~/git/pcd-assignment01` (line 16) in the volumes section the directory where your repo is located.

You can build and run with one command:
```sh
export UID=$(id -u)
export GID=$(id -g)
docker compose up -d --build
```
This ensures that the user within the container is the same as your host user, so there are no ownership errors on the files created from within the container.

Open a shell inside the container with:
```sh
docker compose exec -it jpf-dev /bin/bash
```
You should already be inside the `jpf-core` directory, build `jpf-core` with:
```sh
./gradlew build
```
Then navigate to the assignment repo and build it:
```sh
cd /home/pcd-assignment01
./gradlew build
```
You can now run `jpf` with the command:
```sh
java -jar /home/jpf-core/build/RunJPF.jar /home/pcd-assignment01/src/<any .jpf file>
```