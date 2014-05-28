require "spec_helper"

describe "`unattended-upgrades` setup" do
  describe package("unattended-upgrades") do
    it { should be_installed }
  end

  describe package("mailutils") do
    it { should be_installed }
  end

  describe file("/etc/apt/apt.conf.d/50unattended-upgrades") do
    it { should be_a_file }
    it { should be_mode 644 }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should contain %(Mail "root@localhost";) }
    it { should contain %(Remove-Unused-Dependencies "false";) }
    it { should contain %(Automatic-Reboot "false";) }
  end

  describe file("/etc/apt/apt.conf.d/20auto-upgrades") do
    it { should be_a_file }
    it { should be_mode 644 }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should contain %(APT::Periodic::Update-Package-Lists "1";) }
    it { should contain %(APT::Periodic::Unattended-Upgrade "1";) }
  end
end
