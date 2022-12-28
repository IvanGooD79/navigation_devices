import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id:root
    property real  side: Math.min(width,height)
    property alias xpos: id_body_counter.x
    property alias ypos: id_body_counter.y
    property real rectS: side*0.25
    property color discColor_1: "#f00080aa"
    property color discColor_2: "#f0aa0000"
    property var arr:  []
    property int corrInd: 3

    readonly property color defaultColorBorder:  "#cc959595"//"gold" // "silver"

    property bool flag_1: true
    property bool flag_2: false
    property bool flag_3: false
    property bool flag_4: false
    property bool flag_5: false

    property bool fRes1: false
    property bool fRes2: false
    property bool fRes3: false
    property bool fRes4: false
    property bool fRes5: false

    function wrConsol()
    {
      var str ="";
        for(var i =0; i < arr.length; i++)
            str +=arr[i]
        console.log(str)
    }

    Rectangle{
        id: id_body_counter
        height: side
        width: height*3.75
        color: "transparent"
        border{
//            width: height*0.01
//            color: "white"
        }

        ListModel{
        id: nameModel
            ListElement{name: "0" ; color: "transparent"}
            ListElement{name: "9" ; color: "transparent"}
            ListElement{name: "8" ; color: "transparent"}
            ListElement{name: "7" ; color: "transparent"}
            ListElement{name: "6" ; color: "transparent"}
            ListElement{name: "5" ; color: "transparent"}
            ListElement{name: "4" ; color: "transparent"}
            ListElement{name: "3" ; color: "transparent"}
            ListElement{name: "2" ; color: "transparent"}
            ListElement{name: "1" ; color: "transparent"}
        }

        Component{
        id: nameDelegate
            Column{
                    Rectangle{
                        id: id_rect
                        width: rectS; height: rectS; color: model.color
                        Text{anchors.centerIn: parent; text:model.name; font.bold: true; font.pixelSize: parent.height*0.9; color: "white"}

                        // рисуем маленькие риски
                        Repeater{
                            model: 12
                                Rectangle{
                                    width : id_rect.width*0.2
                                    height:  width*0.15
                                    color: "white"
                                    y: index * height*2.85
                                    antialiasing: true
                                    //anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.left: id_rect.left
                                    anchors.leftMargin: -parent.width*0.45
                                }
                        }

                        // рисуем маленькие риски
                        Repeater{
                            model: 12
                                Rectangle{
                                    width : id_rect.width*0.2
                                    height:  width*0.15
                                    color: "white"
                                    y: index * height*2.85
                                    antialiasing: true
                                    //anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.right: id_rect.right
                                    anchors.rightMargin: -parent.width*0.35
                                }
                        }
                    }
            }
        }

        Repeater{
            model: 7
            Rectangle{
                width: parent.width*0.12
                height: parent.height
                color: index < 6 ? discColor_1 : discColor_2
                border{
                    width: height*0.02
                    color: defaultColorBorder
                }
                x:width*index+(index*6)
                onWidthChanged:  arr[index]=0

                PathView{
                    id: viewpath
                    anchors.fill: parent
                    model: nameModel
                    delegate: nameDelegate
                    focus: true
                    pathItemCount: 3
                    interactive: true
                    preferredHighlightBegin: 0.5
                    preferredHighlightEnd: 0.5
                    highlightRangeMode: PathView.StrictlyEnforceRange
                    onMovingChanged: if (currentIndex > 0) {arr[index] = 10-currentIndex; wrConsol();} else {arr[index] = 0; wrConsol();}

                    path: Path{
                        id:id_path
                        startX: rectS; startY: rectS/2
                            PathLine { x: rectS; relativeY: height*0.77; }
                    }

                    Timer{
                        id:timer
                        interval: 100; running: true; repeat: true
                        onTriggered: {
                            if (viewpath.currentIndex > 0) {arr[index] = 10-viewpath.currentIndex; wrConsol();} else {arr[index] = 0; wrConsol();}
                            if (arr[corrInd-1] === 9 && arr[0+corrInd] === 9 && arr[1+corrInd] === 9 && arr[2+corrInd] === 9 && arr[3+corrInd] === 9) {/*running = false;*/ console.log("counter stop")}
                            else{
                                if (index === 3+corrInd) {
                                    if (fRes1){viewpath.decrementCurrentIndex(); fRes1 = false;}
                                    else {
                                        interval = 100;
                                        if (flag_1 && arr[3+corrInd] !== 9) {viewpath.decrementCurrentIndex();}
                                        else {
                                            if (arr[2+corrInd] !== 9) flag_2 = true;
                                            else {
                                                if (arr[1+corrInd] !== 9) flag_3 = true;
                                                else{
                                                    if (arr[0+corrInd] !== 9) flag_4 = true;
                                                    else flag_5 = true;
                                                }

                                            }

                                            flag_1 = false; interval = 30;
                                        }
                                    }
                                }
                                if (index === 2+corrInd) {
                                    if (fRes2){viewpath.decrementCurrentIndex(); fRes2 = false;}
                                    else {
                                        if (flag_2 && arr[2+corrInd] !== 9) {
                                            viewpath.decrementCurrentIndex();
                                            flag_1 = true;
                                            flag_2 = false;
                                            fRes1 = true;
                                        } else { }
                                    }
                                }
                                if (index === 1+corrInd) {
                                    if (fRes3){viewpath.decrementCurrentIndex(); fRes3 = false;}
                                    else {
                                        if (flag_3 && arr[1+corrInd] !== 9) {
                                            viewpath.decrementCurrentIndex();
                                            flag_1 = true;
                                            flag_2 = false;
                                            flag_3 = false;
                                            fRes1 = true;
                                            fRes2 = true;
                                        } else { }
                                    }
                                }
                                if (index === 0+corrInd) {
                                    if (fRes4){viewpath.decrementCurrentIndex(); fRes4 = false;}
                                    else {
                                        if (flag_4 && arr[0+corrInd] !== 9) {
                                            viewpath.decrementCurrentIndex();
                                            flag_1 = true;
                                            flag_2 = false;
                                            flag_3 = false;
                                            flag_4 = false;
                                            fRes1 = true;
                                            fRes2 = true;
                                            fRes3 = true;
                                        } else { }
                                    }
                                }
                                if (index === corrInd-1) {
                                    if (fRes5){viewpath.decrementCurrentIndex(); fRes5 = false;}
                                    else {
                                        if (flag_5 && arr[corrInd-1] !== 9) {
                                            viewpath.decrementCurrentIndex();
                                            flag_1 = true;
                                            flag_2 = false;
                                            flag_3 = false;
                                            flag_4 = false;
                                            flag_5 = false;
                                            fRes1 = true;
                                            fRes2 = true;
                                            fRes3 = true;
                                            fRes4 = true;
                                        } else { }
                                    }
                                }


                            }
                        }
                    }


                }
            }
        }

        Rectangle{
        id: forelight
        height: parent.height
        width: parent.width
        //radius: 20
        //rotation: 90
        //x:(parent.width-width)/2
        //y:(parent.height-height)/2
        color: "transparent"
            LinearGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ff000000"  }
                    GradientStop { position: 0.38; color: "#78000000" }
                    GradientStop { position: 0.5; color: "transparent"}
                    GradientStop { position: 0.62; color: "#78000000" }
                    GradientStop { position: 1.0; color: "#ff000000"  }
                }
            }
        }
    }


}


//                startX: 150 ; startY:200
//                PathCubic{
//                    x: 50; y :100
//                    control1X: 100; control1Y: 200
//                    control2X: 50; control2Y: 125
//                }
//                PathCubic{
//                    x: 150; y :50
//                    control1X: 50; control1Y: 75
//                    control2X: 100; control2Y: 50
//                }
//                PathCubic{
//                    x: 250; y :100
//                    control1X: 200; control1Y: 50
//                    control2X: 250; control2Y: 75
//                }
//                PathCubic{
//                    x: 150; y :200
//                    control1X: 250; control1Y: 125
//                    control2X: 200; control2Y: 200
//                }
