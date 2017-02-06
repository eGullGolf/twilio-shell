#!/bin/sh
# List all messages (both inbound and outbound)
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
#   [1] Twilio REST API > REST API: Incoming Phone Numbers
#       > List all IncomingPhoneNumber of your Account
#   https://www.twilio.com/docs/api/rest/incoming-phone-numbers#list-get
#
cd "$(dirname "$0")"

../request.sh GET IncomingPhoneNumbers "$@"
