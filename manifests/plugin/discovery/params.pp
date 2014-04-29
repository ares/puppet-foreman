class foreman::plugin::discovery::params {
  $version = "latest"
  $source  = "http://yum.theforeman.org/discovery/releases/latest/"
  $initrd  = "foreman-discovery-image-${version}.el6.iso-img"
  $kernel  = "foreman-discovery-image-${version}.el6.iso-vmlinuz"
}