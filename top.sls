
base:
  '*':
    - system-base
  ops0.builditwithbits.com:
    - salt-master
  ci.builditwithbits.com:
    - jenkins
    - build-blog
  www.builditwithbits.com:
    - blog

