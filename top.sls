
base:
  '*':
    - system-base
  ops0.builditwithbits.com:
    - salt-master
  ci.builditwithbits.com:
    - jenkins
    - build-blog
  web0.builditwithbits.com:
    - blog

