import QtQuick
import QtQuick.Window
 import QtQuick.Controls

Window {
    id: win
    width: 480
    height: 640
    visible: true
    title: qsTr("World Temperture")


//    Flickable {
//        id: flickable
//        clip: true
//        // ...
//        ScrollBar.vertical: ScrollBar {
//            parent: flickable.parent
//            anchors.top: flickable.top
//            anchors.left: flickable.right
//            anchors.bottom: flickable.bottom
//        }
//    }

//    Flickable {
//        anchors.fill: parent

//        contentWidth: parent.width
//        contentHeight: parent.height

//        ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
//        ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }


//    ScrollBar {
//        id: vbar
//        hoverEnabled: true
//        active: hovered || pressed
//        orientation: Qt.Vertical
//        anchors.top: parent.top
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//    }

//    Flickable {
//        focus: true
        //ScrollBar.vertical: ScrollBar { id: scrollBar }
//
    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered:
        {
            time.text = Qt.formatDateTime(new Date(), "hh:mm:ss");
            date.text = Qt.formatDateTime(new Date(), "dddd dd MMMM");
        }
    }

// common rect
    Rectangle {
        id: rectDateTime
        width:  parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: "skyblue"


// Timer
        Rectangle {
            id: recTime
            anchors.horizontalCenter: rectDateTime.horizontalCenter
            anchors.top: rectDateTime.top
            anchors.topMargin: 5
            width: rectDateTime.width
            height:  80
            color: "transparent"

            Text {
                id: time
                text: "10:25"
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 80
            }
        }


// Date
        Rectangle {
            id: recDate
            anchors.horizontalCenter: recTime.horizontalCenter
            anchors.top: recTime.bottom
            anchors.topMargin: 5
            width: recTime.width
            height:  25
            color: "transparent"

            Text {
                id: date
                text: "10:25"
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 25
            }
        }

// link
        Text {
            id: txtStationsAll
            anchors.top: recDate.bottom
            anchors.horizontalCenter: recDate.horizontalCenter
            anchors.topMargin: 15
            height:  40
            font.pointSize: 11
            text:  "<h2>Weather in Singapore .sg (in temperture) !!!</h2>simple API  <a href='https://api.data.gov.sg/v1/environment/air-temperature'>https://api.data.gov.sg/v1/environment/air-temperature</a>"
            onLinkActivated: Qt.openUrlExternally(link) // https://api.data.gov.sg/v1/environment/air-temperature
        }

// add JSON to IteamWeather
        ItemWeather {
            id: weather0
            anchors.top: txtStationsAll.bottom
            anchors.horizontalCenter: txtStationsAll.horizontalCenter
        }



    }
}
