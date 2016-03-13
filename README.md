# ansible4windows
Ansible 4 Windows is a Docker image to run ansible as a control machine on windows systems.
Thanks to Docker no cygwin installation and configuration patches are needed to run ansible under windows. Of course you can also use it under MacOSX and Linux.

Feel free to fork and contribute.

## Usage

### Docker Toolbox Git4Win/Bash

The following examples are for the Docker Tookbox Git4Windows Bash.


Switch to your ansible playbook folder and run it with:
```
$ docker run --rm -v `pwd`:/home/ansible -it trunneml/ansible4windows ansible-playbook playbook.yml
```

As a shortcut you can add *ansible4win.sh* to your *PATH* and run:
```
$ ansible4win.sh ansible-playbook playbook.yml
```


## Build

Normally Docker will download the latest version from Docker Hub. If you want to build the Docker image yourself, just run:
```
$ docker build -t trunneml/ansible4windows:latest .
```
