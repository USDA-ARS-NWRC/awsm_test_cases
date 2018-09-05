**Linux** Downloading this repository
If you are using **Linux** or **Mac** and have git installed, you can pull down the `awsm_test_cases` repository with this command
```
# Pull down the repository
git pull git@github.com:USDA-ARS-NWRC/test_cases.git
```
For **Windows** users, or those without git installed, go to https://github.com/USDA-ARS-NWRC/awsm_test_cases. Click on the green "Clone or download" button, download the zip file, and unzip it.

Make sure you have a Terminal open. For **Windows** users, use PowerShell, which should come installed on your computer.

If you do not have a command prompt open, open one and move into the folder where the unzipped repository is located. Next, move into the repository. If the repository was downloaded and unzipped, it will be `awsm_test_cases-master/`.
```
# move into the repository
cd awsm_test_cases/
```

This repo contains Tuolumne and Boise River Basin test data and configuration files to run each test case.

# Get the necessary software

## Docker install and documentation
Our modeling system is isolated in a Docker container in order to run consistently on multiple operating systems.
The source code is contained and installed within a Docker image, isolating it from the host
computer and handling almost all system software dependencies.

In order to run AWSM, you will need to install Docker and understand the basics of running a Docker container.
For a more in depth information, read
https://docs.docker.com/engine/docker-overview/

### Install
A good write up on installing Docker on an Ubuntu system can be found at https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

For **Mac**, install instructions are located https://docs.docker.com/docker-for-mac/install/

### Windows install
**Windows** install instructions are located https://docs.docker.com/docker-for-windows/install/

If you do not have admin privealages on your coputer, your IT person will need to assist you with:
- Installing Docker
- Adding you to the docker users group
- Enabling Hyper-V if it is not enabled

### Install docker-compose
*Not needed for Windows or Mac.* For ease of use, we use docker-compose to handle the mounting of folders between the Docker container and the host computer. Mounting folders between the two systems is required to share the input and output data from the model. Docker-compose comes with the Docker install on **Windows** and **Mac** operating systems.

On a **Linux** machine, simply type `sudo apt-get install docker-compose` into the bash shell.

### Compute resources
On **Mac** and **Windows**, Docker is only allowed limited compute resources from your compute. This may need to be increased to run the example case.

## Get AWSM Docker image
The docker client can be opened from your programs. One **Windows** and **Mac**, you will need to login, which means that
you need to create a login on docker hub https://hub.docker.com/.

Once docker is installed and you are logged in on the client, you will need to
pull down the image of the awsm modeling system. In your Terminal or PowerShell, run
```
docker pull usdaarsnwrc/awsm:develop
```

## NetCDF viewers
The output files from SMRF and PySnobal are in NetCDF format.
In order to view these files, you will need a NetCDF viewer. Options fro **Linux**, **Mac**, and **Windows** are given below.
## For Unix and Mac users
NCView is a lightweight NetCDF viewer that allows for quick visualization of NetCDF files. It is maintained by UC San Diego.
Further documentation can be found at http://meteora.ucsd.edu/~pierce/ncview_home_page.html

To install Ncview from the command line on **Linux**:
```
sudo apt-get install ncview
```
To install on **Mac** using Homebrew. Documentation on Homebrew can be found at https://brew.sh/
```
brew install ncview
```

## For Windows users
Panoply is a NetCDF, HDF, and GRIB viewer maintained by NASA, and is a good option for **Windows** users.
Install instruction can be found at https://www.giss.nasa.gov/tools/panoply/

# Running AWSM

## Running AWSM tests
To make sure everything is working properly, AWSM contains a series of
functionality tests. These can be run easily with the command
```
docker run usdaarsnwrc/awsm:develop
```

# Running each test case
There are two tests cases in this `awsm_test_cases` repo. They are the Tuolumne
River Basin and the Boise River Basin. In order to run these cases using the
AWSM Docker image, the correct folders must be mounted to the Docker image, and
the AWSM configuration file must be passed to the Docker image.

For these test cases, the folder sharing is handled through a docker-compose file (located
in each test case folder), and a Python script that will call the docker-compose
routine behind the scenes.

In order to run the Tuolumne test case, first make sure you are in the
`awsm_test_cases` directory.
Running the 3 days will generate approximately 5.7 Gb of data, so make sure
you have this much room on your hard drive.

## Running the commands
From the command prompt on **Linux** or **Mac**, run
```
./doc_awsm --case tuol
```
On **Windows**, run the PowerShell command
```
python doc_awsm --case tuol
```

## Look at the output
The output for the  will be located in `output/tuolumne/devel/wy2016/test_case/runs/run20160415_20160418/`
and the report will be located at `output/tuolumne/devel/wy2016/test_case/reports/report_20160415_20160418/TuolumneRiverBasin_SnowpackSummary_20160417.pdf`

Simply open the report with a standard pdf reader. To visualize the time series of outputs, use ncview or panoply to open the `snow.nc` or `em.nc` files in the output location.

## Additional cases
An additional, larger sample case for the Boise River Basin has been provided.
This takes up a significant amount of RAM and storage,
so it may drastically slow down your computer.
To run the BRB test case, similarly run
```
./doc_awsm --case brb
```
from the `awsm_test_cases` directory.

# Directory contents
- **brb/:** all files necessary to run the Boise River Basin test case

- **tuolumne/:** all files necessary to run the Tuolumne River Basin test case

- **output/:** contains output from the test cases

- **README.md:** documentation on running the test cases

- **doc_awsm:** python script wrapping the docker compose calls for each test case
