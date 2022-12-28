import QtQuick 2.0

Item {
    id:root
    property alias xpos: crystal.x
    property alias ypos: crystal.y
    property alias size: crystal.width
    property color iColorCenter: "transparent"
    property color iColorPaint: "#ff00ffff"
    property color iColorline:  "#ff005c5c"
    property bool light: false

    function rePaint()
    {
        cry_paint.requestPaint()
    }

    Rectangle{
        id: crystal
        x: 0
        y: 0
        height: parent.height
        width: height*0.30
        color:  iColorCenter

//        border.width: height*0.01
//        border.color: "gold"

        Canvas{
        id: cry_paint
        anchors.fill: parent
            onPaint: {
            var ctx = getContext("2d")
                ctx.reset()
            var centreX = width / 2
            var centreY = height / 2
            var Top = height*0.10

                if (light) ctx.fillStyle = iColorPaint
                ctx.strokeStyle = iColorline
                ctx.lineWidth = height*0.03
                ctx.beginPath()
                ctx.moveTo(centreX, Top)
                ctx.lineTo(centreX-height*0.10, Top+height*0.10)
                ctx.lineTo(centreX-height*0.10, Top+height*0.70)
                ctx.lineTo(centreX, Top+height*0.80)
                ctx.lineTo(centreX+height*0.10, Top+height*0.70)
                ctx.lineTo(centreX+height*0.10, Top+height*0.10)
                ctx.lineTo(centreX, Top)
                ctx.fill()
                ctx.stroke()
                ctx.closePath()

            }
        }


    }
}
