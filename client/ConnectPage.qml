import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.1
import com.company.scanner 1.0
import com.company.client 1.0
import QtQuick.Controls.Styles 1.4


Page {
    background: Rectangle {
        color: "#16213e"
    }

    Column {
        id: connectColumn
        anchors.fill: parent
        spacing: 5
        Label {
            id: label
            color: "#e94560"
            y: parent.y + 120
            height: 39
            text: qsTr("CONNECT")
            font.letterSpacing: 2.9
            anchors.horizontalCenter: parent.horizontalCenter
            font.wordSpacing: 0.6
            font.bold: true
            font.pointSize: 24
        }

        ComboBox {
            id: addressBox
            model: arr

            delegate: ItemDelegate {
               width: addressBox.width
               contentItem: Text {
                   text: modelData
                   color: "#e94560"
                   font.bold: true
                   elide: Text.ElideRight
                   verticalAlignment: Text.AlignVCenter
               }
               highlighted: addressBox.highlightedIndex === index
            }

            indicator: Canvas {
                    id: canvas
                    x: addressBox.width - width - addressBox.rightPadding
                    y: addressBox.topPadding + (addressBox.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    Connections {
                        target: addressBox
                        function onPressedChanged() { canvas.requestPaint(); }
                    }

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = addressBox.pressed ? "#e94560" : "#e94560";
                        context.fill();
                    }
                }

            contentItem: Text {
                leftPadding: 20
                text: addressBox.displayText
                font: addressBox.font
                color: "#e94560"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            popup: Popup {
                y: addressBox.height - 1
                width: addressBox.width
                padding: 1

                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: addressBox.popup.visible ? addressBox.delegateModel : null
                    currentIndex: addressBox.highlightedIndex

                    ScrollIndicator.vertical: ScrollIndicator { }
                }

                background: Rectangle {
                    color: "#16213e"
                    border.color: "#e94560"
                    border.width: 3
                }
            }

            background: Rectangle {
                implicitHeight: 40
                color: "#16213e"
                border.color: "#e94560"
                border.width: 3
            }


            y: label.y + 80
            width: 180
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            Component.onCompleted: {
                console.log("addressBox completed")
                scanner.scan()
                var arr = []
                var list = scanner.list
                for (var i = 0; i < list.length; i++) {
                    arr.push(list[i])
                }
                root.arr = arr
            }

        }

        Button {
            id: btnScan
            y: addressBox.y + 60
            width: addressBox.width
            text: qsTr("SCAN NETWORK")
            contentItem: Text {
                text: btnScan.text
                font: btnScan.font
                color: btnScan.down ? "#16213e" : "#e94560"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                minimumPixelSize: 12
            }
            font.bold: true
            background: Rectangle {
                height: parent.height
                implicitHeight: 40
                color: btnScan.down ? "#e94560" : "#16213e"
                border.color: "#e94560"
                border.width: 3
                radius: 0
            }

            onClicked: {
                scanner.ping();
                scanner.scan()
                var arr = []
                var list = scanner.list
                for (var i = 0; i < list.length; i++) {
                    arr.push(list[i])
                }
                root.arr = arr

            }
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: btnConnect
            y: btnScan.y + 60
            width: addressBox.width
            text: qsTr("CONNECT")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: client.connectToHost(addressBox.currentText, 1234)
            contentItem: Text {
                text: btnConnect.text
                font: btnConnect.font
                color: btnConnect.down ? "#16213e" : "#e94560"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                minimumPixelSize: 12
            }
            background: Rectangle {
                height: parent.height
                implicitHeight: 40
                color: btnConnect.down ? "#e94560" : "#16213e"
                border.color: "#e94560"
                border.width: 3
                radius: 0
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3}D{i:2}
}
##^##*/
