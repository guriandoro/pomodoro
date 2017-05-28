#!/bin/bash

ITERATIONS=$1

TASK_TIME=$2
BREAK_TIME=$3

echo "Task start: `date`"

for i in `seq $ITERATIONS`; do
  sleep $((60*$TASK_TIME));
  say "Pomodoro. Break time";
  echo "Press enter for confirmation."
  read;
  echo "Task end / break start: `date`"
  sleep $((60*$BREAK_TIME));
  say "Pomodoro. Break is over";
  echo "Press enter for confirmation."
  read;
  echo "Break end / task start: `date`"
done;

