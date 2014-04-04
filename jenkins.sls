
jenkins-dependencies:
  pkg.installed:
    - pkgs:
      - openjdk-7-jre
      - openjdk-7-jdk

jenkins-pkgrepo:
  pkgrepo.managed:
    - name: deb http://pkg.jenkins-ci.org/debian binary/
    - file: /etc/apt/sources.list.d/jenkins.list
    - key_url: http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key
    - require_in:
      - pkg: jenkins

jenkins:
  pkg:
    - installed
  service:
    - running

nginx:
  pkg:
    - installed
  service:
    - running

/etc/nginx/sites-enabled/jenkins:
  file.managed:
    - source: salt://files/jenkins/nginx_config
    - watch_in:
      - service: nginx

ufw-allow-http:
  cmd.run:
    - name: ufw allow http
