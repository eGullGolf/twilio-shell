#!/bin/sh
# Buy a 'From' phone number
#
# Parameters:
#   PhoneNumber - optional, string, the exact phone number to purchase
#                 (starting with + followed with country code)
#   AreaCode - optional, string, the three digits area code for USA or Canada
#              (only available for USA or Canada numbers)
#   ... - see [1] for the list of other optional parameters supported
#
# Notes:
#   One of PhoneNumber or AreaCode must be provided; if both are provided,
#   the PhoneNumber is ignored.
#
# Reference:
#   [1] Twilio REST API > REST API: Incoming Phone Numbers > HTTP POST
#   https://www.twilio.com/docs/api/rest/incoming-phone-numbers#list-post
#
cd "$(dirname "$0")"

../request.sh POST IncomingPhoneNumbers "$@"
