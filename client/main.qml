import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.1


import com.company.scanner 1.0
import com.company.client 1.0

ApplicationWindow {
    id: root
    width: 450
    height: 480
    visible: true
    color: "#0e4576"
    title: qsTr("Hello World")

    property var arr: null

    Scanner {
        id: scanner;
    }

    Client {
        id: client;
        onConnectedToHost: {
            popupConnected.open()
            stack.push("ControlsPage.qml");
            console.log("Connected to host!");
        }
    }


    Popup {
        id: popupConnected
        background: Rectangle {
            color: "#16213e"
            border.color: "#e94560"
            border.width: 3
        }

        width: 200
        height: 200
        modal: true
        anchors.centerIn: parent
        contentItem: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            id: popupConnectedText
            font.bold: true
            color: "#e94560"
            text: "SUCCESSFULLY CONNECTED!"
        }
        Button {
            id: btnClose
            text: "CLOSE"
            width: 100
            anchors.horizontalCenter: parent.horizontalCenter
            y: popupConnected.height / 2 + 10
            onClicked: {
                popupConnected.close()
            }

            contentItem: Text {
                font.bold: true
                text: btnClose.text
                color: btnClose.down ? "#16213e" : "#e94560"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                minimumPixelSize: 12
            }
            background: Rectangle {
                height: btnClose.height
                implicitHeight: 40
                color: btnClose.down ? "#e94560" : "#16213e"
                border.color: "#e94560"
                border.width: 3
                radius: 0
            }

        }
    }

    StackView {
        id: stack
        initialItem: "ConnectPage.qml"
        anchors.fill: parent
    }
}
