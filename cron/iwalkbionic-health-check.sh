#!/bin/bash

unhealthy=$(docker ps | grep iwalkbionic | grep unhealthy)

if [ "$unhealthy" ]
then
  echo "$(date) iWalk Bionic container not healthy. Restarting ..." >> /var/log/iwalkbionic-monitor.log
  cd /opt/iwalkbionic && make restart
fi
