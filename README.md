# chef-unattended-upgrades  [![Build Status](https://travis-ci.org/phlipper/chef-unattended-upgrades.svg)](https://travis-ci.org/phlipper/chef-unattended-upgrades)

## Description

Chef cookbook for installing and configuring the `unattended-upgrades` package on Ubuntu systems.


## Requirements

### Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu 12.04+

### Cookbooks

* [apt](http://community.opscode.com/cookbooks/apt)
* [minitest-handler](http://community.opscode.com/cookbooks/minitest-handler) _(suggested, not required)_


## Recipes

* `unattended-upgrades` - Install the package and configure the templates

## Usage

This cookbook installs the `unattended-upgrades` components if not present, and pulls updates if they are installed on the system.

To use, simply include `recipe[unattended-upgrades]` in your `run_list`.

In the default configuration, this recipe will perform daily security-only upgrades.

If the `send_email` attribute is `true`, the `mailutils` package will be installed as well.


## Attributes

```ruby
default["unattended-upgrades"]["update_package_lists_interval"] = 1  # number of days between package list updates
default["unattended-upgrades"]["upgrade_interval"] = 1  # number of days between package upgrades
default["unattended-upgrades"]["origins"] = ["${distro_id} ${distro_codename}-security"]  # array containing (origin,archive) pairs. Controls where packages can be installed from
default["unattended-upgrades"]["package_blacklist"] = []  # array containing packages to never update
default["unattended-upgrades"]["send_email"] = false  # whether email should be sent
default["unattended-upgrades"]["email_address"] = "root@localhost"  # Address for email reports
default["unattended-upgrades"]["auto_remove"] = false  # whether unneeded deps should be removed
default["unattended-upgrades"]["auto_reboot"] = false  # whether required reboots should happen automatically
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

**chef-unattended-upgrades**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2014/license.html).
* Copyright (c) 2014 Phil Cohen (github@phlippers.net) [![endorse](http://api.coderwall.com/phlipper/endorsecount.png)](http://coderwall.com/phlipper)  [![Gittip](http://img.shields.io/gittip/phlipper.png)](https://www.gittip.com/phlipper/)
* http://phlippers.net/
