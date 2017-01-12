#!/bin/sh
# List all messages (both inbound and outbound)
#
# Reference:
#   [1] Twilio REST API > REST API: Messages > List all messages
#   https://www.twilio.com/docs/api/rest/message#list-get
#
cd "$(dirname "$0")"

../request.sh GET Messages
