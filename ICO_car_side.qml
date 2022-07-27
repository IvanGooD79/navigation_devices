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
            width: parent.width*0.80
            height: width
            radius: height/2
//            border.width: height*0.02
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
                        var Top = height*0.1
                        var wid = width*0.65
                        var hei = wid*0.88


                        // shadow effect
                        if (flag_light){
                            ctx.shadowColor = iColorLight;
                            ctx.shadowOffsetX = 3;
                            ctx.shadowOffsetY = 1;
                            ctx.shadowBlur = 4;
                        }

                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015

                        // cabin
                        ctx.moveTo(centreX,Top)
                        ctx.bezierCurveTo(centreX,Top,centreX-wid*0.45,Top, centreX-wid*0.45,Top)
                        ctx.moveTo(centreX-wid*0.45,Top)
                        ctx.bezierCurveTo(centreX-wid*0.45,Top,centreX-wid*0.50,Top+hei*0.05, centreX-wid*0.50,Top+hei*0.1)

                        ctx.moveTo(centreX,Top)
                        ctx.bezierCurveTo(centreX,Top,centreX+wid*0.30,Top, centreX+wid*0.30,Top)
                        ctx.moveTo(centreX+wid*0.30,Top)
                        ctx.bezierCurveTo(centreX+wid*0.30,Top,centreX+wid*0.40,Top+hei*0.05, centreX+wid*0.40,Top+hei*0.1)
                        ctx.moveTo(centreX+wid*0.40,Top+hei*0.1)
                        ctx.bezierCurveTo(centreX+wid*0.40,Top+hei*0.1,centreX+wid*0.45,Top+hei*0.1, centreX+wid*0.45,Top+hei*1.3)
                        ctx.moveTo(centreX+wid*0.45,Top+hei*1.3)
                        ctx.bezierCurveTo(centreX+wid*0.45,Top+hei*1.3,centreX+wid*0.45,Top+hei*1.3, centreX+wid*0.33,Top+hei*1.3)

                        ctx.moveTo(centreX-wid*0.50,Top+hei*0.1)
                        ctx.bezierCurveTo(centreX-wid*0.50,Top+wid*0.1,centreX-wid*0.55,Top+hei*0.30, centreX-wid*0.55,Top+hei*0.35)
                        ctx.moveTo(centreX-wid*0.50,Top+hei*0.33)
                        ctx.bezierCurveTo(centreX-wid*0.50,Top+hei*0.33,centreX-wid*0.60,Top+hei*0.35, centreX-wid*0.60,Top+hei*0.35)
                        ctx.moveTo(centreX-wid*0.60,Top+hei*0.35)
                        ctx.bezierCurveTo(centreX-wid*0.60,Top+hei*0.35,centreX-wid*0.63,Top+hei*0.70, centreX-wid*0.63,Top+hei*0.85)
                        ctx.moveTo(centreX-wid*0.63,Top+hei*0.85)
                        ctx.bezierCurveTo(centreX-wid*0.63,Top+hei*0.85,centreX-wid*0.63,Top+hei*0.85, centreX-wid*0.50,Top+hei*0.88)
                        ctx.moveTo(centreX-wid*0.60,Top+hei*0.85)
                        ctx.bezierCurveTo(centreX-wid*0.60,Top+hei*0.85,centreX-wid*0.60,Top+hei*0.85, centreX-wid*0.60,Top+hei*1.0)
                        ctx.moveTo(centreX-wid*0.60,Top+hei*1.17)
                        ctx.bezierCurveTo(centreX-wid*0.60,Top+hei*1.17,centreX-wid*0.45,Top+hei*1.30, centreX-wid*0.45,Top+hei*1.30)
                        ctx.moveTo(centreX-wid*0.45,Top+hei*1.30)
                        ctx.bezierCurveTo(centreX-wid*0.45,Top+hei*1.30,centreX-wid*0.25,Top+hei*1.30, centreX-wid*0.25,Top+hei*1.30)
                        // loke
                        ctx.roundedRect(centreX-wid*0.35,Top-hei*0.08, wid*0.30, hei*0.08, wid*0.02,hei*0.02)
                        //
                        ctx.roundedRect(centreX-wid*0.65,Top+hei*1.0, wid*0.20, hei*0.15, wid*0.02,hei*0.02)
                        //door
                        ctx.moveTo(centreX,Top+hei*0.2)
                        ctx.bezierCurveTo(centreX,Top+hei*0.2,centreX-wid*0.25,Top+hei*0.2, centreX-wid*0.25,Top+hei*0.2)
                        ctx.moveTo(centreX-wid*0.25,Top+hei*0.2)
                        ctx.bezierCurveTo(centreX-wid*0.25,Top+hei*0.2,centreX-wid*0.30,Top+hei*0.25, centreX-wid*0.30,Top+hei*0.30)
                        ctx.moveTo(centreX-wid*0.30,Top+hei*0.30)
                        ctx.bezierCurveTo(centreX-wid*0.30,Top+hei*0.30,centreX-wid*0.35,Top+hei*0.50, centreX-wid*0.35,Top+hei*0.50)
                        ctx.moveTo(centreX-wid*0.35,Top+hei*0.50)
                        ctx.bezierCurveTo(centreX-wid*0.35,Top+hei*0.50,centreX-wid*0.35,Top+hei*0.50, centreX-wid*0.35,Top+hei*0.85)
                        ctx.moveTo(centreX-wid*0.35,Top+hei*0.85)
                        ctx.bezierCurveTo(centreX-wid*0.35,Top+hei*0.85,centreX-wid*0.25,Top+hei*0.95, centreX-wid*0.25,Top+hei*0.95)
                        ctx.moveTo(centreX-wid*0.25,Top+hei*0.95)
                        ctx.bezierCurveTo(centreX-wid*0.25,Top+hei*0.95,centreX-wid*0.20,Top+hei*0.95, centreX-wid*0.20,Top+hei*0.95)

                        ctx.moveTo(centreX,Top+hei*0.2)
                        ctx.bezierCurveTo(centreX,Top+hei*0.2,centreX+wid*0.15,Top+hei*0.2, centreX+wid*0.15,Top+hei*0.2)
                        ctx.moveTo(centreX+wid*0.15,Top+hei*0.2)
                        ctx.bezierCurveTo(centreX+wid*0.15,Top+hei*0.2,centreX+wid*0.15,Top+hei*0.85, centreX+wid*0.15,Top+hei*0.85)

                        ctx.moveTo(centreX-wid*0.35,Top+hei*0.50)
                        ctx.lineTo(centreX+wid*0.15,Top+hei*0.50)

                        ctx.roundedRect(centreX-wid*0.20,Top+hei*0.60, wid*0.15, hei*0.05, wid*0.01,hei*0.01)
                        //mirror
                        ctx.roundedRect(centreX-wid*0.45,Top+hei*0.20, wid*0.06, hei*0.3, wid*0.01,hei*0.01)

                        //
                        ctx.moveTo(centreX+wid*0.40,Top+hei*1.30)
                        ctx.lineTo(centreX+wid*1.50,Top+hei*1.30)
                        ctx.moveTo(centreX+wid*0.45,Top+hei*1.15)
                        ctx.lineTo(centreX+wid*1.60,Top+hei*1.15)

                        ctx.stroke()
                        ctx.closePath()

                        // arch
                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015
                        ctx.arc(centreX+hei*0.05,Top+hei*1.24, wid*0.30, Math.PI-0.2,  2*Math.PI+0.2, false)
                        ctx.stroke()
                        ctx.closePath()

                        // arch door
                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015
                        ctx.arc(centreX+hei*0.04,Top+hei*1.15, wid*0.30, Math.PI+0.6,  2*Math.PI-1.2, false)
                        ctx.stroke()
                        ctx.closePath()

                        // wheel
                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015
                        ctx.arc(centreX+hei*0.05,Top+hei*1.25, wid*0.27, 0,  2*Math.PI, false)
                        ctx.stroke()
                        ctx.closePath()

                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015
                        ctx.arc(centreX+hei*0.05,Top+hei*1.25, wid*0.12, 0,  2*Math.PI, false)
                        ctx.stroke()
                        ctx.closePath()

                        ctx.stroke()
                    }
            }
        }
    }
}
