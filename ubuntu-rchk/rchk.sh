#! /bin/bash

## We restore R_LIBS
ORIGRLIBS="$R_LIBS"
cd /opt/R-svn
. /opt/rchk/scripts/cmpconfig.inc
cd -
export R_LIBS="$ORIGRLIBS"

${RBINARY} CMD INSTALL "$1"
pkg=$(echo $1 | sed 's/_.*$//')

cd /opt/R-svn
/opt/rchk/scripts/check_package.sh ${pkg}

cat packages/lib/${pkg}/libs/${pkg}.so.bcheck
cat packages/lib/${pkg}/libs/${pkg}.so.maacheck
