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
                border.width: 0
                color: "transparent"

                Image {
                    id: delegateImage
                    width: parent.width
                    height: parent.height*0.9
                    visible: false
                    source: "file:///root/json/public/images/recommendImages/recommendImage18.png"
                    smooth: true//smooth: true启用了图像的平滑处理。
                    fillMode: Image.PreserveAspectCrop//填充模式，保持宽高比填充整个元素
                    antialiasing: true//antialiasing: true启用了图像的抗锯齿处理。
                    asynchronous: true//异步加载
                }

                Rectangle{
                    width: parent.width
                    height: parent.height*0.1
                    anchors.top: delegateImage.bottom
                    color: "blue"
                    RowLayout{
                        anchors.fill: parent
                        spacing: 6

                        Image {
                            id: upAvatar//头像
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: 20
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            source: model.avatar//"file:///root/json/public/images/recommendImages/avatar2.png"
                            TapHandler{
                                onTapped: {
                                    console.log("点击了头像")
                                }
                            }
                        }
                        Text {
                            id:userName
                            width: parent.width
                            height: parent.height*0.1
                            Layout.fillWidth: true
                            text: model.name//"遂愿"
                            font.pointSize: 11
                            font.family: "微软雅黑"
                            wrapMode: Text.Wrap
                            Layout.alignment: Qt.AlignCenter
                            //Layout.leftMargin: 10
                            // Rectangle{
                            //     anchors.fill: parent
                            //     color: "blue"
                            // }
                            TapHandler{
                                onTapped: {
                                    console.log("点击了用户名")
                                }
                            }
                            HoverHandler{
                                onHoveredChanged: {
                                    hovered ? parent.color="#f351c3" : parent.color="black"
                                }
                            }
                        }
                        Item {
                                Layout.fillWidth: true // 占据中间所有剩余空间
                            }
                        Image {
                            id: commentNumIcon//评论
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: 20
                            Layout.alignment: Qt.AlignVCenter
                            source: "qrc:/static/icon/commentNumIcon.png"
                            TapHandler{
                                onTapped: {
                                    console.log("点击了评论")
                                }
                            }
                        }
                        Text {
                            id:commentNum
                            width: parent.width
                            height: parent.height*0.1
                            text: model.comNum//"1000+"
                            font.pointSize: 11
                            font.family: "微软雅黑"
                            wrapMode: Text.Wrap
                            Layout.alignment: Qt.AlignCenter
                            Layout.rightMargin: 10
                            TapHandler{
                                onTapped: {
                                    console.log("点击了评论数")
                                }
                            }
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
                    radius: 12
                    visible: false
                    smooth: true
                    antialiasing: true//antialiasing: true启用抗锯齿处理。

                }

                //这个遮罩即图片
                OpacityMask{
                    anchors.fill: delegateImage
                    source:delegateImage
                    maskSource:mask
                    visible:true
                    antialiasing: true//antialiasing: true启用抗锯齿处理。
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
                            console.log("鼠标点击了笔记封面缩略图")
                        }
                    }
                }
            }
        }
    }


    //表格视图
    GridView {
        id: gridView
        anchors.margins: 4
        anchors.fill: parent
        //anchors.centerIn: parent
        clip: true

        anchors.leftMargin: 82
        anchors.topMargin: 30

        //表格中单元格宽高
        cellWidth: 260//frmWindow.width*0.24//200+30
        cellHeight: 330//frmWindow.height*0.55//300+30
        model: listModel //表格视图数据源
        delegate: baseListDelegate //表格中单元格组件
        //boundsBehavior: Flickable.StopAtBounds//禁止下拉
        //组件初始化完成时添加数据到数据源
        Component.onCompleted: {
            listModel.append({
                        "avatar": "file:///root/json/public/images/recommendImages/avatar7.png",
                        "name": "云韵",
                        "comNum": 666
                    })
            listModel.append({
                        "avatar": "file:///root/json/public/images/recommendImages/avatar7.png",
                        "name": "彩鳞",
                        "comNum": 777
                    })
            listModel.append({
                        "avatar": "file:///root/json/public/images/recommendImages/avatar7.png",
                        "name": "韩月",
                        "comNum": 888
                    })
            listModel.append({
                        "avatar": "file:///root/json/public/images/recommendImages/avatar7.png",
                        "name": "萧炎",
                        "comNum": 999
                    })
            listModel.append({
                        "avatar": "file:///root/json/public/images/recommendImages/avatar7.png",
                        "name": "青鳞",
                        "comNum": 1000
                    })
            listModel.append({
                        "avatar": "file:///root/json/public/images/recommendImages/avatar7.png",
                        "name": "熏儿",
                        "comNum": 21
                    })
        }
    }
}
