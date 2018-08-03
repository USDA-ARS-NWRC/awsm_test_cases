#!/bin/bash

# Run the AWSM publication example for the Boise River Basin.
# The time frame is a storm in WY 2017 that produced a large
# inflow to the Boise reservoir system of 24,000 cfs, the second
# largest inflow ever recorded.
#
# Created by Scott Havens <scott.havens@ars.usda.gov>

# The CURRENT_UID environment variable enable the container to be ran like a local user. This
# means that any data written to the data volume will be owned by the current user
export CURRENT_UID=$(id -u):$(id -g)

# In order to run AWSM, we must first generate the maxus.nc for the
# wind distribution

if [ ! -f "data/maxus.nc" ]; then

  # generate the maxus file and window
  docker-compose run awsm gen_maxus --window=30 --out_maxus=/data/input/maxus.nc /data/input/topo.nc

  # remove the maxus.nc file and rename the windowed file to maxus.nc
  rm data/maxus.nc
  mv data/maxus_30window.nc data/maxus.nc
	
fi

# run the spin-up if needed
if [ "$1" = "spinup" ]; then

  echo "Running the spinup"
  docker-compose run awsm /data/input/awsm_config_spinup.ini

fi


