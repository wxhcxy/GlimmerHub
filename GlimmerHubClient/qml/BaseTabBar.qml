import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
TabBar {
    property alias myModel: idTabbarModel
    property int lastIndex: 0
    id: idTabbar
    currentIndex: 0
    ListModel {id: idTabbarModel}

    contentItem: RowLayout {
        spacing: 150 // 按钮之间的间隔
        width: parent.width*0.6
        anchors.centerIn: parent
        Repeater {
            id: idRepeaterControl
            model: idTabbarModel
            TabButton {
                property alias imageSource: image.source //图像
                property alias textColor: text.color //文本
                Layout.preferredHeight: implicitHeight + 50//80
                Layout.preferredWidth : implicitWidth + 50 // 扩展按钮宽度（根据间隔调整）
                contentItem: Item {
                    Image{
                        id: image
                        width: 38
                        height: 38
                        anchors.bottom: text.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: (model.index === idTabbar.currentIndex) ? model.modelSrcG : model.modelSrc
                        // ColorOverlay{
                        //             anchors.fill: image
                        //             source: image
                        //             color: "red"
                        //         }
                    }

                    Text {
                        id: text
                        text: model.modelText
                        padding: 0
                        font.pixelSize: 22
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: (model.index === idTabbar.currentIndex) ? model.modelColorG : model.modelColor
                        // Rectangle{//测试
                        //     color: "green"
                        //     anchors.fill: parent
                        //     z:-1
                        //     //color: "transparent"//color: "green"
                        // }
                    }
                }

                // 可选：自定义背景
                // background: Rectangle {
                //     color: "green"
                // }
                //鼠标经过事件处理
                onHoveredChanged: {
                    if (model.index !== idTabbar.currentIndex){
                        hovered ? text.color = model.modelColorG : text.color = model.modelColor
                        hovered ? image.source = model.modelSrcG : image.source = model.modelSrc
                    }
                }
                //点击事件处理
                onClicked: {
                    idRepeaterControl.itemAt(idTabbar.lastIndex).imageSource = myModel.get(idTabbar.lastIndex).modelSrc;
                    idRepeaterControl.itemAt(idTabbar.lastIndex).textColor = model.modelColor;
                    image.source = model.modelSrcG;
                    text.color = model.modelColorG;
                    idTabbar.lastIndex = model.index;
                    console.log("999")
                }
            }
        }
    }
}
