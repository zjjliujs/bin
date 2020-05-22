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

fixTypeDec GLForbiddenZone shape
fixTypeDec GLMapRect rect
fixTypeDec GLMapRect shape
fixTypeDec MapInfoI mapInfo
fixTypeDec MapInfoI currentMapInfo
fixTypeDec MapInfoI getMapInfo
fixTypeDec MapInfoI mInfo
fixTypeDec MapInfoI newMapInfo
fixTypeDec MapInfoI info
fixTypeDec GLMatrixManagerI mtxMgr
fixTypeDec GLMapViewContextI glContext
fixTypeDec MapShape activeShape
fixTypeDec MapShape shape
fixTypeDec MapShape other
fixTypeDec MapShape dock
fixTypeDec MapShape newShape
fixTypeDec MapShape virtualWall
fixTypeDec MapShape forbidden
fixTypeDec MapShape speedBump
fixTypeDec MapShape getActiveShape
fixTypeDec MapShape getMapShape
fixTypeDec MapShape editingShape
fixTypeDec MapShape find
fixTypeDec MapSubRegion subRegion
fixTypeDec GLPathFillRect shape
fixTypeDec UpwardRect rect
fixTypeDec UpwardRect actualMapRect
fixTypeDec UpwardRect getActualMapRect
fixTypeDec UpwardRect mapRect
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
fixTypeDec ScrubberMapInfo info
fixTypeDec GLLocateRect appRect
fixTypeDec GLMarkPoint glMP
fixTypeDec GLPointChangeBox box
fixTypeDec MapBitmapInfoI mbInfo
fixTypeDec BaseMapDataInfo dataInfo
fixTypeDec MapObject mapObject
fixTypeDec MapObject mapObj 
fixTypeDec MapObject getNdcMapObject
fixTypeDec MapObject ndcMapObject
fixTypeDec MapConfigI getMapConfigs
fixTypeDec MapConfigI mapConfig
fixTypeDec MapConfigI mapConfigs
fixTypeDec BaseMapBitmapInfo info
fixTypeDec ScrubberMapBitmapInfo info
fixTypeDec ScrubberMapDataInfo dataInfo
fixTypeDec MapBmpBuilderI instance
fixTypeDec MapBmpBuilderI viewMapBuilder
fixTypeDec GLMapViewRenderI mapViewRender
fixTypeDec MapBuilderThreadI mapBuilderThread
fixTypeDec MapViewListenerI mapViewListener
fixTypeDec MapLoadingAnim get
fixTypeDec GLTextureManager textureMgr
fixTypeDec PreMultiMapShaderProgram pre
fixTypeDec ColorMapShaderProgram color
fixTypeDec PreMultiAnimShaderProgram preMultiAnimProgram
fixTypeDec MapLoadingAnim cleaningMapLoadingAnim
fixTypeDec MapNotPresentAnim mapNotPresentAnim
fixTypeDec ScaleRulerObject scaleRulerObject
fixTypeDec ScaleRulerInfoObject scaleRulerInfoObject
fixTypeDec PointObject getZzObject
fixTypeDec PointObject decorateIconObject
fixTypeDec PointObject decorateIconObject
fixTypeDec PointObject glObject
fixTypeDec PointObject getGlObject
fixTypeDec ScaleRulerObject getScaleRulerObject
fixTypeDec RectTextureObject dockObject
fixTypeDec RectTextureObject robotSpotObject
fixTypeDec RectTextureObject getRobotSpotObject
fixTypeDec RectTextureObject buildObjectOnMap
fixTypeDec RobotHaloObject get
fixTypeDec RobotHaloObject chargingHaloObject
fixTypeDec RobotHaloObject warningHaloObjec
fixTypeDec RobotHaloObject waitingHaloObject;
fixTypeDec RobotHaloObject buildHaloObject
fixTypeDec RobotHaloObject haloObject
fixTypeDec ShapeInfoObject shapeInfoObject
fixTypeDec ShapeInfoObject get
fixTypeDec PointObject get
fixTypeDec LaserObject laserObject
fixTypeDec ColorShaderProgram colorProgram
fixTypeDec ColorShaderProgram program
fixTypeDec ShaderProgram shaderProgram
fixTypeDec LineStripObjects pathObject
fixTypeDec MapResMgrI mapViewResMg
fixTypeDec MapResMgrI resourceManager
fixTypeDec MapResMgrI mapResMgr
fixTypeDec MapResMgrI get
fixTypeDec RectTextureObject robotObject
fixTypeDec GLMapPoint point
fixTypeDec GLMapPoint dockLocation
fixTypeDec GLMapPoint robotLocation
fixTypeDec PointObject markPointIconObject
fixTypeDec LineStripObjects pathObject
fixTypeDec GLMarkPoint markPoint
fixTypeDec MapPathInfoI path
fixTypeDec MapPathInfoI mapPath
fixTypeDec MapPathInfoI get
fixTypeDec MapDataInfoI get
fixTypeDec RectTextureObject map
fixTypeDec RectTextureObject get


fixTypeCvt GLMapRect
fixTypeCvt ScrubberMapDataInfo

echo "Convert list<ClassName> to ClassName **"
sed -i "s/List<\([a-zA-Z]\+\)> /\1 ** /" ${targetFile}

echo "Convert MotionEvent e to QEvent * e"
sed -i "s/MotionEvent e/QEvent * e/g" ${targetFile}

echo "Convert MapUIStatus to MapUIStatus:Status"
sed -i "s/MapUIStatus /MapUIStatus::Status /g" ${targetFile}

echo "Done!"
