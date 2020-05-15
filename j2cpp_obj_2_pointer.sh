#!/bin/bash

function fixTypeDec() {
    tN=$1
    vN=$2

    echo "${tN} ${vN} --> ${tN} * ${vN}"
    sed -i "s/\(${tN}\)[ \t]\+\(${vN}\)/\1 * \2/g" ${targetFile}

    echo Done！
}

function fixTypeCvt() {
    tN=$1

    echo "(${tN}) --> (${tN} *)"
    sed -i "s/(\(${tN}\))/(\1 *)/g" ${targetFile}

    echo Done！
}

if [ ! $# -eq 1 ]
then
   echo "Usage: $0 <file_name>"
   echo 'Convert such as "MapShape mapShape" to "MapShape * mapShape"'
   exit 0
fi

targetFile=$1

fixTypeDec MapInfoI mapInfo
fixTypeDec MapInfoI currentMapInfo
fixTypeDec GLMatrixManagerI mtxMgr
fixTypeDec GLMapViewContextI glContext
fixTypeDec MapShape shape
fixTypeDec MapShape other
fixTypeDec MapShape dock
fixTypeDec MapShape newShape
fixTypeDec MapShape virtualWall
fixTypeDec MapShape forbidden
fixTypeDec MapShape speedBump
fixTypeDec MapSubRegion subRegion
fixTypeDec GLPathFillRect shape
fixTypeDec MapResMgrI resourceManager
fixTypeDec MapObject mapObject
fixTypeDec MapObject mapObj 
fixTypeDec UpwardRect rect
fixTypeDec LineLoopObject getBorderObject
fixTypeDec RectObject getFillObject
fixTypeDec QImage bmp
fixTypeDec QImage infoBitmap
fixTypeDec QImage shortInfoBitmap
fixTypeDec QImage getShortInfoBitmap
fixTypeDec QImage getShortInfoBitmap
fixTypeDec QImage getLongInfoBitmap
fixTypeDec GLLocateRect shape
fixTypeDec GLVirtualWall shape
fixTypeDec GLPolyVirtualWall shape
fixTypeDec GLSpeedBump shape
fixTypeDec GLMarkPoint shape
fixTypeDec MapDataInfoI mapDataInfo
fixTypeDec MapConfigI mapConfigs
fixTypeDec MapResMgrI mapResMgr
fixTypeDec ScrubberMapInfo info
fixTypeDec MapPathInfoI pathInfo
fixTypeDec MapPathInfoI path
fixTypeDec GLLocateRect appRect
fixTypeDec GLMarkPoint glMP
fixTypeDec GLPointChangeBox box

fixTypeCvt GLMapRect

echo "Convert list<ClassName> to ClassName **"
sed -i "s/List<\([a-zA-Z]\+\)> /\1 ** /" ${targetFile}

echo "Done!"
