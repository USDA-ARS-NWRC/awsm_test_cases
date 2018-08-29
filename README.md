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
Our modeling system is isolated in a Docker container to run consistently on any operating system.
The source code is conatined and installed within a Docker image, isolating it from the host
computer and eliminating almost all system software dependencies.

In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container.
For a more in depth discussion and tutorial, read
https://docs.docker.com/engine/userguide/containers/dockervolumes/.


install docker_compose....

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

# Running AWSM

## Running AWSM tests
To make sure everything is working properly, AWSM constains a series of
functionality tests. These can be run easily with the command
```
docker run usdaarsnwrc/awsm:develop
```

# Running Each Test Case
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

Then run the command
```
./doc_awsm --case tuol
```
The output will be located in ``
