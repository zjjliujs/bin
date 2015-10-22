#/bin/bash
oldf=$( mktemp /tmp/old.XXXXXXX )
newf=$( mktemp /tmp/new.XXXXXXX )

mgdir="/opt/magneto"
cat ${mgdir}/build.xml |grep \<jar|awk '{print $2}'|awk -F/ '{print $2}'|awk -F\. '{print $1}'|grep  -v mgdeploy|grep -v mgsshtool|sort > ${oldf}

cat ${mgdir}/src/build-all.sh|grep build-|awk -F- '{print $2}'|awk -F\. '{print $1}'|sort > ${newf}

diff ${oldf} ${newf}

rm ${oldf} ${newf}
