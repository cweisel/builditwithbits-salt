python-pip:
  pkg.installed

git:
  pkg.installed

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

/srv/build/builditwithbits:
  file.directory:
    - mkdirs: True

/srv/build/builditwithbits/env:
  virtualenv.managed:
    - requirements: salt://files/builditwithbits/requirements.txt

