
salt-master:
  pkg.installed:
    - version: 2014.1.0-1precise1
  service:
    - running

ufw-allow-salt:
  cmd.run:
    - name: 'ufw allow salt'
