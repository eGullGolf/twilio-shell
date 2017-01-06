# Default Parameters
# Actual values must be provided in custom configuration

# API Base URL
twilioApiBaseUrl='https://api.twilio.com/2010-04-01'

# API Response Format (one of json, csv, xml, html)
twilioApiResponseFormat='json'

# Account SID (or Test Account SID)
twilioAccountSid='' # empty by default to raise an error if not configured

# Auth Token (or Test Auth Token)
twilioAuthToken='' # empty by default to raise an error if not configured

# Custom Configuration
# Note: when sourcing this file, current directory must be set to the root
# folder of the project (parent of config.sh) for resolution of relative paths.
test -f /etc/twilio-shell/config.sh && . /etc/twilio-shell/config.sh
test -f ./config.my.sh && . ./config.my.sh
