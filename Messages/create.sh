#!/bin/sh
# Send a SMS
#
# Parameters:
#   To - string, destination phone number, starting with '+' and country code
#   From - optional, string, the Twilio phone number of origin
#   Body - optional, string, the text of the message
#   MediaUrl - optional, string, URL of a picture to send with the message
#   ... - see [1] for the list of other optional parameters
#
# Note:
#   At least one of Body or MediaUrl must be provided.
#   From can only be omitted when MessagingServiceSid is provided.
#
# References:
#   [1] Twilio REST API > REST API: Sending SMS or MMS
#   https://www.twilio.com/docs/api/rest/sending-messages
#
#   [2] Twilio REST API > REST API: Messages
#   https://www.twilio.com/docs/api/rest/message
#
cd "$(dirname "$0")"

../request.sh POST Messages $*
