#!/bin/bash -e

CURRENT_DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

mkdir -p $CURRENT_DIR/{RPMS,SRPMS}
chmod 777 $CURRENT_DIR/{RPMS,SRPMS}

docker pull jc21/rpmbuild-centos7

docker run --rm \
       -v $CURRENT_DIR:/home/rpmbuilder/stuff \
       -v $CURRENT_DIR/RPMS:/home/rpmbuilder/rpmbuild/RPMS/ \
       -v $CURRENT_DIR/SPECS:/home/rpmbuilder/rpmbuild/SPECS/ \
       -v $CURRENT_DIR/SRPMS:/home/rpmbuilder/rpmbuild/SRPMS/ \
       jc21/rpmbuild-centos7 \
       "rpmbuild/SPECS/rpm-build.sh"
