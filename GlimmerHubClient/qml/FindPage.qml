import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Page {
    id: frmWindow
    title: qsTr("设置")
    visible: true


    ListModel {id: listModel} //表格数据源

    Component{
        id: baseListDelegate
        //项
        Item {
            id: delegateItem
            width: gridView.cellWidth-20
            height: gridView.cellHeight-20
            Rectangle{
                id: delegateItemBack
                anchors.fill: parent
                radius: 4
                border.width: 2

                // Rectangle{  //这里用Rectangle做测试，换成Image{}
                //     id: delegateImage
                //     color : "#FF00FF"
                //     radius: 20
                //     width: parent.width
                //     height: parent.height*0.9
                //     HoverHandler{
                //         onHoveredChanged: {
                //             hovered ? console.log("鼠标进入") : console.log("鼠标离开")
                //             //选择的一项在表格中的索引
                //             //delegateItem.GridView.view.currentIndex = model.index;
                //             hovered ? scaleEnlargeAnimation.running=true : scaleReducegeAnimation.running=true
                //         }

                //     }
                //     TapHandler{
                //         onTapped: {

                //         }
                //     }
                // }

                Image {
                    id: delegateImage
                    width: parent.width
                    height: parent.height*0.9
                    //visible: false
                    source: "file:///root/json/public/images/recommendImages/recommendImage18.png"
                    smooth: true//smooth: true启用了图像的平滑处理。
                    fillMode: Image.PreserveAspectCrop//填充模式，保持宽高比填充整个元素
                    antialiasing: true//antialiasing: true启用了图像的抗锯齿处理。
                    asynchronous: true//异步加载
                    HoverHandler{
                        onHoveredChanged: {
                            hovered ? console.log("鼠标进入") : console.log("鼠标离开")
                            //选择的一项在表格中的索引
                            //delegateItem.GridView.view.currentIndex = model.index;
                            hovered ? scaleEnlargeAnimation.running=true : scaleReducegeAnimation.running=true
                        }

                    }
                    TapHandler{
                        onTapped: {
                            console.log("鼠标点击图片")
                        }
                    }
                }

                Rectangle{
                    width: parent.width
                    height: parent.height*0.1
                    anchors.top: delegateImage.bottom
                    color: "blue"
                    RowLayout{
                        anchors.fill: parent
                        Text {
                            id:videoText
                            width: parent.width
                            height: parent.height*0.1
                            text: "遂愿"
                            font.pointSize: 11
                            font.family: "微软雅黑"
                            wrapMode: Text.Wrap
                            Layout.alignment: Qt.AlignCenter
                            // anchors.centerIn: parent
                            // anchors.left: parent.left
                            // anchors.topMargin: parent.height*0.04
                            // Rectangle{
                            //     anchors.fill: parent
                            //     color: "blue"
                            // }
                            HoverHandler{
                                onHoveredChanged: {
                                    hovered ? parent.color="#f351c3" : parent.color="black"
                                }
                            }
                        }
                    }
                }

                NumberAnimation {
                    id: scaleEnlargeAnimation//放大动画
                    target: delegateItemBack
                    property: "scale"
                    to: 1.06
                    duration:100 // 动画持续时间为1秒
                }
                NumberAnimation {
                    id: scaleReducegeAnimation//缩小动画
                    target: delegateItemBack
                    property: "scale"
                    to: 1.0
                    duration:100 // 动画持续时间为1秒
                }
                Rectangle{
                    id:mask
                    color: "black"//transparent
                    anchors.fill: parent
                    radius: 8
                    visible: false
                    smooth: true
                    antialiasing: true//antialiasing: true启用抗锯齿处理。
                }

                OpacityMask{
                    anchors.fill: delegateImage
                    source:delegateImage
                    maskSource:mask
                    visible:true
                    antialiasing: true//antialiasing: true启用抗锯齿处理。
                }
            }
        }
    }


    //表格视图
    GridView {
        id: gridView
        anchors.margins: 4
        anchors.fill: parent
        anchors.centerIn: parent
        clip: true

        anchors.leftMargin: 82
        anchors.topMargin: 30

        //表格中单元格宽高
        cellWidth: 260//frmWindow.width*0.24//200+30
        cellHeight: 330//frmWindow.height*0.55//300+30
        model: listModel //表格视图数据源
        delegate: baseListDelegate //表格中单元格组件
        boundsBehavior: Flickable.StopAtBounds
        //组件初始化完成时添加表情到数据源
        Component.onCompleted: {
            listModel.append({"face" : "Face_(0).png"})
            listModel.append({"face" : "Face_(1).png"})
            listModel.append({"face" : "Face_(2).png"})
            listModel.append({"face" : "Face_(3).png"})
            listModel.append({"face" : "Face_(4).png"})
            listModel.append({"face" : "Face_(5).png"})
            listModel.append({"face" : "Face_(6).png"})
            listModel.append({"face" : "Face_(7).png"})
            listModel.append({"face" : "Face_(8).png"})
            listModel.append({"face" : "Face_(9).png"})
            listModel.append({"face" : "Face_(10).png"})
            listModel.append({"face" : "Face_(11).png"})
            listModel.append({"face" : "Face_(12).png"})
            listModel.append({"face" : "Face_(13).png"})
            listModel.append({"face" : "Face_(14).png"})
            listModel.append({"face" : "Face_(15).png"})
            listModel.append({"face" : "Face_(16).png"})
            listModel.append({"face" : "Face_(17).png"})
            listModel.append({"face" : "Face_(18).png"})
            listModel.append({"face" : "Face_(19).png"})
            listModel.append({"face" : "Face_(20).png"})
            listModel.append({"face" : "Face_(21).png"})
            listModel.append({"face" : "Face_(22).png"})
            listModel.append({"face" : "Face_(23).png"})
            listModel.append({"face" : "Face_(24).png"})
            listModel.append({"face" : "Face_(25).png"})
            listModel.append({"face" : "Face_(26).png"})
            listModel.append({"face" : "Face_(27).png"})
        }
    }
}
