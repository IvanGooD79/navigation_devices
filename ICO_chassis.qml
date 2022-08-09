import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id:root
    property alias xpos: ico_.x
    property alias ypos: ico_.y
    property alias size: ico_.width
    property color iColor: "#ff00ffff"
    property color iColorCenter: "black"
    property color iColorLight: "#ff00ff00"
    property bool flag_light: false

    property int whl1: 0
    property int whl2: 0
    property int whl3: 0
    property int whl4: 0

    Rectangle{
        id:ico_
        x: 0
        y: 0
        width: parent.width
        height: width
        radius: height/2

//        border.width: height*0.01
//        border.color: "white"
        color: "transparent"

//        NumberAnimation on rotation {
//            from: 1
//            to: -360
//            duration: 1000
//            loops: Animation.Infinite  // или число циклов
//            easing.type: Easing.Linear
//        }

        Rectangle{
            anchors.centerIn: parent
            width: parent.width*0.75
            height: width
            radius: height/2
//            border.width: height*0.01
//            border.color: iColor
            color: "transparent"
            Canvas {
                    id:canvas_
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();
                        var centreX = width / 2;
                        var centreY = height / 2;
                        var Top = height*0.15
                        var wid = width*0.60
                        var hei = wid*0.95


                        // shadow effect
                        if (flag_light){
                            ctx.shadowColor = iColorLight;
                            ctx.shadowOffsetX = 2;
                            ctx.shadowOffsetY = 1;
                            ctx.shadowBlur = 4;
                        }

                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015
                        ctx.beginPath()
                        ctx.fillStyle   = "silver"



                        // wheel up
                        ctx.beginPath()
                        if (whl1 == 0 ) ctx.fillStyle   = "#ff555555"; else if (whl1 == 1)  ctx.fillStyle   = Qt.hsla(0.9, 0.5, 0.5, 1); else ctx.fillStyle   = Qt.hsla(0.6, 0.5, 0.5, 1);
                        ctx.roundedRect(centreX-wid*0.40,Top+hei*0.10, wid*0.15, hei*0.3, wid*0.03,hei*0.03)
                        ctx.stroke()
                        ctx.fill()
                        ctx.closePath()
                        ctx.beginPath()
                        if (whl2 == 0 ) ctx.fillStyle   = "#ff555555"; else if (whl2 == 1)  ctx.fillStyle   = Qt.hsla(0.9, 0.5, 0.5, 1); else ctx.fillStyle   = Qt.hsla(0.6, 0.5, 0.5, 1);
                        ctx.roundedRect(centreX+wid*0.25,Top+hei*0.10, wid*0.15, hei*0.3, wid*0.03,hei*0.03)
                        ctx.stroke()
                        ctx.fill()
                        ctx.closePath()
                        // wheel down
                        ctx.beginPath()
                        if (whl3 == 0 ) ctx.fillStyle   = "#ff555555"; else if (whl3 == 1)  ctx.fillStyle   = Qt.hsla(0.9, 0.5, 0.5, 1); else ctx.fillStyle   = Qt.hsla(0.6, 0.5, 0.5, 1);
                        ctx.roundedRect(centreX-wid*0.40,Top+hei*0.85, wid*0.15, hei*0.3, wid*0.03,hei*0.03)
                        ctx.stroke()
                        ctx.fill()
                        ctx.closePath()
                        ctx.beginPath()
                        if (whl4 == 0 ) ctx.fillStyle   = "#ff555555"; else if (whl4 == 1)  ctx.fillStyle   = Qt.hsla(0.9, 0.5, 0.5, 1); else ctx.fillStyle   = Qt.hsla(0.6, 0.5, 0.5, 1);
                        ctx.roundedRect(centreX+wid*0.25,Top+hei*0.85, wid*0.15, hei*0.3, wid*0.03,hei*0.03)
                        ctx.stroke()
                        ctx.fill()
                        ctx.closePath()

                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015
                        //
                        ctx.moveTo(centreX-wid*0.25,Top+hei*0.20)
                        ctx.lineTo(centreX+wid*0.25,Top+hei*0.20)

                        ctx.moveTo(centreX-wid*0.25,Top+hei*0.30)
                        ctx.bezierCurveTo(centreX-wid*0.25,Top+hei*0.30,centreX-wid*0.05,Top+hei*0.30, centreX-wid*0.05,Top+hei*0.40)
                        ctx.moveTo(centreX+wid*0.25,Top+hei*0.30)
                        ctx.bezierCurveTo(centreX+wid*0.25,Top+hei*0.30,centreX+wid*0.05,Top+hei*0.30, centreX+wid*0.05,Top+hei*0.40)

                        ctx.moveTo(centreX-wid*0.05,Top+hei*0.40)
                        ctx.bezierCurveTo(centreX-wid*0.05,Top+hei*0.40,centreX-wid*0.05,Top+hei*0.40, centreX-wid*0.05,Top+hei*0.60)
                        ctx.moveTo(centreX+wid*0.05,Top+hei*0.40)
                        ctx.bezierCurveTo(centreX+wid*0.05,Top+hei*0.40,centreX+wid*0.05,Top+hei*0.40, centreX+wid*0.05,Top+hei*0.60)

                        ctx.moveTo(centreX-wid*0.05,Top+hei*0.60)
                        ctx.bezierCurveTo(centreX-wid*0.05,Top+hei*0.60,centreX-wid*0.15,Top+hei*0.70, centreX-wid*0.05,Top+hei*0.80)
                        ctx.moveTo(centreX+wid*0.05,Top+hei*0.60)
                        ctx.bezierCurveTo(centreX+wid*0.05,Top+hei*0.60,centreX+wid*0.15,Top+hei*0.70, centreX+wid*0.05,Top+hei*0.80)

                        ctx.moveTo(centreX-wid*0.05,Top+hei*0.80)
                        ctx.lineTo(centreX-wid*0.05,Top+hei*0.90)
                        ctx.moveTo(centreX+wid*0.05,Top+hei*0.80)
                        ctx.lineTo(centreX+wid*0.05,Top+hei*0.90)

                        ctx.moveTo(centreX-wid*0.05,Top+hei*0.90)
                        ctx.bezierCurveTo(centreX-wid*0.05,Top+hei*0.90,centreX-wid*0.05,Top+hei*0.95, centreX-wid*0.25,Top+hei*0.95)
                        ctx.moveTo(centreX+wid*0.05,Top+hei*0.90)
                        ctx.bezierCurveTo(centreX+wid*0.05,Top+hei*0.90,centreX+wid*0.05,Top+hei*0.95, centreX+wid*0.25,Top+hei*0.95)

                        ctx.moveTo(centreX-wid*0.25,Top+hei*1.05)
                        ctx.lineTo(centreX+wid*0.25,Top+hei*1.05)
                        ctx.stroke()
                        ctx.closePath()
                    }
            }
        }
    }
}
