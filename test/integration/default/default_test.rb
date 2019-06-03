# InSpec test for recipe UberAppProject::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package ('python3') do
  it { should be_installed }
end

describe package ('python-pip') do
  it { should be_installed }
end

describe pip('Flask') do
  it { should be_installed }
  its('version') { should eq '0.10.1' }
end
describe pip('Jinja2') do
  it { should be_installed }
  its('version') { should eq '2.7.3' }
end
describe pip('MarkupSafe') do
  it { should be_installed }
  its('version') { should eq '0.23' }
end
describe pip('Werkzeug') do
  it { should be_installed }
  its('version') { should eq '0.9.6' }
end
describe pip('gnureadline') do
  it { should be_installed }
  its('version') { should eq '6.3.8' }
end
describe pip('itsdangerous') do
  it { should be_installed }
  its('version') { should eq '0.24' }
end
describe pip('rauth') do
  it { should be_installed }
  its('version') { should eq '0.7.0' }
end
describe pip('requests') do
  it { should be_installed }
  its('version') { should eq '2.3.0' }
end
describe pip('wsgiref') do
  it { should be_installed }
  its('version') { should eq '0.1.2' }
end
describe pip('gunicorn') do
  it { should be_installed }
  its('version') { should eq '18.0' }
end
describe pip('Flask-SSLify') do
  it { should be_installed }
  its('version') { should eq '0.1.4' }
end
describe package ('nginx') do
  it { should be_installed }
end
describe service "nginx" do
  it { should be_running }
  it { should be_enabled }
end
describe port(80) do
  it { should be_listening }
end
describe http('http://localhost', enable_remote_worker: true) do
  its('status') { should cmp 502 }
end
