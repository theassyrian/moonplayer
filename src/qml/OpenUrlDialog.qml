import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Dialog {
    id: openUrlDialog
    width: 300
    height: 200
    title: qsTr("Enter URL to parse")
    standardButtons: Dialog.Ok | Dialog.Cancel

    onAccepted: {
        if (openUrlInput.text !== "")
            playlistModel.addUrl(openUrlInput.text, downloadCheckBox.checked);
        openUrlInput.text = "";
    }

    onRejected: openUrlInput.text = ""
    
    Connections {
        target: playlistModel
        onUrlDialogRequested: {
            openUrlInput.text = url
            openUrlDialog.open()
        }
    }

    ColumnLayout {
        anchors.fill: parent

        CustomTextInput {
            id: openUrlInput
            Layout.fillWidth: true
            height: 30
            onAccepted: openUrlDialog.accept()
        }

        CheckBox {
            id: downloadCheckBox
            text: qsTr("Download video")
        }
    }
}
