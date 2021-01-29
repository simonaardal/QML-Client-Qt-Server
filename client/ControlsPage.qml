import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.1

Page {

    background: Rectangle {
        color: "#16213e"
    }


    id: controlsPage

    Column {
        id: column
        x: 220
        y: 87
        width: 367
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        GroupBox {
            id: gbControls
            width: column.width
            height: column.height - 200
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("")
            background: Rectangle {
                border.color: "#e94560"
                border.width: 3
                color: "#16213e"
            }

            Button {
                id: btnUp
                x: 97
                y: btnRight.y - 60
                width: 100
                text: qsTr("UP")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    client.writeUp();
                }
                contentItem: Text {
                    text: btnUp.text
                    font.bold: true
                    color: btnUp.down ? "#16213e" : "#e94560"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    minimumPixelSize: 12
                }
                background: Rectangle {
                    height: btnUp.height
                    implicitHeight: 40
                    color: btnUp.down ? "#e94560" : "#16213e"
                    border.color: "#e94560"
                    border.width: 3
                    radius: 0
                }
            }

            Button {
                id: btnRight
                x: 205
                y: 107
                width: 100
                text: qsTr("RIGHT")
                anchors.right: parent.right
                anchors.rightMargin: 0
                onClicked: {
                    client.writeRight();
                }
                contentItem: Text {
                    text: btnRight.text
                    font.bold: true
                    color: btnRight.down ? "#16213e" : "#e94560"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    minimumPixelSize: 12
                }
                background: Rectangle {
                    height: btnRight.height
                    implicitHeight: 40
                    color: btnRight.down ? "#e94560" : "#16213e"
                    border.color: "#e94560"
                    border.width: 3
                    radius: 0
                }
            }

            Button {
                id: btnDown
                x: 97
                y: btnRight.y + 60
                width: 100
                text: qsTr("DOWN")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    client.writeDown();
                }
                contentItem: Text {
                    text: btnDown.text
                    font.bold: true
                    color: btnDown.down ? "#16213e" : "#e94560"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    minimumPixelSize: 12
                }
                background: Rectangle {
                    height: btnDown.height
                    implicitHeight: 40
                    color: btnDown.down ? "#e94560" : "#16213e"
                    border.color: "#e94560"
                    border.width: 3
                    radius: 0
                }
            }

            Button {
                id: btnLeft
                y: 107
                width: 100
                text: qsTr("LEFT")
                anchors.left: parent.left
                anchors.leftMargin: 0
                onClicked: {
                    client.writeLeft();
                }
                contentItem: Text {
                    font.bold: true
                    text: btnLeft.text
                    color: btnLeft.down ? "#16213e" : "#e94560"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    minimumPixelSize: 12
                }
                background: Rectangle {
                    height: btnLeft.height
                    implicitHeight: 40
                    color: btnLeft.down ? "#e94560" : "#16213e"
                    border.color: "#e94560"
                    border.width: 3
                    radius: 0
                }
            }
        }

        Button {
            id: btnDisconnect
            y: gbControls.y + gbControls.height + 20
            width: 100
            text: "DISCONNECT"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                client.disconnect();
                stack.pop("ControlsPage");
            }
            contentItem: Text {
                text: btnDisconnect.text
                font.bold: true
                color: btnDisconnect.down ? "#16213e" : "#e94560"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                minimumPixelSize: 12
            }
            background: Rectangle {
                height: btnDisconnect.height
                implicitHeight: 40
                color: btnDisconnect.down ? "#e94560" : "#16213e"
                border.color: "#e94560"
                border.width: 3
                radius: 0
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
