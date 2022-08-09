import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id:root
        property real side: Math.min(width,height)
        property alias xpos: id_bank_duo.x
        property alias ypos: id_bank_duo.y
        property color colorLight_1: "#ff0080aa"
        property color colorLight_2: "transparent"
        property color colorIcoLight: "#ff00ff00"
        property int curAng_1: 0
        property int curAng_2: 0
        property int curAng_3: 0
        property int curAng_4: 0

        property var arr:  [-20,-10,0,10,20]
        property bool ico_light: false

        Rectangle{
            property int numberIndexs_S: 40
            property int numberIndexs_M: 5
            property int numberIndexs_B: 4
            property int startAngle_1: 320
            property int maxAngle_1: 80
            property int startAngle_2: 140
            property int maxAngle_2: 80


            id: id_bank_duo
            height: side
            width: height
            radius: height/2
            color: "transparent"
//            border.color: "white"
//            border.width: width*0.01

            Rectangle{
                id: disk
                height: parent.height*0.98
                width: height
                radius: width/2
                color: "transparent"
                //border.color: "gold"
                //border.width: width*0.01
                x: (parent.width - width)/2
                y: (parent.height - height)/2

                // рисуем маленькие риски
                Repeater{
                    model: id_bank_duo.numberIndexs_S
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * (id_bank_duo.maxAngle_1/id_bank_duo.numberIndexs_S) + id_bank_duo.startAngle_1
                        x:disk.width/2

                        Rectangle{
                            height: disk.height*0.05
                            width: height*0.15
                            color: "silver"
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -height/2
                        }
                    }
                }

                // рисуем маленькие риски
                Repeater{
                    model: id_bank_duo.numberIndexs_S
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * (id_bank_duo.maxAngle_2/id_bank_duo.numberIndexs_S) + id_bank_duo.startAngle_2
                        x:disk.width/2

                        Rectangle{
                            height: disk.height*0.05
                            width: height*0.15
                            color: "silver"
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -height/2
                        }
                    }
                }

                // рисуем средние риски
                Repeater{
                    model: id_bank_duo.numberIndexs_M
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * 20 + (id_bank_duo.startAngle_1)
                        x:disk.width/2

                        Rectangle{
                            id:risk
                            height: disk.height*0.08
                            width: height*0.15
                            color: "silver"
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -height/2
                        }

                        Text{
                            font.pixelSize: parent.width*0.1
                            color: "white"
                            text:  arr[index]
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: risk.height*0.8
                        }
                    }
                }

                // рисуем средние риски
                Repeater{
                    model: id_bank_duo.numberIndexs_M
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * 20 + (id_bank_duo.startAngle_2)
                        x:disk.width/2

                        Rectangle{
                            id:risk_r
                            height: disk.height*0.08
                            width: height*0.15
                            color: "silver"
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -height/2
                        }

                        Text{
                            font.pixelSize: parent.width*0.1
                            color: "white"
                            text:  arr[4-index]
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: risk_r.height*0.8
                        }
                    }
                }

                // подсветка
                Rectangle{
                    id: id_light
                    anchors.centerIn: parent
                    height: disk.height*0.80
                    width: height
                    radius: width/2
                    color: "transparent"
                    //        border.color: "white"
                    //        border.width: width*0.01
                        RadialGradient {
                            anchors.fill: parent
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: colorLight_1 }
                                GradientStop { position: 0.60; color: colorLight_2 }
                            }
                        }
                }
            }

            // центральный блок
            Rectangle{
                id: id_deviation_1
                anchors.centerIn: parent
                height: parent.height*0.85
                width: height
                radius: width/2
                color: "transparent"
                rotation: curAng_1*2

                // центральный круг
                Rectangle{
                    anchors.centerIn: parent
                    height: parent.height*0.7
                    width:  height
                    radius: width/2
                    color: "black"
//                    border.color: colorLight_1
//                    border.width: width*0.018
                    Canvas {
                          anchors.fill: parent
                          onPaint: {
                              var ctx = getContext("2d");
                              ctx.reset();
                              var centreX = width / 2;
                              var centreY = height / 2;
                              ctx.beginPath();
                              ctx.strokeStyle = colorLight_1
                              ctx.shadowColor = Qt.hsla(0.6, 0.5, 0.5, 1)
                              ctx.shadowBlur = 3;
                              ctx.shadowOffsetY = 4;

                              ctx.lineWidth = width*0.02
                              ctx.beginPath()
                              ctx.arc(centreX, centreY+height*0.02, height/2, 7*Math.PI/4, 5*Math.PI/4, true);
                              ctx.stroke()
                          }
                    }
                }
                // стрелка вверх
                Item {
                    height: parent.height/2
                    transformOrigin: Item.Bottom
                    rotation: 0
                    x:parent.width/2
                    Rectangle{
                        height: parent.height*0.30
                        width: height*0.10
                        color: colorLight_1
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                    }
                }               
            }

            Rectangle{
                id: id_deviation_11
                anchors.centerIn: parent
                height: parent.height*0.85
                width: height
                radius: width/2
                color: "transparent"
                rotation: curAng_2*2

                // центральный круг
                Rectangle{
                    anchors.centerIn: parent
                    height: parent.height*0.7
                    width:  height
                    radius: width/2
                    color: "transparent"
//                    border.color: colorLight_1
//                    border.width: width*0.018
                    Canvas {
                          anchors.fill: parent
                          onPaint: {
                              var ctx = getContext("2d");
                              ctx.reset();
                              var centreX = width / 2;
                              var centreY = height / 2;
                              ctx.beginPath();
                              ctx.strokeStyle = Qt.hsla(0.9, 0.5, 0.5, 1)
                              ctx.shadowColor = Qt.hsla(0.9, 0.5, 0.5, 1)
                              ctx.shadowBlur = 3;
                              ctx.shadowOffsetY = 2;

                              ctx.lineWidth = width*0.02
                              ctx.beginPath()
                              ctx.arc(centreX, centreY+height*0.02, height/2, 5*Math.PI/3, 4*Math.PI/3, true);
                              ctx.stroke()
                          }
                    }
                }
                // стрелка вверх
                Item {
                    height: parent.height/2
                    transformOrigin: Item.Bottom
                    rotation: 0
                    x:parent.width/2
                    Rectangle{
                        height: parent.height*0.30
                        width: height*0.10
                        color: Qt.hsla(0.9, 0.5, 0.5, 1)
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                    }
                }
            }

            // центральный блок
            Rectangle{
                id: id_deviation_2
                anchors.centerIn: parent
                height: parent.height*0.85
                width: height
                radius: width/2
                color: "transparent"
                rotation: -curAng_3*2

                // центральный круг
                Rectangle{
                    anchors.centerIn: parent
                    height: parent.height*0.7
                    width:  height
                    radius: width/2
                    color: "transparent"
//                    border.color: colorLight_1
//                    border.width: width*0.018
                    Canvas {
                          anchors.fill: parent
                          onPaint: {
                              var ctx = getContext("2d");
                              ctx.reset();
                              var centreX = width / 2;
                              var centreY = height / 2;
                              ctx.beginPath();
                              ctx.strokeStyle = colorLight_1
                              ctx.shadowColor = Qt.hsla(0.6, 0.5, 0.5, 1)
                              ctx.shadowBlur = 3;
                              ctx.shadowOffsetY = -4;

                              ctx.lineWidth = width*0.02
                              ctx.beginPath()
                              ctx.arc(centreX, centreY-height*0.02, height/2, 3*Math.PI/4, Math.PI/4, true);
                              ctx.stroke()
                          }
                    }
                }

                // стрелка вниз
                Item {
                    height: parent.height/2
                    transformOrigin: Item.Bottom
                    rotation: 180
                    x:parent.width/2
                    Rectangle{
                        height: parent.height*0.30
                        width: height*0.10
                        color: colorLight_1
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                    }
                }
            }

            Rectangle{
                id: id_deviation_22
                anchors.centerIn: parent
                height: parent.height*0.85
                width: height
                radius: width/2
                color: "transparent"
                rotation: -curAng_4*2

                // центральный круг
                Rectangle{
                    anchors.centerIn: parent
                    height: parent.height*0.7
                    width:  height
                    radius: width/2
                    color: "transparent"
//                    border.color: colorLight_1
//                    border.width: width*0.018
                    Canvas {
                          anchors.fill: parent
                          onPaint: {
                              var ctx = getContext("2d");
                              ctx.reset();
                              var centreX = width / 2;
                              var centreY = height / 2;
                              ctx.beginPath();
                              ctx.strokeStyle = Qt.hsla(0.9, 0.5, 0.5, 1)
                              ctx.shadowColor = Qt.hsla(0.9, 0.5, 0.5, 1)
                              ctx.shadowBlur = 3;
                              ctx.shadowOffsetY = -2;

                              ctx.lineWidth = width*0.02
                              ctx.beginPath()
                              ctx.arc(centreX, centreY-height*0.02, height/2, 2*Math.PI/3, Math.PI/3, true);
                              ctx.stroke()
                          }
                    }
                }

                // стрелка вниз
                Item {
                    height: parent.height/2
                    transformOrigin: Item.Bottom
                    rotation: 180
                    x:parent.width/2
                    Rectangle{
                        height: parent.height*0.30
                        width: height*0.10
                        color: Qt.hsla(0.9, 0.5, 0.5, 1)
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                    }
                }
            }
            ICO_chassis{
                id: id_ico_obj
                anchors.centerIn: parent
                height: parent.height*0.70
                width: height
                flag_light: ico_light
                iColorLight: colorIcoLight
                whl1: curAng_1 != 0 ? 2 : 0
                whl2: curAng_2 != 0 ? 1 : 0
                whl3: curAng_3 != 0 ? 2 : 0
                whl4: curAng_4 != 0 ? 1 : 0
            }

            Text{
                id: whl_text_1
                font.pixelSize: parent.width*0.06
                color: curAng_1 != 0 ? "gold" : "lightgreen"
                text:  if (curAng_1 > 0) "ОПЛ \nвправо\n " +curAng_1; else if (curAng_1 < 0)  "ОПЛ \nвлево\n " +curAng_1*(-1); else "ОПЛ \nнорма"
                antialiasing: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: id_deviation_1.top
                anchors.topMargin: height
                anchors.left: id_deviation_1.left
                anchors.leftMargin: -parent.width*0.10
            }

            Text{
                id: whl_text_2
                font.pixelSize: parent.width*0.06
                color: curAng_2 != 0 ? "gold" : "lightgreen"
                text:  if (curAng_2 > 0) "ОПП \nвправо\n " +curAng_2; else if (curAng_2 < 0)  "ОПП \nвлево\n " +curAng_2*(-1); else "ОПП \nнорма"
                antialiasing: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: id_deviation_1.top
                anchors.topMargin: height
                anchors.left: id_deviation_1.right
                anchors.leftMargin: -parent.width*0.05
            }

            Text{
                id: whl_text_3
                font.pixelSize: parent.width*0.06
                color: curAng_3 != 0 ? "gold" : "lightgreen"
                text:  if (curAng_3 > 0) "ОЗЛ \nвправо\n " +curAng_3; else if (curAng_3 < 0)  "ОЗЛ \nвлево\n " +curAng_3*(-1); else "ОЗЛ \nнорма"
                antialiasing: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: whl_text_1.bottom
                anchors.topMargin: height
                anchors.left: whl_text_1.left
            }

            Text{
                id: whl_text_4
                font.pixelSize: parent.width*0.06
                color: curAng_4 != 0 ? "gold" : "lightgreen"
                text:  if (curAng_4 > 0) "ОЗП \nвправо\n " +curAng_4; else if (curAng_4 < 0)  "ОЗП \nвлево\n " +curAng_4*(-1); else "ОЗП \nнорма"
                antialiasing: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: whl_text_2.bottom
                anchors.topMargin: height
                anchors.left: whl_text_2.left
            }



//            DropShadow {
//                source: bank_text
//                anchors.fill: bank_text
//                color: "silver"
//                opacity: 1
//                radius: 10
//                horizontalOffset: 4
//                verticalOffset: 6
//                samples: 15
//                NumberAnimation on opacity {
//                    easing.amplitude: 8
//                    from: 1
//                    to: 0.8
//                    duration: 1000
//                    loops: Animation.Infinite
//                    running: true
//                    easing.type: Easing.InOutBounce
//                }
//            }

        }



}
