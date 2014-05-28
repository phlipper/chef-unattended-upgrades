name             "unattended-upgrades"
maintainer       "Phil Cohen"
maintainer_email "github@phlippers.net"
license          "MIT"
description      "Installs/Configures `unattended-upgrades`"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.1.0"

recipe "unattended-upgrades", "Install the package and configure the templates"

supports "ubuntu"

depends "apt"
suggests "minitest-handler"
