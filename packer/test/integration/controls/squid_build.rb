control "squid-install" do
  impact 1.0
  title "Squid/dependency install"
  desc "Check squid, openssl and openssl-devel are installed and squid pre-configured"
  describe package('squid') do
    it { should be_installed }
  end
  describe package('openssl') do
    it { should be_installed }
  end
  describe package('openssl-devel ') do
    it { should be_installed }
  end
  describe file('/etc/squid/ssl_certs') do
    it { should exist }
  end
end

control "route-squid" do
  impact 1.0
  title "Route/Squid init script"
  desc "Check script was properly moved into AMI"
  describe file('/var/lib/cloud/scripts/per-instance/0_route_squid.sh') do
   it { should exist }
   its('owner') { should eq 'root' }
  end
end
