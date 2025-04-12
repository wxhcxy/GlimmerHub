import QtQuick
import QtQuick.Controls

Page {
    id: frmWindow
    title: qsTr("设置")
    visible: true

    Rectangle{
        color:"green"
        anchors.fill: parent
        Text {
            text: qsTr("联系人")
            color:"white"
            font.pixelSize: 30
            anchors.centerIn: parent
        }
    }
}
