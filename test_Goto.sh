#!/bin/sh

# GOTO for bash, based upon https://stackoverflow.com/a/31269848/5353461
goto() {
  label=$1
  cmd=$(sed -En "/^[[:space:]]*#[[:space:]]*$label:[[:space:]]*#/{:a;n;p;ba};" "$0")
  eval "$cmd"
  exit
}

start=${1:-start}
goto "$start"  # GOTO start: by default

#start:#  Comments can occur after labels
echo start
goto end

  # skip: #  Whitespace is allowed
echo this is usually skipped

# end: #
echo end

