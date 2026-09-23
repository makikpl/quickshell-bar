import QtQuick
import Quickshell
import qs.config.colors
import qs.config
import qs.modules.quickbar.middle
import qs.modules.quickbar.right

PanelWindow {
	anchors {
		top: true
		left: true
		right: true
	}
	margins {
		top: 5
		left: 5
		right: 5
	}
	color: "transparent"
	implicitHeight: Settings.barHeight

	Rectangle {
		id: bar
		anchors.fill: parent
		color: MatugenColors.barColor
		radius: Settings.roundness
		border {
		    color: MatugenColors.borderColor
			width: Settings.borderWidth
		}

		MiddleModule {
		    anchors.centerIn: parent
		}
		RightModule {
		    anchors.right: parent.right
		}
	}
}
