import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: frmWindow
    visible: true
    width: 1200
    height: 800
    title: qsTr("GlimmerHub")

    SwipeView {
        id: view
        height: frmWindow.height - 110
        width: parent.width
        currentIndex: bar.currentIndex
        anchors.topMargin: 100
        FindPage{

        }
        MessagePage{

        }
        ContactPage{

        }
        MyPage{

        }

    }

    footer:Rectangle{
        color:"blue"//"transparent"//
        height:60
        BaseTabBar{
            id: bar
            height: 60
            width: parent.width
            anchors.bottom: parent.bottom
            Component.onCompleted: {
                myModel.append({ "modelText": "发现", "modelColor": "red", "modelColorG": "#148014",
                                   "modelSrc": "qrc:/static/icon/find.png", "modelSrcG": "qrc:/static/icon/findG.png"})
                myModel.append({ "modelText": "消息", "modelColor": "red", "modelColorG": "#148014",
                                   "modelSrc": "qrc:/static/icon/message.png", "modelSrcG": "qrc:/static/icon/messageG.png"})
                myModel.append({ "modelText": "发布", "modelColor": "red", "modelColorG": "#148014",
                                   "modelSrc": "qrc:/static/icon/publish.png", "modelSrcG": "qrc:/static/icon/publishG.png"})
                myModel.append({ "modelText": "我", "modelColor": "red", "modelColorG": "#148014",
                                   "modelSrc": "qrc:/static/icon/my.png", "modelSrcG": "qrc:/static/icon/myG.png"})
            }
        }
    }



}
