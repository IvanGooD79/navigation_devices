import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
id:root
    property real side: Math.min(width,height)
    property alias xpos: id_compas.x
    property alias ypos: id_compas.y
    property color colorLight_1: "#ff0080aa"
    property color colorLight_2: "transparent"
    property int curCompasAng: 0

    function stateAngle()
    {
        disk.state = "rotated"
    }

    function sidesZone()
    {
        var zone = ["N","NE","E","SE","S","SW","W","NW"];
        var i=0;
        if (curCompasAng>338 && curCompasAng<=22)  i = 0;
        if (curCompasAng>22  && curCompasAng<=68)  i = 1;
        if (curCompasAng>68  && curCompasAng<=112) i = 2;
        if (curCompasAng>112 && curCompasAng<=158) i = 3;
        if (curCompasAng>158 && curCompasAng<=202) i = 4;
        if (curCompasAng>202 && curCompasAng<=248) i = 5;
        if (curCompasAng>248 && curCompasAng<=292) i = 6;
        if (curCompasAng>292 && curCompasAng<=338) i = 7;
    return zone[i];
    }

    Rectangle{
        property int numberIndexs_S: 180
        property int numberIndexs_M: 12
        property int numberIndexs_B: 4
        property int startAngle: 0
        property int maxAngle: 360

        id:id_compas
        height: side
        width: height
        radius: width/2
        color: "transparent"
        //border.color: "white"
        //border.width: width*0.01

        Rectangle{
            id: disk
            height: parent.height*0.95
            width: height
            radius: width/2
            color: "transparent"
            //border.color: "gold"
            //border.width: width*0.01
            x: (parent.width - width)/2
            y: (parent.height - height)/2


            Behavior on rotation{
                    SmoothedAnimation{velocity: 25; duration: 3000;}
            }
            states: State {
                name: "rotated"
                PropertyChanges { target: disk; rotation: -curCompasAng}
            }

//            NumberAnimation on rotation {
//                from:1
//                to: -360
//                duration: 3000
//                running: true
//                loops: Animation.Infinite  // или число циклов
//                easing.type: Easing.Linear
//            }

            // рисуем маленькие риски
            Repeater{
                model: id_compas.numberIndexs_S
                Item {
                    height: disk.height/2
                    transformOrigin: Item.Bottom
                    rotation: index * (id_compas.maxAngle/id_compas.numberIndexs_S) + id_compas.startAngle
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
                model: id_compas.numberIndexs_M
                Item {
                    height: disk.height/2
                    transformOrigin: Item.Bottom
                    rotation: index * (id_compas.maxAngle/id_compas.numberIndexs_M) + (id_compas.startAngle+30)
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
                        text:  index<id_compas.numberIndexs_M-1? (index+1) * 30 : 0
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: risk.height*0.8
                    }
                }
            }

            // рисуем большие риски
            Repeater{
                model: ["N","E","S","W"] //id_compas.numberIndexs_B
                Item {
                    height: disk.height/2
                    transformOrigin: Item.Bottom
                    rotation: index * (id_compas.maxAngle/id_compas.numberIndexs_B) + (id_compas.startAngle+180)
                    x:disk.width/2

                    Rectangle{
                        height: disk.height*0.12
                        width: height*0.10
                        color: "silver"
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: -height/2
                    }

                    Text{
                        font.pixelSize: parent.width*0.15
                        font.bold: true
                        color: if (index === 0) "skyblue"; else if  (index === 2) "red"; else "white"
                        text: modelData
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: disk.height*0.8
                        rotation: 180
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

        // стрелка
        Rectangle{
            id: id_center
            anchors.centerIn: parent
            height: id_light.height*0.7
            width:  height
            radius: width/2
            color: "black"
            border.color: colorLight_1
            border.width: width*0.018

        }
        Rectangle{
            id: id_arrow
            height: id_light.height*0.1
            width: height*0.15
            color: colorLight_1
            antialiasing: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: height*2.1
        }


        FastBlur{
            anchors.fill: id_arrow
            source: id_arrow
            radius: 15
        }

        Text{
            id: id_tx_sides
            font.pixelSize: parent.width*0.06
            font.bold: true
            color: colorLight_1
            text:  sidesZone()
            antialiasing: true
            anchors.verticalCenter: id_center.verticalCenter
            anchors.right: id_center.horizontalCenter
            anchors.rightMargin: 20
        }

        Text{
            font.pixelSize: parent.width*0.12
            color: "silver"
            text:  curCompasAng +"˚"
            antialiasing: true
            anchors.verticalCenter: id_center.verticalCenter
            anchors.left: id_tx_sides.right
            anchors.margins: 10
        }
    }

}
