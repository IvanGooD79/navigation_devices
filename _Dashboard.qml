import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

import com.myinc.DashData 1.0

ApplicationWindow  {
id: win
    property int desctW: Screen.desktopAvailableWidth
    property int desctH: Screen.desktopAvailableHeight
    readonly property color defaultColorBorder:  "#3585d3ff"
    readonly property color defaultColorTxtNum:  "#85d3ff"
    readonly property color defaultColorcenter:  "#75000000"
    readonly property color defaultColorLight_1: "#9500ffff"
    readonly property color defaultColorLight_2: "transparent"
    readonly property color defaultColorLight_3: "#800080ff"
    readonly property font fontMain: Qt.font({family:"Segoe UI"})
    //=============================================================

    height: desctH*0.60
    width: height*2.5
    visible: true
    color: "black"
    title: "Navigation Devices"
    x: (desctW-width)/2
    y: (desctH-height)/2
	

    DashData{
        id: dd
        onCursChanged: {id_compas_obj.curCompasAng = dd.curs; id_compas_obj.stateAngle()}
    }

	
    //flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.CustomizeWindowHint

    CounterBox{
    id: id_counter_box
    height: Math.min(parent.width,parent.height)*0.40
    width: height
    x: parent.width - width - parent.width*0.05
    y: parent.height - height - parent.height*0.05
    DragHandler{}
    }

    BankBoard{
        id: id_bank_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height
        ico_light: true
        colorIcoLight: curAng != 0 ? "#ffffff00" : "#ff00ffff"
        x: 30
        y: 30
        curAng: -5
    }

    PitchBoard{
        id: id_pitch_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height
        ico_light: true
        colorIcoLight: curAng != 0 ? "#ffffff00" : "#ff00ffff"
        anchors.left: id_bank_obj.right
        anchors.top: id_bank_obj.top
        anchors.leftMargin: width*0.2
        curAng: 5
    }

    BankDuoBoard{
        id: id_bankduo_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height
        curAng_1: 2
        curAng_2: 5
        curAng_3: -5
        curAng_4: 10
        anchors.left: id_pitch_obj.right
        anchors.top: id_pitch_obj.top
        anchors.leftMargin: width*0.2
    }

    GraficBoard{
        id: id_grafic_obj
        height: parent.height*0.40
        width: height*2
        anchors.left: id_bankduo_obj.right
        anchors.top: id_bankduo_obj.top
        anchors.leftMargin: width*0.1
    }

    CompasBoard{
        id: id_compas_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height

        anchors.left: id_pitch_obj.left
        anchors.top: id_pitch_obj.bottom
        anchors.topMargin: 20
        DragHandler{}
//               Timer{
//                   interval: 10000; running: true; repeat: true
//                   onTriggered: {
//                                id_compas_obj.curCompasAng = ((Math.random()*100)+(Math.random()*100)+(Math.random()*100));
//                                id_compas_obj.stateAngle();
//                   }
//               }
    }

    InclinometrBoard{
        id: id_inc_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height
        curAngKren: 5
        curAngInc: 20
        anchors.left: id_bank_obj.left
        anchors.top: id_bank_obj.bottom
        anchors.topMargin: 20
        ico_light: true
        colorIcoLight: curAngKren != 0 ? "#ffffff00" : "#ff00ffff"
    }


    ICO_car_front{
        id: id_ico_front_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height

        anchors.left: id_compas_obj.right
        anchors.top: id_compas_obj.top
        DragHandler{}
    }

    ICO_car_side{
        id: id_ico_side_obj
        height: Math.min(parent.width,parent.height)*0.40
        width: height

        anchors.left: id_ico_front_obj.right
        anchors.top: id_ico_front_obj.top
        DragHandler{}
    }

//    ICO_counter_box{
//        id: id_ico_cb_obj
//        height: Math.min(parent.width,parent.height)*0.20
//        width: height

//        anchors.right: id_counter_box.left
//        anchors.top: id_counter_box.top
//        DragHandler{}
//    }

//    ICO_chassis{
//        id: id_ico_chssis_obj
//        height: Math.min(parent.width,parent.height)*0.40
//        width: height

//        anchors.left: id_ico_side_obj.right
//        anchors.top:  id_ico_side_obj.top
//        DragHandler{}
//    }

//    ICO_antena{
//        id: id_ico_antena_obj
//        height: Math.min(parent.width,parent.height)*0.40
//        width: height

//        anchors.left: id_ico_side_obj.right
//        anchors.top:  id_ico_side_obj.top
//        DragHandler{}
//    }

}


