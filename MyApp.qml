/* Copyright 2017 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import Esri.ArcGISRuntime 100.1

import "controls" as Controls

App {
    id: app
    width: 414
    height: 736
    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)

    Page{
        anchors.fill: parent
        header: ToolBar{
            id:header
            width: parent.width
            height: 50 * scaleFactor
            Material.background: "#8f499c"
            Controls.HeaderBar{}
        }

        // sample starts here ------------------------------------------------------------------
        contentItem: Rectangle{
            anchors.top:header.bottom
            // Create the MapView
            MapView {
                id:mapView
                anchors.fill: parent
                // Nest the Map as a child of the MapView
                Map {
                    // Nest the Basemap to add it as the Map's Basemap
                    BasemapTopographic {}

                    // Nest an ArcGISMapImage Layer in the Map to add it as an operational layer
                    ArcGISMapImageLayer {
                        id: mapImageLayer
                        //Must Publish Map, not a layer. It must have sublayers in order for the subLayer Module to work
                        //Must be Shared as Public
                        url: "http://sampleserver6.arcgisonline.com/arcgis/rest/services/911CallsHotspot/MapServer"
                       //url: "https://ec2-54-68-22-196.us-west-2.compute.amazonaws.com:6443/arcgis/rest/services/Murphy/graffiti_CostMap_StPaulMN_2015/MapServer"
                       //url: "https://services3.arcgis.com/J1Locv0GPOt6yBRR/arcgis/rest/services/BTS_Reportings_Tile_Layer/MapServer"
                       //url: "http://sampleserver6.arcgisonline.com/arcgis/rest/services/SampleWorldCities/MapServer"

                    }

                    initialViewpoint: ViewpointCenter {
                        center: Point {
                            //x moves left/right
                            x: 7610000//6e6 //-11e6
                            //y moves up/down
                            y: 680000 //6e6
                            spatialReference: SpatialReference {wkid: 102726}
                        }
                        targetScale: 250000
                    }
                }
                //Busy Indicator
                BusyIndicator {
                    anchors.centerIn: parent
                    height: 48 * scaleFactor
                    width: height
                    running: true
                    Material.accent:"#8f499c"
                    visible: (mapView.drawStatus === Enums.DrawStatusInProgress)
                }
            }

            // Create a window to display the sublayers
            Rectangle {
                id: layerVisibilityRect
                anchors {
                    margins: 10 * scaleFactor
                    left: parent.left
                    top: parent.top
                }
                height: 150 * scaleFactor
                width: 150 * scaleFactor
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    onClicked: mouse.accepted = true
                    onWheel: wheel.accepted = true
                }

                Rectangle {
                    anchors.fill: parent
                    width: layerVisibilityRect.width
                    height: layerVisibilityRect.height
                    color: "lightgrey"
                    opacity: .9
                    radius: 5
                    border {
                        color: "#4D4D4D"
                        width: 1
                    }


                    Column {
                        anchors {
                            fill: parent
                            margins: 10 * scaleFactor
                        }
                        clip: true

                        Text {
                            width: parent.width
                            text: "Sublayers"
                            wrapMode: Text.WordWrap
                            clip: true
                            font {
                                pixelSize: 14 * scaleFactor
                                bold: true
                            }
                        }

                        // Create a list view to display the items
                        ListView {
                            id: layerVisibilityListView
                            anchors.margins: 10 * scaleFactor
                            width: parent.width
                            height: parent.height
                            clip: true

                            // Assign the model to the list model of sublayers
                            model: mapImageLayer.mapImageSublayers

                            // Assign the delegate to the delegate created above
                            delegate: Item {
                                id: layerVisibilityDelegate
                                width: parent.width
                                height: 35 * scaleFactor

                                Row {
                                    spacing: 0
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 70 * scaleFactor
                                        text: name
                                        wrapMode: Text.WordWrap
                                        font.pixelSize: 14 * scaleFactor
                                    }

                                    Switch {

                                        Material.accent: "#8f499c"

                                        onCheckedChanged: {
                                            sublayerVisible = checked;
                                        }
                                        Component.onCompleted: {
                                            checked = sublayerVisible;
                                        }

                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // sample ends here ------------------------------------------------------------------------
    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}


