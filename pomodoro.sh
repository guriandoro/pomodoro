#!/bin/bash

if [[ $1 =~ --help ]]; then
  echo "Usage: pomodoro.sh task_time short_break_time long_break_time"
  exit
fi

TASK_TIME=${1:-25}
SHORT_BREAK_TIME=${2:-5}
LONG_BREAK_TIME=${3:-15}

ITERATIONS=${4:-4}

ITER=1

while true; do
  read -p "Press enter for acknowledgement."
  say "Task time. $TASK_TIME minutes."
  echo "Task start: `date`"
  sleep `echo 60 \* $TASK_TIME | bc`

  if [ $ITER -lt $ITERATIONS ]; then
    say "Short break time. $SHORT_BREAK_TIME minutes."
    read -p "Press enter for acknowledgement."
    echo "Short break start: `date`"
    sleep `echo 60 \* $SHORT_BREAK_TIME | bc`
    say "Short break is over."
    ITER=$(($ITER + 1))
  else
    say "Long break time. $SHORT_BREAK_TIME minutes."
    read -p "Press enter for acknowledgement."
    echo "Long break start: `date`"
    sleep `echo 60 \* $LONG_BREAK_TIME | bc`
    say "Long break is over."
    ITER=1
    echo
  fi

  echo
done;

