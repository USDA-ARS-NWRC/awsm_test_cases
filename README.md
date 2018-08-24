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
