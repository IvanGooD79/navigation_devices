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
    property bool flag_light: true
    property int iid: 2

    Rectangle{
        id:ico_
        x: 0
        y: 0
        width: parent.width
        height: width
        radius: height/2
        //border.width: height*0.01
        border.color: "white"
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
            color: "transparent"
            Canvas {
                    id:canvas_
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();
                        var centreX = width / 2
                        var centreY = height / 2
                        var Top = height*0.1
                        var wid = width*0.75
                        var hei = height*0.75


                        // shadow effect
                        if (flag_light){
                            ctx.shadowColor = iColorLight;
                            ctx.shadowOffsetX = 2;
                            ctx.shadowOffsetY = 1;
                            ctx.shadowBlur = 4;
                        }

                        ctx.beginPath()
                        ctx.strokeStyle = "silver"
                        ctx.lineWidth = width*0.03
                        if (iid == 1)
                        {
                            //flash
                            //==========================
                            ctx.moveTo(centreX+wid*0.20,Top)
                            ctx.lineTo(centreX-wid*0.20,centreY)
                            ctx.lineTo(centreX+wid*0.30,centreY)
                            ctx.lineTo(centreX-wid*0.20,height-Top)
                            ctx.lineTo(centreX+wid*0.10,centreY+hei*0.1)
                            ctx.lineTo(centreX-wid*0.15,centreY+hei*0.1)
                            ctx.moveTo(centreX+wid*0.20,Top)
                            ctx.lineTo(centreX-wid*0.05,centreY-hei*0.05)
                            //===========================
                        }
                        else if (iid == 2)
                        {
                            //water
                            //==========================
                            ctx.moveTo(centreX+wid*0.10,Top)
                            ctx.bezierCurveTo(centreX+wid*0.10,Top,centreX-wid*0.20,Top+hei*0.15, centreX-wid*0.30,Top+hei*0.40)
                            ctx.bezierCurveTo(centreX-wid*0.30,Top+hei*0.40,centreX-wid*0.40,centreY, centreX-wid*0.25,centreY+hei*0.20)
                            ctx.bezierCurveTo(centreX-wid*0.25,centreY+hei*0.20,centreX,centreY+hei*0.50, centreX+wid*0.25,centreY+hei*0.20)
                            ctx.bezierCurveTo(centreX+wid*0.25,centreY+hei*0.20,centreX+wid*0.35,centreY, centreX+wid*0.25,centreY-hei*0.15)
                            ctx.bezierCurveTo(centreX+wid*0.25,centreY-hei*0.15,centreX+wid*0.15,centreY-hei*0.30, centreX-wid*0.05,centreY-hei*0.20)
                            ctx.bezierCurveTo(centreX-wid*0.05,centreY-hei*0.20,centreX-wid*0.05,Top+hei*0.20, centreX+wid*0.10,Top)
                            // H
                            ctx.moveTo(centreX+wid*0.08,centreY)
                            ctx.lineTo(centreX+wid*0.08,centreY+hei*0.2)
                            ctx.moveTo(centreX+wid*0.18,centreY)
                            ctx.lineTo(centreX+wid*0.18,centreY+hei*0.2)
                            ctx.moveTo(centreX+wid*0.08,centreY+hei*0.1)
                            ctx.lineTo(centreX+wid*0.18,centreY+hei*0.1)

                            //===========================
                        }
                        else if (iid == 3)
                        {
                            //water
                            //==========================
                            ctx.moveTo(centreX+wid*0.10,Top)
                            ctx.bezierCurveTo(centreX+wid*0.10,Top,centreX-wid*0.20,Top+hei*0.15, centreX-wid*0.30,Top+hei*0.40)
                            ctx.bezierCurveTo(centreX-wid*0.30,Top+hei*0.40,centreX-wid*0.40,centreY, centreX-wid*0.25,centreY+hei*0.20)
                            ctx.bezierCurveTo(centreX-wid*0.25,centreY+hei*0.20,centreX,centreY+hei*0.50, centreX+wid*0.25,centreY+hei*0.20)
                            ctx.bezierCurveTo(centreX+wid*0.25,centreY+hei*0.20,centreX+wid*0.35,centreY, centreX+wid*0.25,centreY-hei*0.15)
                            ctx.bezierCurveTo(centreX+wid*0.25,centreY-hei*0.15,centreX+wid*0.15,centreY-hei*0.30, centreX-wid*0.05,centreY-hei*0.20)
                            ctx.bezierCurveTo(centreX-wid*0.05,centreY-hei*0.20,centreX-wid*0.05,Top+hei*0.20, centreX+wid*0.10,Top)
                            // C
                            ctx.moveTo(centreX+wid*0.28,Top+hei*0.10)
                            ctx.bezierCurveTo(centreX+wid*0.28,Top+hei*0.10,centreX+wid*0.15,Top+hei*0.10,centreX+wid*0.15,Top+hei*0.20)
                            ctx.bezierCurveTo(centreX+wid*0.15,Top+hei*0.20,centreX+wid*0.15,Top+hei*0.3,centreX+wid*0.28,Top+hei*0.25)

                            //===========================
                        }
                        ctx.stroke()
                        ctx.closePath()
                        }
                    }
        }
    }
}
