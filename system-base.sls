
common-packages:
  pkg.latest:
    - pkgs:
      - ssh
      - vim
      - git
      - ufw
      - fail2ban
      - unattended-upgrades
      - logwatch

ufw-enabled:
  cmd.run:
    - name: 'ufw enable'
    - require:
      - pkg: common-packages

ufw-allow-openssh:
  cmd.run:
    - name: 'ufw allow OpenSSH'
    - require:
      - pkg: common-packages

ssh:
  service:
    - running
    - enable: true
    - watch:
      - pkg: common-packages
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://files/ssh/sshd_config

/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - source: salt://files/apt/10periodic

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - source: salt://files/apt/50unattended-upgrades

/etc/cron.daily/00logwatch:
  file.managed:
    - source: salt://files/logwatch/00logwatch

salt-minion:
  pkg.installed:
    - version: 2014.1.0-1precise1
