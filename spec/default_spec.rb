require "spec_helper"

describe "unattended-upgrades::default" do
  let(:conf_d) do
    "/etc/apt/apt.conf.d"
  end

  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it { expect(chef_run).to include_recipe("apt") }
  it { expect(chef_run).to install_package("unattended-upgrades") }
  it { expect(chef_run).to_not install_package("mailutils") }

  describe "when `send_email` is `true`" do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set["unattended-upgrades"]["send_email"] = true
      end.converge(described_recipe)
    end

    it { expect(chef_run).to install_package("mailutils") }
  end

  it "configures `50unattended-upgrades`" do
    expect(chef_run).to create_template("#{conf_d}/50unattended-upgrades").with(
      source: "50unattended-upgrades.erb",
      owner: "root",
      group: "root",
      mode: "0644"
    )
  end

  it "configures `20auto-upgrades`" do
    expect(chef_run).to create_template("#{conf_d}/20auto-upgrades").with(
      source: "20auto-upgrades.erb",
      owner: "root",
      group: "root",
      mode: "0644"
    )
  end
end
