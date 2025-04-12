import QtQuick
import QtQuick.Controls

Page {
    id: frmWindow
    title: qsTr("设置")
    visible: true

    Rectangle{
        color:"yellow"
        anchors.fill: parent
        Text {
            text: qsTr("我")
            color:"red"
            font.pixelSize: 30
            anchors.centerIn: parent
        }
    }
}
