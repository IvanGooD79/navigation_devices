import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id:root
        property real side: Math.min(width,height)
        property alias xpos: id_inclin.x
        property alias ypos: id_inclin.y
        property color colorLight_1: "#ff0080aa"
        property color colorLight_2: "transparent"
        property color colorIcoLight: "#ff00ff00"
        property int curAngInc: 0
        property int curAngKren: 0
        property var arr:  [-20,-10,0,10,20]
        property bool ico_light: false

        Rectangle{
            property int numberIndexs_S1: 40
            property int numberIndexs_S2: 45
            property int numberIndexs_M1: 5
            property int numberIndexs_M2: 4
            property int numberIndexs_B: 3
            property int startAngle_1: 230
            property int maxAngle_1: 80
            property int startAngle_2: 0
            property int maxAngle_2: 90


            id: id_inclin
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
                    model: id_inclin.numberIndexs_S1
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * (id_inclin.maxAngle_1/id_inclin.numberIndexs_S1) + id_inclin.startAngle_1
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
                    model: id_inclin.numberIndexs_S2
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * (id_inclin.maxAngle_2/id_inclin.numberIndexs_S2) + id_inclin.startAngle_2
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
                    model: id_inclin.numberIndexs_M1
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * 20 + (id_inclin.startAngle_1)
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
                    model: id_inclin.numberIndexs_M2
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index * 30 + (id_inclin.startAngle_2)
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
                            text:  index * 30
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: risk_r.height*0.8
                        }
                    }
                }

                // рисуем большие риски
                Repeater{
                    model: id_inclin.numberIndexs_B
                    Item {
                        height: disk.height/2
                        transformOrigin: Item.Bottom
                        rotation: index < 2 ? index * 90 + (id_inclin.startAngle_2) : 20
                        x:disk.width/2

                        Rectangle{
                            id: big_risk
                            height: index < 2 ? disk.height*0.11 : disk.height*0.08
                            width: index < 2 ? height*0.12 : height*0.15
                            color: index < 2 ? "silver" : "gold"
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -height/2
                        }

                        Text{
                            font.pixelSize: parent.width*0.1
                            color: index === 2 ? "gold" : "white"
                            text:  index === 2 ? "20" : ""
                            antialiasing: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: big_risk.height*0.8
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
                rotation:  -90+curAngInc

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
                              ctx.shadowOffsetX = -4;

                              ctx.lineWidth = width*0.02
                              ctx.beginPath()
                              ctx.arc(centreX-width*0.02, centreY, height/2, Math.PI/4, 7*Math.PI/4, true);
                              ctx.stroke()
                          }
                    }
                }


                // стрелка право
                Item {
                    height: parent.height/2
                    transformOrigin: Item.Bottom
                    rotation: 90
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

            // центральный блок
            Rectangle{
                id: id_deviation_2
                anchors.centerIn: parent
                height: parent.height*0.80
                width: height
                radius: width/2
                color: "transparent"
                rotation: curAngKren*2

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
                              ctx.shadowBlur = 4;
                              ctx.shadowOffsetX = 4;
                              ctx.lineWidth = width*0.02
                              ctx.beginPath()
                              ctx.arc(centreX+width*0.02, centreY, height/2, 7*Math.PI/6, 5*Math.PI/6, true);
                              ctx.stroke()
                          }
                    }
                }

                // стрелка лево
                Item {
                    height: parent.height/2
                    transformOrigin: Item.Bottom
                    rotation: 270
                    x:parent.width/2
                    Rectangle{
                        height: parent.height*0.30
                        width: height*0.10
                        color: Qt.hsla(0.9, 0.5, 0.5, 1) //colorLight_1
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                    }
                }
            }

            ICO_antena{
                id: id_ico_obj
                anchors.centerIn: parent
                height: parent.height*0.75
                width: height
                flag_light: ico_light
                iColorLight: colorIcoLight
            }


            Text{
                id: kren_text
                font.pixelSize: parent.width*0.06
                color: curAngKren != 0 ? "gold" : "lightgreen"
                text:  "крен \nантенны"
                antialiasing: true
                anchors.left: id_deviation_2.left
                anchors.leftMargin: width*0.5
                anchors.top: id_deviation_2.bottom
                anchors.topMargin: -10
            }

            Text{
                id: kren_data
                font.pixelSize: parent.width*0.06
                color: curAngKren != 0 ? "gold" : "lightgreen"
                text:  if (curAngKren > 0) "крен вправо " +curAngKren; else if (curAngKren < 0)  "крен влево " +curAngKren*(-1); else "норма"
                antialiasing: true
                anchors.left: kren_text.left
                anchors.top: kren_text.bottom
                anchors.topMargin: height*0.1
            }

            Text{
                id: inc_text
                font.pixelSize: parent.width*0.06
                color: "lightgreen"//curAngInc != 0 ? "gold" : "lightgreen"
                text:  "наклон \nантенны"
                antialiasing: true
                anchors.right: id_deviation_2.right
                anchors.rightMargin: width*0.1
                anchors.top: kren_text.top
            }

            Text{
                id: inc_data
                font.pixelSize: parent.width*0.06
                color: curAngInc == 20 ? "lightgreen" : "gold"
                text:  curAngInc
                antialiasing: true
                anchors.right: inc_text.right
                anchors.top: inc_text.bottom
                anchors.topMargin: height*0.1

            }

            DropShadow {
                source: kren_data
                anchors.fill: kren_data
                color: "silver"
                opacity: 1
                radius: 10
                horizontalOffset: 4
                verticalOffset: 6
                samples: 15
                NumberAnimation on opacity {
                    easing.amplitude: 8
                    from: 1
                    to: 0.8
                    duration: 1000
                    loops: Animation.Infinite
                    running: true
                    easing.type: Easing.InOutBounce
                }
            }

        }



}
