import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id:root
        property real side: Math.min(width,height)
        property alias xpos: id_cbox.x
        property alias ypos: id_cbox.y
        property color colorLight_1: "#aa0080aa"
        property color colorLight_2: "transparent"
        property var arr: []
        property int pNum: 0

        Rectangle{
            id: id_cbox
            height: side
            width: height
            radius: height/2
            color: "transparent"
            antialiasing: true
//            border.color: Qt.hsla(0.6, 0.8, 0.8, 1)
//            border.width: width*0.01

            Canvas {
                 anchors.fill: parent
//                  width: parent.width*0.90
//                  height: parent.height*0.90
//                  anchors.horizontalCenter: parent.horizontalCenter
//                  anchors.verticalCenter: parent.verticalCenter
                  onPaint: {
                      var ctx = getContext("2d")
                      ctx.reset()
                      var centreX = width / 2
                      var centreY = height / 2

                      //=================================================================
                      ctx.beginPath()
                      ctx.strokeStyle = Qt.hsla(0.6, 0.5, 0.5, 1)
                      ctx.shadowColor = Qt.hsla(0.6, 0.5, 0.5, 1)
                      ctx.shadowBlur = 3
                      ctx.shadowOffsetY = 4

                      ctx.lineWidth = width*0.015
                      ctx.beginPath()
                      ctx.arc(centreX, centreY+height*0.02, (height-24)/2, 5.9, 3.5, true)
                      ctx.stroke()
                      ctx.closePath()

                      //=================================================================
                      ctx.beginPath()
                      ctx.strokeStyle = Qt.hsla(0.6, 0.5, 0.5, 1)
                      ctx.shadowColor = Qt.hsla(0.6, 0.5, 0.5, 1)
                      ctx.shadowBlur = -3;
                      ctx.shadowOffsetY = -4;

                      ctx.lineWidth = width*0.015
                      ctx.beginPath()
                      ctx.arc(centreX, centreY-height*0.02, (height-24)/2, 2.7, 0.40, true)
                      ctx.stroke()
                      ctx.closePath()

                      //=================================================================

                      ctx.lineWidth = width*0.015
                      ctx.beginPath()
                      ctx.moveTo(10,centreY*0.72)
                      ctx.lineTo(centreX*2-10,centreY*0.72)
                      ctx.stroke()
                      ctx.closePath()

                      ctx.lineWidth = width*0.015
                      ctx.beginPath()
                      ctx.beginPath()
                      ctx.strokeStyle = Qt.hsla(0.6, 0.5, 0.5, 1)
                      ctx.shadowColor = Qt.hsla(0.6, 0.5, 0.5, 1)
                      ctx.shadowBlur = 3
                      ctx.shadowOffsetY = 4

                      ctx.moveTo(10,centreY*1.30)
                      ctx.lineTo(centreX*2-10,centreY*1.30)
                      ctx.stroke()
                      ctx.closePath()

                  }
            }
        }


//        // подсветка
//        Rectangle{
//            id: id_light
//            anchors.centerIn: parent
//            height: id_cbox.height*1.0
//            width: height
//            radius: width/2
//            color: "transparent"
////                    border.color: "white"
////                    border.width: width*0.01
//                RadialGradient {
//                    anchors.fill: parent
//                    gradient: Gradient {
//                        GradientStop { position: 0.0; color: colorLight_1 }
//                        GradientStop { position: 0.60; color: colorLight_2 }
//                    }
//                }
//        }

        CounterBoard{
            id: id_counter
            height: id_cbox.width*0.25
            width: height
            x:id_cbox.width*0.03
            y:(id_cbox.height-height)/2


        }

//        ICO_counter_box{
//            id: ico_cbox_flash
//            width: parent.width*0.20
//            height: width
//            anchors.left: parent.left
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: height*0.7
//            anchors.leftMargin: width
//            iid: 1
//        }
//        ICO_counter_box{
//            id: ico_cbox_water
//            width: parent.width*0.20
//            height: width
//            anchors.left: ico_cbox_flash.right
//            anchors.bottom: ico_cbox_flash.bottom
//            iid: 2
//        }


//        Text{
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.top: parent.top
//            anchors.topMargin:  parent.height*0.07
//            color: "gold"
//            font{
//                bold: true
//                pixelSize: parent.height*0.05
//            }
//            text: "dushnila"

//        }



//        Component.onCompleted: {
//        console.log("ivan_dushnila")
//        }


}
