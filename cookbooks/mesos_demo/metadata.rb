name             'mesos_demo'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures mesos_demo'
long_description 'Installs/Configures mesos_demo'
version          '0.1.0'

depends 'hostsfile'
depends 'marathon', '~> 1.0.2'
depends 'mesos', '~> 3.4.0'

supports 'centos'
supports 'redhat'
