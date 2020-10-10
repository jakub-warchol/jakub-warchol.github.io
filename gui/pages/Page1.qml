import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property string title: "Page 1"
    anchors.fill: parent

    Rectangle {
        id: rct
        anchors.centerIn: parent
        height: 200

        color: "transparent"
        border {
            width: 4
            color: "red"
        }

        Label {
            anchors.centerIn: parent
            text: title
            font.pointSize: 40
        }
    }
}
