# == Class: kubernetes::repo
#
# Module to install an up-to-date version of kubernetes::node from package.
#
# === Parameters
#
# [*manage_repo*]
#   Setup repository for kubernetes package
#   Default to false
#
# [*kubernetes_role*]
#   Set role of kubernetes server
#   Defaults to node
#
class kubernetes::repo (
  $manage_repo      = 'false',
  $kubernetes_role  = 'node',
) inherits kubernetes {

  Exec {
    path      => [ '/bin', '/usr/bin', '/usr/local/bin' ],
    cwd       => '/',
  }

  if $manage_repo {
    case $::osfamily {
      'Debian': {
        include ::apt
        Class['apt::update'] -> Package[$package_name]

        apt::source { 'kubernetes':
          location    => "https://repos.kismatic.com/debian",
          release     => "$::lsbdistcodename",
          repos       => 'main',
          key         => '834BE34E616EE0EE20A5003A5C919141D83BE32B',
#          key_source  => $::elasticsearch::repo_key_source,
          include_src => false,
        }
      }
      'RedHat', 'Linux': {
        yumrepo { 'kubernetes':
          descr    => 'kubernetes repo',
          baseurl  => "https://repos.kismatic.com/el/7/x86_64/",
          gpgcheck => 0,
          enabled  => 1,
        }
        yumrepo { 'docker':
          descr       => 'docker repo',
          baseurl     => 'https://yum.dockerproject.org/repo/main/centos/$releasever/',
          gpgcheck    => 0,
          enabled     => 1,
        }
      }
      default: {
        fail("\"${module_name}\" provides no repository information for OSfamily \"${::osfamily}\"")
      }
    }
  }
}
