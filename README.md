# AWSM Test Cases
This repository contains instructions for installing AWSM and running short test cases using Docker. The instructions involve installing the supporting software and the AWSM system. The test cases include a three day run in the Tuolumne River Basin during WY 2016, including an ASO measured depth update, and a three month run in the Boise River Basin during WY 2016.

The configuration files within the `brb/` and `tuolumne/` directories give a good insight into the inputs required to run AWSM.

## Directory contents
- **brb/:** all files necessary to run the Boise River Basin test case

- **tuolumne/:** all files necessary to run the Tuolumne River Basin test case

- **output/:** contains output from the test cases

- **README.md:** documentation on running the test cases

- **doc_awsm:** python script wrapping the docker compose calls for each test case

## Table of contents
- [Downloading this repository](#downloading-this-repository)
- [Set-up](#set-up)
- [Running the test case](#running-the-test-case)
- [Running the commands](#running-the-commands)
- [Look at the output](#look-at-the-output)
- [Additional cases](#additional-cases)
- [Windows set-up instructions](#windows-set-up-instructions)
- [Linux and Mac set-up instructions](#linux-and-mac-set-up-instructions)

# Downloading this repository
If you have git installed, you can pull down the `awsm_test_cases` repository with this command
```
git clone https://github.com/USDA-ARS-NWRC/awsm_test_cases.git
```
For useres without git installed, go to https://github.com/USDA-ARS-NWRC/awsm_test_cases. Click on the green "Clone or download" button, download the zip file, and unzip it.

# Set-up
Instructions for installing the supporting software
are included in the [Linux and Mac set-up instructions](#linux-and-mac-set-up-instructions) section
and the [Windows set-up instructions](#windows-set-up-instructions) section.

# Running the test case
There are two tests cases in this `awsm_test_cases` repo. They are the Tuolumne
River Basin and the Boise River Basin. In order to run these cases using the
AWSM Docker image, the correct folders must be mounted to the Docker image, and
the AWSM configuration file must be passed to the Docker image.

For these test cases, the folder sharing is handled through a docker-compose file (located
in each test case folder), and a Python script that will call the docker-compose
routine behind the scenes.

Both test cases generate a significant amount of data (5.7 Gb for Tuolumne and more
for BRB), and require a **large amount of RAM.** They should not be run on tablets
and other computers with less than 16 Gb of RAM.

## Move into the repository
Make sure you have a Terminal open. For **Windows** users, use PowerShell,
which should come installed on your computer.

Move into the folder where the unzipped repository is located. Next, move into
the repository. If the repository was downloaded and unzipped, this will
involve `cd awsm_test_cases-master/`. If it was cloned with Git, this will
involve `cd awsm_test_cases/`.

Type `ls` in the command prompt and make sure you see the correct contents of
the repository, as listed in the [Directory contents](#directory-contents) section.

## Running the commands
From the command prompt on **Linux** or **Mac**, run
```
./doc_awsm --case tuol
```
On **Windows**, run the PowerShell command
```
python .\doc_awsm --case tuol
```

## Look at the output
The output for *PySnobal* will be located in `output/tuolumne/devel/wy2016/test_case/runs/run20160415_20160416/`
and the report will be located at `output/tuolumne/devel/wy2016/test_case/reports/report_20160415_20160416/TuolumneRiverBasin_SnowpackSummary_20160416.pdf`.
These paths are relative to the `awsm_test_cases/` directory.

Simply open the report with a standard pdf reader. To visualize the time series
of outputs, use ncview or panoply to open the `snow.nc` or `em.nc` files in the output location.

## Additional cases
An additional, larger sample case for the Boise River Basin has been provided.
This takes up a significant amount of RAM and storage,
so it may drastically slow down your computer.
To run the BRB test case, similarly run
```
./doc_awsm --case brb
```
from the `awsm_test_cases` directory.

# Windows set-up instructions
A minimal amount of supporting software is needed to run AWSM. Mainly, you will need to install Docker and a NetCDF viewer to visualize the data. Successfully installing and running Docker on Windows **requires that you are a system administrator for your workstation.**

## Docker install and documentation
Our modeling system is isolated in a Docker container in order to run consistently on multiple operating systems.
The source code is contained and installed within a Docker image, isolating it from the host
computer and handling almost all system software dependencies.

In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container.
For a more in depth information, read
https://docs.docker.com/engine/docker-overview/.

### Install
**Windows** install instructions are located https://docs.docker.com/docker-for-windows/install/.

### Compute resources
Docker is only allowed limited compute resources from your computer. This may need to be increased to run the example case.

## Get AWSM Docker image
The docker client can be opened from your programs. You will need to login, which means that
you need to create a login on docker hub https://hub.docker.com/.

Once docker is installed and you are logged in on the client, you will need to
pull down the image of the AWSM modeling system. In your open PowerShell, run
```
docker pull usdaarsnwrc/awsm:develop
```

## NetCDF viewers
The output files from SMRF and PySnobal are in NetCDF format.
In order to view these files, you will need a NetCDF viewer.

Panoply is a NetCDF, HDF, and GRIB viewer maintained by NASA, and is a good option for **Windows** users.
Install instruction can be found at https://www.giss.nasa.gov/tools/panoply/.

## Running AWSM tests
To make sure everything is working properly, AWSM contains a series of
functionality tests. These can be run within PowerShell using the command
```
docker run usdaarsnwrc/awsm:develop test
```
# Linux and Mac set-up instructions
A minimal amount of supporting software is needed to run AWSM. Mainly, you will need to install Docker and a NetCDF viewer to visualize the data. Successfully installing and running Docker **requires that you are a system administrator for your workstation or have sudo privileges.**

## Docker install and documentation
Our modeling system is isolated in a Docker container in order to run consistently on multiple operating systems.
The source code is contained and installed within a Docker image, isolating it from the host
computer and handling almost all system software dependencies.

In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container.
For a more in depth information, read
https://docs.docker.com/engine/docker-overview/.

### Install
A good write up on installing Docker on an **Ubuntu** system can be found at https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04.

For **Mac**, install instructions are located https://docs.docker.com/docker-for-mac/install/.

### Install docker-compose
**Not needed for Windows or Mac.** For ease of use, we use docker-compose to handle the mounting of folders between the Docker container and the host computer. Mounting folders between the two systems is required to share the input and output data from the model. Docker-compose comes with the Docker install on **Windows** and **Mac** operating systems.

On a **Linux** machine, type `sudo apt-get install docker-compose` into the bash shell.

### Compute resources
On **Mac** and **Windows**, Docker is only allowed limited compute resources from your computer. This may need to be increased to run the example case.

## Get AWSM Docker image
On **Mac**, you will need to login to Docker hub before pulling down the AWSM Docker image. The docker client can be opened from your programs. You will need to create a login on docker hub https://hub.docker.com/.

Once docker is installed and you are logged in on the client (if using a Mac),
you will need to pull down the image of the AWSM modeling system. In your Terminal, run
```
docker pull usdaarsnwrc/awsm:develop
```

## NetCDF viewers
The output files from SMRF and PySnobal are in NetCDF format.
In order to view these files, you will need a NetCDF viewer.

NCView is a lightweight NetCDF viewer that allows for quick visualization of NetCDF files. It is maintained by UC San Diego.
Further documentation can be found at http://meteora.ucsd.edu/~pierce/ncview_home_page.html.

To install Ncview from the command line on **Linux**:
```
sudo apt-get update
sudo apt-get install ncview
```
To easiest method of install on **Mac** is to use Homebrew. Documentation on Homebrew can be found at https://brew.sh/.
```
brew install ncview
```

## Running AWSM tests
To make sure everything is working properly, AWSM contains a series of
functionality tests. These can be run easily with the command
```
docker run usdaarsnwrc/awsm:develop test
```
