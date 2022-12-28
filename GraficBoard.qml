import QtQuick 2.0
import QtCharts 2.3

Item {
    id:root
        property alias xpos: id_graf.x
        property alias ypos: id_graf.y
        property color colorLight_1: "#ff0080aa"
        property color colorLight_2: "transparent"
        property var arr_1: []
        property var arr_2: []
        property int pNum: 0

    Rectangle{
        id: id_graf
        anchors.fill: parent
        color: "transparent"
        border{
        color: "silver"
        width: parent.height*0.01
        }


        ChartView {
            id: chart
            title: "Ruble vs Dollar"
            anchors.fill: parent
            legend.alignment: Qt.AlignBottom
            antialiasing: true
            //backgroundColor: "#90555555"
            //titleColor: "skyblue"
            //plotAreaColor: "transparent"
            theme: ChartView.ChartThemeDark

            ValueAxis {
                id: axisX
                min: 0
                max: 24
                tickCount: 3
                labelFormat: "%.0f"
                color: "gold"
            }

            ValueAxis {
                 id: axisY
                 min: 0
                 max: 10
                 labelFormat: "%0.1f"
                 color: "gold"
             }

            SplineSeries {
                    id: line_1
                    name: "Ruble"
                    color:  Qt.hsla(0.6, 0.5, 0.5, 1)
                    width: 3
                    axisX: axisX
                    axisY: axisY

//                    XYPoint { x: 0; y: 0.0 }
//                    XYPoint { x: 1.1; y: 3.2 }
                }


            SplineSeries {
                    id: line_2
                    name: "Dollar"
                    color:  Qt.hsla(0.3, 0.5, 0.5, 1)
                    width: 3
//                    XYPoint { x: 0; y: 0.0 }
//                    XYPoint { x: 6.0; y: 7.0 }
                }

            Timer{
                interval:100; running: true; repeat: true
                onTriggered: {
                    if (pNum > axisX.max-1 ){ pNum = 0; line_1.clear();line_2.clear()}

                    arr_1[pNum] = Math.random()*10;
                    arr_2[pNum] = Math.random()*10;

                    line_1.append(pNum,arr_1[pNum]);
                    line_2.append(pNum,arr_2[pNum])
//                    console.log("Count point: "+pNum)
//                    console.log("Size buff_1: "+arr_1.length)
//                    console.log("Size buff_2: "+arr_2.length)
                    pNum++
                }
            }

//            Component.onCompleted: {
//                // Set the common slice properties dynamically for convenience
//                console.log(pNum)
//                for (var i = 0; i < arr.length; i++) {

//                    console.log("x: " +i + " :: y: " +arr[i])

//                }
//            }

        }

    }

}
