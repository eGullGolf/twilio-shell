# twilio-shell
Shell Client for Twilio API

# Configuration

The configuration is read from the following locations,
in given order:

* `config.sh` - default parameters
  (part of this git project)
* `/etc/twilio-shell/config.sh` - custom parameters
  (shared location outside project)
* `config.my.sh` - custom parameters
  (local file, ignored by git)

Properties defined in configuration files loaded after supersede
properties defined in configuration files loaded before. You could
for example define your live credentials in `/etc/twilio-shell/config.sh`,
for use in production, and your test credendials in `custom.my.sh`,
for use during development.

Note that test credentials are [limited to a subset of API endpoints](https://www.twilio.com/docs/api/rest/test-credentials#supported-resources)
and do not have access to your account's 'From' phone number, they must
use ['magic' phone numbers](https://www.twilio.com/docs/api/rest/test-credentials#test-sms-messages-parameters-From)
instead.

The default `config.sh` uses empty values for the credentials,
which prevents requests. You must define `twilioAccountSID` and
`twilioAuthToken` in `/etc/twilio-shell/config.sh` or `config.my.sh`
to allow actual requests. These values can be found in your Twilio
[Account Settings](https://www.twilio.com/console/account/settings).

# Requirements

This software uses [cUrl](https://curl.haxx.se/) utility to issue requests.
It is commonly found already installed on Unix systems.

# Usage

After having completed the configuration and checked the requirements,
you can send any request using the generic script `request.sh` at the root
of the project.

The script takes as input two parameters or more:

  * the HTTP method (`GET`, `POST`, `DELETE`, ...)
  * the name of the API endpoint (`Messages`, `IncomingPhoneNumbers`, ...)
  * optionally, a list of parameters for the API endpoint,
    of the form name='value' (where the value is not URL-encoded yet)

Alternatively, specific scripts are available for select endpoints,
where the folder name matches the name of the endpoint, and the
script name reflects the nature of the operation:

* `create.sh`
* `get.sh`
* `update.sh`
* `delete.sh`
* `list.sh`
* ...

For example:

  * `IncomingPhoneNumbers/create.sh` - buy a 'From' phone number
  * `Messages/create.sh` - send a SMS

To send a text SMS, a generic request can be sent with `request.sh`:

```
$ ./request.sh POST Messages \
  From=+15005550006 \
  To=[number] \
  Body=[text]
```

or a specific request can be used, found in the `Messages` folder:

```
$ ./Messages/create.sh \
  From=+15005550006 \
  To=[number] \
  Body=[text]
```

Arguments for the API endpoint are provided in the same format in both cases.

## License

Copyright 2017 eGull SAS  
Licensed under the
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
