import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.5

Item {
    property string title: "Welcome"
    anchors.fill: parent

    Rectangle {
        id: rct
        anchors.top: parent.top
        anchors.topMargin: 100
        height: parent.height
        width: parent.width

        color: "transparent"

        Image {
            id: myImg
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 200
            width: 150
            height: 150

            source: "qrc:/img/my_image"

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: myImg.width
                    height: myImg.height

                    Rectangle {
                        anchors.centerIn: parent
                        width: myImg.adapt ? myImg.width : Math.min(myImg.width, myImg.height)
                        height: myImg.adapt ? myImg.height : width
                        radius: Math.min(width, height)
                    }
                }
            }
        }

        Label {
            anchors.centerIn: parent
            text: title
            font.pointSize: 40
            color: "deeppink"
        }

        Label {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: row.top
            anchors.bottomMargin: 50

            horizontalAlignment: Qt.AlignHCenter

            text: qsTr("I'm Jakub Warchol. Currently, I am working as C++/Qt Developer at PXM.")
            font.pointSize: 13
            color: "#bd5d38"
        }

        Row {
            id: row
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 400
            anchors.right: parent.right

            spacing: 150

            Rectangle {
                id: githubRct

                property bool hovered: false

                height: 30
                width: 500

                color: "transparent"
                border {
                    width: 3
                    color: !githubRct.hovered? "green" :
                                               "lightgreen"
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("SEE MY PROJECTS ON GITHUB")
                    font.pointSize: 10
                    color: !githubRct.hovered? "purple" :
                                               "#ffffff"
                }

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.DragLinkCursor

                    onEntered: githubRct.hovered = true
                    onExited: githubRct.hovered = false
                    onClicked: Qt.openUrlExternally("https://github.com/JWarcholC")
                }
            }

            Label {
                text: qsTr("or")
                font.pointSize: 16
                color: "purple"
            }

            Label {
                text: qsTr("SCROLL DOWN")
                font.pointSize: 20
                color: "purple"
            }
        }
    }
}
