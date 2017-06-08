#!/bin/bash
###############################################################################
# Fancy Spinner function borrowed from stackoverflow
# url: https://stackoverflow.com/questions/12498304/using-bash-to-display-a-progress-working-indicator
# Author:    nrevo
# Date:      2017-06-08
# Usage:     any_command & spin $! "Optional Text... -"
# Arguments: pid to watch
#            Optional String to display before spinner with last character being the spinner location.
# Comments:  dollarsign bang returns the Process Id of the previous running command.
#     This function only works on a backgrounded command and has to be called
#     as the next command
#########################################################################
spin() {
  if [ -n "$1" ]; then
    spin='-\|/'
    i=0
    if [ -n "$2" ]; then printf "$2"; fi
    while kill -0 $1 2>/dev/null
    do
      i=$(( (i+1) %4 ))
      printf "\b${spin:$i:1}"
      sleep .1
    done
    printf "\n"
  fi
}

# Process Id of the previous running command
#spin_examples() { #
#  sleep 3 & spin $!
#  sleep 3 & spin $! "Starting command: -"
#  sleep 3 & spin $! "Sleeping: -"
#}
