#!/bin/sh
# Get details of an SMS record
#
# Parameter:
#   $1 - MessageSid, the identifier of the SMS record to get
#
# Reference:
#   [1] Twilio REST API > REST API: Messages
#   https://www.twilio.com/docs/api/rest/message
#
cd "$(dirname "$0")"

if test -z "$1"
then
  echo "Usage: $0 MessageSid" 1>&2
  exit
fi

../request.sh GET Messages/"$1"
