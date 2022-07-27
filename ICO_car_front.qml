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
            width: parent.width*0.75
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
                        var Top = height*0.10
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

                        // cabin
                        ctx.moveTo(centreX,Top)
                        ctx.bezierCurveTo(centreX,Top,centreX-wid*0.45,Top, centreX-wid*0.45,Top)
                        ctx.moveTo(centreX-wid*0.45,Top)
                        ctx.bezierCurveTo(centreX-wid*0.45,Top,centreX-wid*0.50,Top+hei*0.05, centreX-wid*0.50,Top+hei*0.1)
                        ctx.moveTo(centreX-wid*0.50,Top+hei*0.1)
                        ctx.bezierCurveTo(centreX-wid*0.50,Top+wid*0.1,centreX-wid*0.55,Top+hei*0.40, centreX-wid*0.50,Top+hei*0.8)

                        ctx.moveTo(centreX,Top)
                        ctx.bezierCurveTo(centreX,Top,centreX+wid*0.45,Top, centreX+wid*0.45,Top)
                        ctx.moveTo(centreX+wid*0.45,Top)
                        ctx.bezierCurveTo(centreX+wid*0.45,Top,centreX+wid*0.50,Top+hei*0.05, centreX+wid*0.50,Top+hei*0.1)
                        ctx.moveTo(centreX+wid*0.50,Top+hei*0.1)
                        ctx.bezierCurveTo(centreX+wid*0.50,Top+wid*0.1,centreX+wid*0.55,Top+hei*0.40, centreX+wid*0.50,Top+hei*0.8)

                        // wheel
                        ctx.moveTo(centreX-wid*0.48,Top+hei*0.8)
                        ctx.bezierCurveTo(centreX-wid*0.48,Top+hei*0.8,centreX-wid*0.50,Top+hei*0.80, centreX-wid*0.50,Top+hei*0.80)
                        ctx.moveTo(centreX-wid*0.50,Top+hei*0.80)
                        ctx.bezierCurveTo(centreX-wid*0.50,Top+hei*0.80,centreX-wid*0.55,Top+hei*0.80, centreX-wid*0.55,Top+hei*0.85)
                        ctx.moveTo(centreX-wid*0.55,Top+hei*0.85)
                        ctx.bezierCurveTo(centreX-wid*0.55,Top+hei*0.85,centreX-wid*0.55,Top+hei*1.2, centreX-wid*0.55,Top+hei*1.2)
                        ctx.moveTo(centreX-wid*0.55,Top+hei*1.2)
                        ctx.bezierCurveTo(centreX-wid*0.55,Top+hei*1.2,centreX-wid*0.53,Top+hei*1.22, centreX-wid*0.50,Top+hei*1.22)
                        ctx.moveTo(centreX-wid*0.50,Top+hei*1.22)
                        ctx.bezierCurveTo(centreX-wid*0.50,Top+hei*1.22,centreX-wid*0.30,Top+hei*1.22, centreX-wid*0.30,Top+hei*1.22)
                        ctx.moveTo(centreX-wid*0.30,Top+hei*1.22)
                        ctx.bezierCurveTo(centreX-wid*0.30,Top+hei*1.22,centreX-wid*0.29,Top+hei*1.17, centreX-wid*0.29,Top+hei*1.17)
                        ctx.moveTo(centreX-wid*0.29,Top+hei*1.17)
                        ctx.bezierCurveTo(centreX-wid*0.29,Top+hei*1.17,centreX-wid*0.29,Top+hei*0.95, centreX-wid*0.29,Top+hei*0.95)
                        // wheel
                        ctx.moveTo(centreX+wid*0.48,Top+hei*0.8)
                        ctx.bezierCurveTo(centreX+wid*0.48,Top+hei*0.8,centreX+wid*0.50,Top+hei*0.80, centreX+wid*0.50,Top+hei*0.80)
                        ctx.moveTo(centreX+wid*0.50,Top+hei*0.80)
                        ctx.bezierCurveTo(centreX+wid*0.50,Top+hei*0.80,centreX+wid*0.55,Top+hei*0.80, centreX+wid*0.55,Top+hei*0.85)
                        ctx.moveTo(centreX+wid*0.55,Top+hei*0.85)
                        ctx.bezierCurveTo(centreX+wid*0.55,Top+hei*0.85,centreX+wid*0.55,Top+hei*1.2, centreX+wid*0.55,Top+hei*1.2)
                        ctx.moveTo(centreX+wid*0.55,Top+hei*1.2)
                        ctx.bezierCurveTo(centreX+wid*0.55,Top+hei*1.2,centreX+wid*0.53,Top+hei*1.22, centreX+wid*0.50,Top+hei*1.22)
                        ctx.moveTo(centreX+wid*0.50,Top+hei*1.22)
                        ctx.bezierCurveTo(centreX+wid*0.50,Top+hei*1.22,centreX+wid*0.30,Top+hei*1.22, centreX+wid*0.30,Top+hei*1.22)
                        ctx.moveTo(centreX+wid*0.30,Top+hei*1.22)
                        ctx.bezierCurveTo(centreX+wid*0.30,Top+hei*1.22,centreX+wid*0.29,Top+hei*1.17, centreX+wid*0.29,Top+hei*1.17)
                        ctx.moveTo(centreX+wid*0.29,Top+hei*1.17)
                        ctx.bezierCurveTo(centreX+wid*0.29,Top+hei*1.17,centreX+wid*0.29,Top+hei*0.95, centreX+wid*0.29,Top+hei*0.95)

                        //loke
                        ctx.roundedRect(centreX-wid*0.40,Top-hei*0.05, wid*0.35, hei*0.05, wid*0.03,hei*0.03)
                        ctx.roundedRect(centreX+wid*0.05,Top-hei*0.05, wid*0.35, hei*0.05, wid*0.03,hei*0.03)

                        //mirror
                        ctx.roundedRect(centreX-wid*0.65,Top+hei*0.20, wid*0.1, hei*0.3, wid*0.03,hei*0.03)
                        ctx.roundedRect(centreX+wid*0.55,Top+hei*0.20, wid*0.1, hei*0.3, wid*0.03,hei*0.03)

                        // window
                        ctx.roundedRect(centreX-wid*0.45,Top*1.4, wid*0.90, hei*0.30, wid*0.03,hei*0.06)
                        ctx.moveTo(centreX-wid*0.02,Top*1.4)
                        ctx.lineTo(centreX-wid*0.02,Top*1.4+hei*0.30)
                        ctx.moveTo(centreX+wid*0.02,Top*1.4)
                        ctx.lineTo(centreX+wid*0.02,Top*1.4+hei*0.30)

                        ctx.moveTo(centreX-wid*0.08,Top*1.4+hei*0.30)
                        ctx.lineTo(centreX-wid*0.15,Top*1.4+hei*0.20)
                        ctx.moveTo(centreX-wid*0.30,Top*1.4+hei*0.20)
                        ctx.lineTo(centreX-wid*0.07,Top*1.4+hei*0.20)

                        ctx.moveTo(centreX+wid*0.38,Top*1.4+hei*0.30)
                        ctx.lineTo(centreX+wid*0.28,Top*1.4+hei*0.20)
                        ctx.moveTo(centreX+wid*0.15,Top*1.4+hei*0.20)
                        ctx.lineTo(centreX+wid*0.41,Top*1.4+hei*0.20)

                        //
                        ctx.moveTo(centreX-wid*0.48,Top+hei*0.50)
                        ctx.lineTo(centreX+wid*0.48,Top+hei*0.50)

                        ctx.roundedRect(centreX-wid*0.42,Top+hei*0.57, wid*0.15, hei*0.15, wid*0.07,hei*0.07)
                        ctx.roundedRect(centreX-wid*0.38,Top+hei*0.61, wid*0.07, hei*0.07, wid*0.07,hei*0.07)
                        ctx.roundedRect(centreX+wid*0.27,Top+hei*0.57, wid*0.15, hei*0.15, wid*0.07,hei*0.07)
                        ctx.roundedRect(centreX+wid*0.31,Top+hei*0.61, wid*0.07, hei*0.07, wid*0.07,hei*0.07)
                        ctx.rect(centreX-wid*0.51,Top+hei*0.63, wid*0.05, hei*0.1);
                        ctx.rect(centreX+wid*0.46,Top+hei*0.63, wid*0.05, hei*0.1);

                        ctx.rect(centreX-wid*0.20,Top+hei*0.60, wid*0.40, hei*0.12);
//                        ctx.moveTo(centreX-wid*0.20,Top+hei*0.60)
//                        ctx.lineTo(centreX+wid*0.20,Top+hei*0.60)
                        ctx.moveTo(centreX-wid*0.20,Top+hei*0.63)
                        ctx.lineTo(centreX+wid*0.20,Top+hei*0.63)
                        ctx.moveTo(centreX-wid*0.20,Top+hei*0.66)
                        ctx.lineTo(centreX+wid*0.20,Top+hei*0.66)
                        ctx.moveTo(centreX-wid*0.20,Top+hei*0.69)
                        ctx.lineTo(centreX+wid*0.20,Top+hei*0.69)

                        ctx.rect(centreX-wid*0.48,Top+hei*0.8, wid*0.96, hei*0.05);
                        ctx.roundedRect(centreX-wid/2,Top+hei*0.85, wid, hei*0.1, wid*0.02,hei*0.02)

                        ctx.moveTo(centreX-wid*0.25,Top+hei*0.95)
                        ctx.lineTo(centreX-wid*0.20,Top+hei*1.05)
                        ctx.moveTo(centreX+wid*0.25,Top+hei*0.95)
                        ctx.lineTo(centreX+wid*0.20,Top+hei*1.05)
                        ctx.lineTo(centreX-wid*0.20,Top+hei*1.05)

                        ctx.stroke()
                    }
            }
        }
    }
}
