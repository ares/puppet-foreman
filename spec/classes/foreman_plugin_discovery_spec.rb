require 'spec_helper'

describe 'foreman::plugin::discovery' do
  let :facts do
    {
        :osfamily => 'RedHat',
        :operatingsystem => 'Fedora',
    }
  end

  let :params do
    {
        :version => 'latest',
        :source => 'http://yum.theforeman.org/discovery/releases/latest/',
        :initrd => 'foreman-discovery-image-latest.el6.iso-img',
        :kernel => 'foreman-discovery-image-latest.el6.iso-vmlinuz',
    }
  end

  it 'should call the plugin' do
    should contain_foreman__plugin('discovery')
  end

  it 'should download and install kernel file' do
    should contain_foreman__remote_file("/var/lib/tftpboot/boot/foreman-discovery-image-latest.el6.iso-vmlinuz").
               with_remote_location('http://yum.theforeman.org/discovery/releases/latest/foreman-discovery-image-latest.el6.iso-vmlinuz')
  end

  it 'should download and install initrd file' do
    should contain_foreman__remote_file("/var/lib/tftpboot/boot/foreman-discovery-image-latest.el6.iso-img").
               with_remote_location('http://yum.theforeman.org/discovery/releases/latest/foreman-discovery-image-latest.el6.iso-img')
  end
end
