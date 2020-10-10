import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property string title: "Page 2"
    anchors.fill: parent

    Rectangle {
        id: rct
        anchors.centerIn: parent
        width: 200
        height: 200

        color: "transparent"
        border {
            width: 4
            color: "lightgrey"
        }

        Label {
            anchors.centerIn: parent
            text: title
        }
    }
}
