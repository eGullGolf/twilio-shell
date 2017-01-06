#!/bin/sh
# Send a generic request to Twilio API using cUrl
#
# Parameters:
#   $1 - string, name of the HTTP method: 'GET', 'POST', 'DELETE',...
#   $2 - string, name of the API end-point
#   ... - API parameters in the form name='value',
#         where the value is URL-encoded and quoted if needed for safety
#
# Reference:
#   [1] Twilio REST API
#   https://www.twilio.com/docs/api/rest
#
cd "$(dirname "$0")"

. ./lib/die.sh

httpMethod="$1"
twilioApiName="$2"
test -n "$httpMethod" -a -n "$twilioApiName" \
  || die "Usage: $0 httpMethod twilioApiName [param='value']..."

. ./config.sh

test -n "$twilioApiBaseUrl" \
  || die 'twilioApiBaseUrl is missing from config'
test -n "$twilioApiResponseFormat" \
  || die 'twilioApiResponseFormat is missing from config'

test -n "$twilioAccountSid" -a -n "$twilioAuthToken" \
  || die \
  'twilioAccountSid and twilioAuthToken must be set in your configuration file'

twilioRequestUrl="$twilioApiBaseUrl/Accounts/$twilioAccountSid/$twilioApiName"

if test "$twilioApiResponseFormat" != 'xml'
then
  twilioRequestUrl="$twilioRequestUrl.$twilioApiResponseFormat"
fi

{
  echo "$twilioRequestUrl"
  echo "-u '$twilioAccountSid:$twilioAuthToken'"

  shift 2
  for twilioParameterAndValue in $*
  do
    echo "--data-urlencode $twilioParameterAndValue"
  done
} | xargs curl --silent --show-error --request "$httpMethod"
