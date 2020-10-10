import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window

    property int minWidth: 1920
    property int minHeight: 1029

    width: minWidth
    height: minHeight
    minimumWidth: minWidth
    minimumHeight: minHeight

    visible: true
    title: qsTr("About me... ") + height + "x" + width

    background: Image {
        id: bgImage
        source: "qrc:/img/background"
        opacity: 0.85
        z: -1
    }

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        Rectangle {
            anchors.fill: parent
            z: 2

            color: "#cccced"

            ToolButton {
                id: toolButton
                text: "\u2630"
                font.pixelSize: Qt.application.font.pixelSize * 1.6 * 1.2              
                onClicked: drawer.open()
            }

            Label {
                anchors.centerIn: parent

                text: scrollView.currentItem.pageTitle
                font.pointSize: 20
            }
        }

        Drawer {
            id: drawer
            width: window.width * 0.25
            height: window.height

            Rectangle {
                anchors.fill: parent
                color: "#cccced"

                Column {
                    anchors.fill: parent
                    Repeater {
                        anchors.fill: parent
                        anchors.topMargin: 50

                        model: pageModel

                        delegate: ItemDelegate {
                            anchors.topMargin: 10
                            height: 80
                            width: parent.width

                            text: sourceTitle
                            font.pointSize: 15

                            onClicked: {
                                pageLv.currentIndex = index
                                drawer.close()
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: pageDelegate

        Loader {
            property string pageTitle: sourceTitle
            height: 500
            width: window.width
            source: sourceUrl
        }
    }

    ListModel {
        id: pageModel

        ListElement {sourceUrl: "Welcome.qml";  sourceTitle: "Welcome"}
        ListElement {sourceUrl: "Page1.qml";    sourceTitle: "Page 1"}
        ListElement {sourceUrl: "Page2.qml";    sourceTitle: "Page 2"}
    }

    ScrollView {
        id: scrollView

        property alias currentItem: pageLv.currentItem

        anchors.fill: parent

        ListView {
            id: pageLv
            anchors.fill: parent

            spacing: 10
            boundsBehavior: ListView.StopAtBounds
            highlightRangeMode: ListView.StrictlyEnforceRange // change currentIndex when new item is visible

            model: pageModel
            delegate: pageDelegate
        }
    }

    footer: Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: scrollView.bottom
        height: 30
        color: "#cccced"

        border {
            width: 2
            color: "grey"
        }

        Label {
            anchors.centerIn: parent

            text: "<a href='https://www.freepik.com/vectors/background'>Background vector created by pikisuperstar - www.freepik.com</a>"
            color: "grey"

            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
}
