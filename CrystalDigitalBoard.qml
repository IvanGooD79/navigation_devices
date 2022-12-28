import QtQuick 2.0

Item {
    id:root
    property alias xpos: crdBoard.x
    property alias ypos: crdBoard.y
    property color iColorCenter: "transparent"
    property color iColorPaint: "#ff00ffff"
    property color iColorline:  "#ff005c5c"
    property int count: 4
    property var arr:  [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]

    Rectangle{
        id: crdBoard
        x: 0
        y: 0
        height: parent.height
        width: parent.width
        color: iColorCenter

//        border.width: height*0.01
//        border.color: "gold"

        Repeater{
            model: root.count
            SevenDigital{
                height: parent.height*0.9
                width: height*0.6
                dig: arr[index]
                y: (parent.height-height)/2
                x: index*width
            }
        }
    }


}
