# Downloading this repository
If you are using Linux or Mac and have git installed, you can pull down the `awsm_test_cases` repository with this command
```
# Pull down the repository
git pull git@github.com:USDA-ARS-NWRC/test_cases.git
```
If you are using Windows or do not have git installed, go to https://github.com/USDA-ARS-NWRC/awsm_test_cases, click on the green "Clone or download" button, download the zip file, and unzip it.

Next, move into the repo.
```
# move into the repository
cd awsm_test_cases/
```

This repo contains a Tuolumne and Boise River Basin test data and configuration files to run each test case.
These

# Get The necessary software

## Docker install and documentation
Our modeling system is isolated in a Docker container in order to run consistently on any operating system.
The source code is contained and installed within a Docker image, isolating it from the host
computer and eliminating almost all system software dependencies.

In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container.
For a more in depth information, read
https://docs.docker.com/engine/docker-overview/

### Install
A good write up on installing Docker on an Ubuntu linux system can be found [here.](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

For Mac, install instructions are located [here.](https://docs.docker.com/docker-for-mac/install/)

Windows install instructions are located [here.](https://docs.docker.com/docker-for-windows/install/)

### Install docker-compose
For ease of use, we use docker-compose to mount the files between the Docker container and the host computer. This comes with the Docker install on Windows and Mac operating systems.

On a linux machine, simply type `sudo apt-get install docker-compose`

### Compute resources
On Mac and Windows, Docker is only allowed limited compute resources from your compute. This will likely need to be increased to run the example case

## Get AWSM Docker image
Once docker is installed, you will need to pull down the image of the awsm modeling system.
```
docker pull usdaarsnwrc/awsm:develop
```

## NetCDF viewers
The ouput files from SMRF and PySnobal are in NetCDF format.
In order to view these files, you will need a NetCDF viewer. Options fro Windows, Linux, and Mac are given below.
## For Unix and Mac users
NCView is a lightweight NetCDF viewer that allows for quick visualization of NetCDF files. It is maintained by UC San Diego.

[Ncview](http://meteora.ucsd.edu/~pierce/ncview_home_page.html)

To install Ncview from the command line on Linux:
```
sudo apt-get install ncview
```
To install on Mac
```
brew install ncview
```


## For Windows users
Panoply is a NetCDF, HDF, and GRIB viewer maintained by NASA, and is a good option for Windows users.

[Panoply](https://www.giss.nasa.gov/tools/panoply/)

# Running AWSM

## Running AWSM tests
To make sure everything is working properly, AWSM constains a series of
functionality tests. These can be run easily with the command
```
docker run usdaarsnwrc/awsm:develop
```

# Running each test case
There are two tests cases in this `awsm_test_cases` repo. They are the Tuolumne
River Basin and the Boise River Basin. In order to run these cases using the
AWSM Docker image, the correct folders must be mounted to the Docker image, and
the AWSM configuration file must be passed to the Docker image.

For these test cases, this is all handled through a docker-compose file (located
in each test case folder), and a Python script that will call the docker-compose
routine behind the scenes.

In order to run the Tuolumne test case, first make sure you are in the
`awsm_test_cases` directory.
Running the 3 days will generate approximately 5.7 Gb of data, so make sure
you have this much room.

## Running the commands
From the command prompt, run
```
./doc_awsm --case tuol
```

## Look at the output
The output for the  will be located in `output/tuolumne/devel/wy2016/test_case/runs/run20160415_20160418/`
and the report will be located at `output/tuolumne/devel/wy2016/test_case/reports/report_20160415_20160418/TuolumneRiverBasin_SnowpackSummary_20160417.pdf`

Simply open the report with a standard pdf reader. To visualize the time series of outputs, use ncview or panoply to open the `snow.nc` or `em.nc` files in the output location.

## Additional cases
To run the BRB test case, similarly run
```
./doc_awsm --case brb
```
from the `awsm_test_cases` directory. This takes up a significant amout of RAM,
so it may drastically slow down your computer.
