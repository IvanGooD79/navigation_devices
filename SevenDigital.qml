import QtQuick 2.0

Item {
    id:root
    property alias xpos: seven_dig.x
    property alias ypos: seven_dig.y
    property alias size: seven_dig.width
    property color iColorCenter: "transparent"
    property color iColorPaint: "#ff00ffff"
    property color iColorline:  "#ff005c5c"
    property int dig: -1

    function fDigit()
    {
        if (dig === 0)
        {
            id_c1.light = true; id_c1.rePaint()
            id_c2.light = true; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = true;  id_c4.rePaint()
            id_c5.light = true;  id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = false; id_c7.rePaint()
        }
        else if (dig === 1)
        {
            id_c1.light = false; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = false; id_c3.rePaint()
            id_c4.light = true;  id_c4.rePaint()
            id_c5.light = true;  id_c5.rePaint()
            id_c6.light = false; id_c6.rePaint()
            id_c7.light = false; id_c7.rePaint()
        }
        else if (dig === 2)
        {
            id_c1.light = false; id_c1.rePaint()
            id_c2.light = true; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = false; id_c4.rePaint()
            id_c5.light = true; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else if (dig === 3)
        {
            id_c1.light = false; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = true; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else if (dig === 4)
        {
            id_c1.light = true; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = false; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = true; id_c5.rePaint()
            id_c6.light = false; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else if (dig === 5)
        {
            id_c1.light = true; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = false; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else if (dig === 6)
        {
            id_c1.light = true; id_c1.rePaint()
            id_c2.light = true; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = false; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else if (dig === 7)
        {
            id_c1.light = false; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = false; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = true; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = false; id_c7.rePaint()
        }
        else if (dig === 8)
        {
            id_c1.light = true; id_c1.rePaint()
            id_c2.light = true; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = true; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else if (dig === 9)
        {
            id_c1.light = true; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = true; id_c3.rePaint()
            id_c4.light = true; id_c4.rePaint()
            id_c5.light = true; id_c5.rePaint()
            id_c6.light = true; id_c6.rePaint()
            id_c7.light = true; id_c7.rePaint()
        }
        else {
            id_c1.light = false; id_c1.rePaint()
            id_c2.light = false; id_c2.rePaint()
            id_c3.light = false; id_c3.rePaint()
            id_c4.light = false; id_c4.rePaint()
            id_c5.light = false; id_c5.rePaint()
            id_c6.light = false; id_c6.rePaint()
            id_c7.light = false; id_c7.rePaint()
        }
    }

    Rectangle{
        id: seven_dig
        x: 0
        y: 0
        height: parent.height
        width: parent.width
        color: iColorCenter

//        border.width: height*0.01
//        border.color: "gold"

        Crystal{
            id: id_c1
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            x: parent.width*0.05
            y: parent.height*0.1
        }
        Crystal{
            id: id_c2
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            anchors.left: id_c1.left
            anchors.top: id_c1.bottom
            anchors.topMargin: -height*0.2
        }
        Crystal{
            id: id_c3
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            rotation: 90
            anchors.left: id_c2.left
            anchors.top: id_c2.bottom
            anchors.topMargin: -height*0.75
            anchors.leftMargin: height*0.6
        }
        Crystal{
            id: id_c4
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            anchors.left: id_c2.left
            anchors.top: id_c2.top
            anchors.leftMargin: height*0.9
        }
        Crystal{
            id: id_c5
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            anchors.left: id_c1.left
            anchors.top: id_c1.top
            anchors.leftMargin: height*0.9
        }
        Crystal{
            id: id_c6
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            rotation: 90
            anchors.left: id_c1.left
            anchors.top: id_c1.top
            anchors.topMargin: -height*0.55
            anchors.leftMargin: height*0.6
        }
        Crystal{
            id: id_c7
            height: parent.height*0.45
            iColorPaint: defaultColorTxtNum
            light: true
            rotation: 90
            anchors.left: id_c1.left
            anchors.top: id_c1.top
            anchors.topMargin: height*0.25
            anchors.leftMargin: height*0.6
        }

        Timer {
               interval: 1000; running: true; repeat: true
               onTriggered: {
                    fDigit()
               }
          }
    }
}
