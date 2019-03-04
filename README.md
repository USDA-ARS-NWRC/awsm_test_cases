# AWSM Test Cases
This repository contains instructions for installing the Docker container of AWSM and running short test cases. The instructions involve installing the supporting software and the AWSM system. The test cases include three model tests:
1. Tuolumne River Basin three day run during WY 2016, which includes an lidar snow depth update from the Airborne Snow Observatory
2. Boise River Basin three month run during WY 2017 during a historic snowmelt event
3. Reynolds Creek Experimental Watershed for the entire WY 2006 with wind redistribution of precipitation

## Table of contents
- [AWSM Test Cases](#awsm-test-cases)
  - [Table of contents](#table-of-contents)
  - [Repository contents](#repository-contents)
- [Downloading this repository](#downloading-this-repository)
- [Docker setup](#docker-setup)
  - [Compute resources](#compute-resources)
  - [Installing Docker](#installing-docker)
  - [Installing `docker-compose`](#installing-docker-compose)
- [NetCDF viewers](#netcdf-viewers)
  - [Windows](#windows)
  - [Mac](#mac)
  - [Linux](#linux)
- [Running the test cases](#running-the-test-cases)
<<<<<<< HEAD
  - [Reynolds Creek Experimental Watershed (RCEW)](#reynolds-creek-experimental-watershed-rcew)
  - [Tuolumne River Basin](#tuolumne-river-basin)
  - [Boise River Basin (BRB)](#boise-river-basin-brb)
=======
  - [Reynolds Creek Experimental Watershed, Idaho (RCEW)](#reynolds-creek-experimental-watershed-idaho-rcew)
  - [Boise River Basin, Idaho (BRB)](#boise-river-basin-idaho-brb)
>>>>>>> brb

## Repository contents
- **brb/:** all files necessary to run the Boise River Basin test case
- **tuolumne/:** all files necessary to run the Tuolumne River Basin test case
- **rcew/:** all files necessary to run the Reynolds Creek Experimental Watershed test case
- **output/:** contains output from the test cases
- **README.md:** documentation on running the test cases
- **awsm_docker:** python script wrapping the docker compose calls for each test case

# Downloading this repository
If you have git installed, you can clone the `awsm_test_cases` repository with this command
```
git clone https://github.com/USDA-ARS-NWRC/awsm_test_cases.git
```
For users without git installed, go to https://github.com/USDA-ARS-NWRC/awsm_test_cases. Click on the green "Clone or download" button, download the zip file, and unzip it.

Make sure you have a Terminal open. For **Windows** users, use PowerShell, which should come installed on your computer. Move into the folder where the unzipped repository is located. Next, move into the repository. If the repository was downloaded and unzipped, this will involve `cd awsm_test_cases-master/`. If it was cloned with Git, this will involve `cd awsm_test_cases/`.

Type `ls` in the command prompt and make sure you see the correct contents of
the repository, as listed in the [Directory contents](#directory-contents) section.

# Docker setup
Our modeling system is isolated in a Docker container in order to run consistently on multiple operating systems. The source code is contained and installed within a Docker image, isolating it from the host computer and handling almost all system software dependencies. To use Docker, 

In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container. For a more in depth information, read https://docs.docker.com/engine/docker-overview/. 

>**NOTE: Docker requires that you are a system administrator for your workstation or have sudo privileges.**

<!-- Instructions for installing the supporting software are included in the [Linux and Mac set-up instructions](#linux-and-mac-set-up-instructions) section and the [Windows set-up instructions](#windows-set-up-instructions) section. -->

## Compute resources
Docker is only allowed limited compute resources from your computer. On Windows and Mac, you will need to provide more resources to Docker for AWSM to function properly. We recommend at a minimum:
* 2 cores
* 16GB of RAM
* 20GB of hard drive space if running all test cases

## Installing Docker

* [Window installation instructions](https://docs.docker.com/docker-for-windows/install/)
* [Mac installation instructions](https://docs.docker.com/docker-for-mac/install/)
* [Ubuntu installation instruction](https://docs.docker.com/install/linux/docker-ce/ubuntu/) and many other Linux distributions are supported

## Installing `docker-compose`

For ease of use, we use `docker-compose` to handle the mounting of folders between the Docker container and the host computer. Mounting folders between the two systems is required to share the input and output data from the model. Read the [documentation](https://docs.docker.com/compose/install/) for further installation instructions.

* Windows already includes `docker-compose`
* Mac already includes `docker-compose`
* Linux [latest install instructions](https://docs.docker.com/compose/install/)

# NetCDF viewers

The output files from [SMRF](https://github.com/USDA-ARS-NWRC/smrf) and [PySnobal](https://github.com/USDA-ARS-NWRC/pysnobal) are in NetCDF format. In order to view these files, you will need a NetCDF viewer. 

## Windows
Panoply is a NetCDF, HDF, and GRIB viewer maintained by NASA, and is a good option for **Windows** users. Install instruction can be found at https://www.giss.nasa.gov/tools/panoply/.

## Mac
NCView is a lightweight NetCDF viewer that allows for quick visualization of NetCDF files. It is maintained by UC San Diego. Further documentation can be found at http://meteora.ucsd.edu/~pierce/ncview_home_page.html.

The easiest method of install on a Mac is to use Homebrew.
```
brew install ncview
```

## Linux
To install Ncview from the command line on Ubuntu:
```
sudo apt-get install ncview
```

# Running the test cases

<<<<<<< HEAD
There are three tests cases in this `awsm_test_cases` repo. They are the Tuolumne River Basin, Boise River Basin and Reynolds Creek Experimenatal Watershed. In order to run these cases using the AWSM Docker image, the correct folders must be mounted to the Docker image and the AWSM configuration file must be passed to the Docker image.
=======
There are three tests cases in this `awsm_test_cases` repo. They are the Tuolumne
River Basin, Boise River Basin and Reynolds Creek Experimenatal Watershed. In order to run these cases using the AWSM Docker image, the correct folders must be mounted to the Docker image, and the AWSM configuration file must be passed to the Docker image.
>>>>>>> brb

For these test cases, the folder sharing is handled through a docker-compose file (located in each test case folder), and a Python script that will call the docker-compose routine behind the scenes.

The `output` folder structure for AWSM was developed to organize multiple runs over various water years and basins. The base output structure for these test cases are
```
output/<basin>/devel/<year>/<run_name>/<data | logs | runs><run_date>
```

The model results will be available in the `run` directory, simply open the netCDF files with a viewer to quickly visualize the results. `snow.nc` will have the snowpack state variables like `specific_mass` or `snow_depth` and the `em.nc` will have all the snowpack energetics like `swi` or `net_rad`.

## Reynolds Creek Experimental Watershed, Idaho (RCEW)

The RCEW test case is for the complete water year 2006. Specifics for this model run:
* 50 meter resolution, hourly
* 227 km<sup>2</sup> research watershed
* 28 meterological stations
* Wind redistribution of precipitation


From the command prompt on **Linux** or **Mac**, run
```
./awsm_docker --case rcew
```
On **Windows**, run the PowerShell command
```
python .\awsm_docker --case rcew
```

<<<<<<< HEAD
> **NOTE:** Will takes approximately 2-2.5 hours to run simulation and take XXGB of space

## Tuolumne River Basin

## Boise River Basin (BRB)
=======
> **NOTE:** will take approximately 2 to 2.5 hours to complete.

## Boise River Basin, Idaho (BRB)

The BRB test case is for a signficant rain on snow event in water year 2017 where the second highest inflows to the Lucky Peak Reservoir was recorded.
* 100 meter resolution, hourly
* 7,000 km<sup>2</sup> watershed
* 58 meterological stations
* Model spin up performed to produce a model state file for restart model
* 3 month model run


From the command prompt on **Linux** or **Mac**, run
```
./awsm_docker --case brb
```
On **Windows**, run the PowerShell command
```
python .\awsm_docker --case brb
```

> **NOTE:** will take approximately 2 to 2.5 hours to complete.
>>>>>>> brb
