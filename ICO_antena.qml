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
                        var Top = height*0.25
                        var wid = width*0.75
                        var hei = wid*0.88


                        // shadow effect
                        if (flag_light){
                            ctx.shadowColor = iColorLight;
                            ctx.shadowOffsetX = 2;
                            ctx.shadowOffsetY = 1;
                            ctx.shadowBlur = 4;
                        }

                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015

                        //==========================
                        ctx.moveTo(centreX+wid*0.10,Top)
                        ctx.lineTo(centreX-wid*0.15,Top-hei*0.14)
                        ctx.moveTo(centreX-wid*0.10,Top-hei*0.10)
                        ctx.lineTo(centreX-wid*0.35,Top+hei*0.60)
                        ctx.moveTo(centreX-wid*0.15,Top+hei*0.70)
                        ctx.lineTo(centreX-wid*0.40,Top+hei*0.56)
                        ctx.moveTo(centreX-wid*0.15,Top+hei*0.70)
                        ctx.lineTo(centreX+wid*0.10,Top)
                        ctx.lineTo(centreX-wid*0.05,Top-hei*0.075)
                        ctx.lineTo(centreX-wid*0.30,Top+hei*0.63)
                        ctx.stroke()
                        ctx.closePath()

                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.015

                        ctx.moveTo(centreX-wid*0.10,Top+hei*0.1)
                        ctx.lineTo(centreX-wid*0.22,Top+hei*0.04)
                        ctx.moveTo(centreX-wid*0.17,Top+hei*0.3)
                        ctx.lineTo(centreX-wid*0.28,Top+hei*0.24)
                        ctx.moveTo(centreX-wid*0.24,Top+hei*0.5)
                        ctx.lineTo(centreX-wid*0.35,Top+hei*0.44)
                        ctx.moveTo(centreX+wid*0.01,Top+hei*0.45)
                        ctx.lineTo(centreX+wid*0.10,Top+hei*0.5)
                        ctx.lineTo(centreX+wid*0.02,Top+hei*0.7)
                        ctx.lineTo(centreX+wid*0.20,Top+hei*0.7)
                        ctx.lineTo(centreX+wid*0.20,Top+hei*0.8)
                        ctx.lineTo(centreX-wid*0.20,Top+hei*0.8)


//                        ctx.moveTo(centreX-wid*0.45,Top)
//                        ctx.bezierCurveTo(centreX-wid*0.45,Top,centreX-wid*0.50,Top+hei*0.05, centreX-wid*0.50,Top+hei*0.1)
//                        ctx.moveTo(centreX-wid*0.50,Top+hei*0.1)
//                        ctx.bezierCurveTo(centreX-wid*0.50,Top+wid*0.1,centreX-wid*0.55,Top+hei*0.40, centreX-wid*0.50,Top+hei*0.8)

                        ctx.stroke()
                    }
            }

        }

    }
}
