require_relative "test_helper"

describe_recipe "unattended-upgrades::default" do
  it { package("unattended-upgrades").must_be_installed }

  describe "mailutils" do
    it "optionally installed the package" do
      if node["unattended-upgrades"]["send_email"]
        package("mailutils").must_be_installed
      else
        package("mailutils").wont_be_installed
      end
    end
  end

  it { file("/etc/apt/apt.conf.d/50unattended-upgrades").must_exist }
  it { file("/etc/apt/apt.conf.d/20auto-upgrades").must_exist }
end
