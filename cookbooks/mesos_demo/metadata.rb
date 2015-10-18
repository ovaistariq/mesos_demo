name             'mesos_demo'
maintainer       'Ovais Tariq'
maintainer_email 'me@ovaistariq.net'
license          'Apache 2.0'
description      'Installs/Configures mesos_demo'
long_description 'Installs/Configures mesos_demo'
version          '0.1.0'

depends 'hostsfile'
depends 'marathon', '~> 1.0.3'
depends 'mesos', '~> 3.4.0'
depends 'zookeeper_demo'

supports 'ubuntu'
