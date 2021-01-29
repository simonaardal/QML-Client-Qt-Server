import QtQuick 2.4
import QtQuick.Controls 2.15

Page {
    width: 640
    height: 480

    title: qsTr("Page 1")

    Label {
        text: qsTr("You are on the interavtive page")
        anchors.centerIn: parent
    }

    Button {
        onClicked: {

        }
    }
}
