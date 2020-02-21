# cookiecutter-docker-jupyter

## Build
To use, ensure you have `cookiecutter` installed and then run:

```bash
cookiecutter https://github.com/devclinton/cookiecutter-docker-jupyter
```

This will prompt initialization choices and then create a directory REPO_NAME (you choose during cookiecutter) that contains the Dockerfile, start.sh and stop.sh.  

List your requirements to requirements.txt:
 
 ```editorconfig
dtk-tools
geopandas~=0.7.0
descartes
shapely
gdal==2.2.3
```
 
 and the build:

```bash
docker-compose build
```

To start the Docker container run:

```bash
./start.sh
```
Then access the e.g. JupyterLab by opening `http://HOSTNAME:PORT` (ex. http://12.345.67.890:8888) on your browser.  The port number is listed in docker-compose.yml.



## Prerequisites

Install cookiecutter (with virtualenv)
```bash
python3 -m venv ~/.venvs/cookiecutter
source ~/.venvs/cookiecutter/bin/activate
pip install cookiecutter
```

## Troubleshooting

### PIP Prod Server
To use the IDM pip prod server (required for `dtk-tools`) change the pip call in the Dockerfile to:

```bash
pip install -r requirements.txt --index-url https://packages.idmod.org/api/pypi/pypi-production/simple --extra-index-url https://pypi.python.org/simple/
```

Note that you can also set the index-url during setup and the above line includes the default pip server for packages not on the IDM server.

### Mounting directories
If you want to be able to access directories add them to the docker-compose.yml file:

```editorconfig
    volumes:
      - /home/krosenfeld/Projects/BestProject/:/home/jovyan/work
      - /home/krosenfeld/.ssh:/home/jovyan/.ssh
```

### GDAL

Add `gdal` to your prerequisites.txt file and then add the lines below to your DockerFile before the call to `pip`:

```editorconfig
USER root
RUN apt-get -y update
RUN apt-get install -y vim \
    gdal-bin \
    libgdal-dev
USER jovyan

ENV CPLUS_INCLUDE_PATH=/usr/include/gdal \
    C_INCLUDE_PATH=/usr/include/gdal
```

