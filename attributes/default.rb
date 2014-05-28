default["unattended-upgrades"]["update_package_lists_interval"] = 1  # number of days between package list updates
default["unattended-upgrades"]["upgrade_interval"] = 1  # number of days between package upgrades
default["unattended-upgrades"]["origins"] = ["${distro_id} ${distro_codename}-security"]  # array containing (origin,archive) pairs. Controls where packages can be installed from
default["unattended-upgrades"]["package_blacklist"] = []  # array containing packages to never update
default["unattended-upgrades"]["send_email"] = false  # whether email should be sent
default["unattended-upgrades"]["email_address"] = "root@localhost"  # Address for email reports
default["unattended-upgrades"]["auto_remove"] = false  # whether unneeded deps should be removed
default["unattended-upgrades"]["auto_reboot"] = false  # whether required reboots should happen automatically
