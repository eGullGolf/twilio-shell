#!/bin/sh
# Delete an SMS record
#
# Parameter:
#   $1 - MessageSid, the identifier of the SMS record to delete
#
# Note:
#   It is an error to delete a SMS record while delivery is in progress.
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

../request.sh DELETE Messages/"$1"
