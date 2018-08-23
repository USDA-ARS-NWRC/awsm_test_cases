# Running test cases for AWSM modeling system
Follow the command line instructions for getting the data, setting up the case
and running the example with docker.

Fill in [path to data] in the commands with your absolute paths

## On Linux
### Downloading data
```
git pull git@github.com:USDA-ARS-NWRC/test_cases.git

cd test_cases/

pwd
```

### Getting docker image
```
docker pull usdaarsnwrc/awsm:develop
```

### Creating the maxus file
```
docker run -v <path to data>/test_cases:/data -it usdaarsnwrc/awsm:develop gen_maxus /data/tuolumne/topo/tuolx_dem_50m.ipw --out_maxus /data/tuolumne/topo/maxus.nc
```

### Run the case
```
docker run -v <path to data>/test_cases:/data -it usdaarsnwrc/awsm:develop config_tuol_docker.ini
```
