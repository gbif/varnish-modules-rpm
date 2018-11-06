# Varnish Modules RPM

RPM spec for creating varnish-modules-rpm package on CentOS.

Based on https://github.com/istenrot/varnish-modules-rpm-build, but then completely rewritten
to use a different Docker image.

## Usage

```
make clean
make rpm
make deploy
```

The RPM is published to http://gbifrepo.gbif.org/x86_64/Centos/7/

```
[gbif]
name=Centos $releasever - $basearch
failovermethod=priority
baseurl=http://gbifrepo.gbif.org/$basearch/Centos/$releasever/
enabled=1
gpgcheck=0
```
