# Downloading This Repository
As an exmaple, here are the Unix terminal commands to get and download the data,
move into the directory, and print the path the directory
```
# Pull down the repository
git pull git@github.com:USDA-ARS-NWRC/test_cases.git

# move into the repository
cd awsm_test_cases/

# print the absolute path to this repository
pwd
```

This repo constains a Tuolumne and Boise River Basin test data and configuration files to run each test case.
These

# Get The Necessary Software

## Docker Install and Documentation
Our modeling system is isolated in a Docker container to run consistently on any operating system. In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container
For a more in depth discussion and tutorial, read
https://docs.docker.com/engine/userguide/containers/dockervolumes/.


install docker_compose....

When the image is ran, it will go into the Python terminal within the image.
Within this terminal, SMRF can be imported. The command `/bin/bash` can be
appended to the end of docker run to enter into the docker terminal for full
control. It will start in the `/data` location with SMRF code in `/code/smrf`.

## Get Docker Image
Once docker is installed, you will need to pull down the image of the awsm modeling system.
```
docker pull usdaarsnwrc/awsm:develop
```

## NetCDF Viewers
The ouput files from SMRF and PySnobal are in NetCDF format.
In order to view these files, you will need a NetCDF viewer. Options fro Windows, Linux, and Mac are given below.
## For Windows users
[Panoply](https://www.giss.nasa.gov/tools/panoply/)

## For Unix and Mac users
[Ncview](http://meteora.ucsd.edu/~pierce/ncview_home_page.html)

To install Ncview from the command line on Linux:
```
sudo apt-get install ncview
```
To install on Mac
```
brew install ncview
```
# Running AWSM tests

# Running Each Test Case

# Running test cases for AWSM modeling system
Follow the command line instructions for getting the data, setting up the case
and running the example with docker.

Fill in [path to data] in the commands with your absolute paths to the test_cases
directory.


## Setting up and running the model
### On Linux
Creating the maxus file:
```
docker run -v <path to data>:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```

Run the case:
```
docker run -v <path to data>:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```


### On Windows

```
docker run -v /c/Users/<path to data>:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```
```
docker run -v /c/Users/<path to data>:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```

### On Mac

```
docker run -v /Users/<path to data>:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```
```
docker run -v /Users/<path to data>:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```
# Running test cases for AWSM modeling system
Follow the command line instructions for getting the data, setting up the case
and running the example with docker.

Fill in [path to data] in the commands with your absolute paths to the test_cases
directory.

## Downloading data
As an exmaple, here are the Unix terminal commands to get and download the data,
move into the directory, and print the path the directory
```
git pull git@github.com:USDA-ARS-NWRC/test_cases.git

cd test_cases/

pwd
```

## Getting docker image
This is the command to pull the docker, although the docker will pull with the "docker run"
command if it is not already downloaded.
```
docker pull usdaarsnwrc/awsm:develop
```

## Setting up and running the model
### On Linux
Creating the maxus file:
```
docker run -v <path to data>:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```

Run the case:
```
docker run -v <path to data>:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```


### On Windows

```
docker run -v /c/Users/<path to data>:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```
```
docker run -v /c/Users/<path to data>:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```

### On Mac

```
docker run -v /Users/<path to data>:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```
```
docker run -v /Users/<path to data>:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```
