import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config.colors
import qs.config

Rectangle {
    width: Settings.mModWidth
    height: Settings.barHeight
    color: MatugenColors.boxColor
    radius: Settings.roundness
    border {
        color: MatugenColors.borderColor
        width: Settings.borderWidth
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        Item {
            Layout.fillWidth: parent
            Layout.fillHeight: parent

            Clock {
                anchors.centerIn: parent
            }
        }

        Item {
            Layout.fillWidth: parent
            Layout.fillHeight: parent

            Weather {
                anchors.centerIn: parent
            }
        }
    }
}
