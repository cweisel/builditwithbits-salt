
include:
  - build-blog

https://github.com/cweisel/builditwithbits-blog.git:
  git.latest:
    - rev: master
    - target: /srv/www/builditwithbits
    - always_fetch: True

builditwithbits:
  cmd.wait:
    - name: /srv/build/builditwithbits/env/bin/pelican /srv/www/builditwithbits/content/

nginx:
  pkg:
    - installed
  service:
    - running

/etc/nginx/sites-enabled/builditwithbits:
  file.managed:
    - source: salt://files/builditiwthbits/nginx_config
    - watch_in:
      - service: nginx

ufw-allow-http:
  cmd.run:
    - name: ufw allow http
