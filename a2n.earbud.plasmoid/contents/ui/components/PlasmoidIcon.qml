import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.ksvg as KSvg
import org.kde.plasma.workspace.components as WorkspaceComponents
import org.kde.plasma.plasmoid
import "."

Item {
    id: root

    property bool iconUseCustomColor: plasmoid.configuration.iconUseCustomColor
    property string iconColor: plasmoid.configuration.iconColor
 
    property bool iconDim: plasmoid.configuration.iconDim
    property bool iconDimUseCustomColor: plasmoid.configuration.iconDimUseCustomColor
    property string iconDimColor: plasmoid.configuration.iconDimColor

    property var audioDevices: []
    property var firstAD: null

    Connections {
      target: main
      function onNewDeviceData(data) {
        if (data.length > 0) {
          audioDevices = data
          if (audioDevices[0]) {
            firstAD = audioDevices[0]
          }
        }
      }
    }

    function getColor() {
      const disconnected = !firstAD || !firstAD.data.connected
      if (iconDim && disconnected) return iconDimUseCustomColor ? iconDimColor : 'gray'
      return iconUseCustomColor ? iconColor : Kirigami.Theme.colorSet
    }

    anchors.centerIn: parent
    property var source

    Kirigami.Icon {
      id: svgItem
      opacity: 1
      width: parent.width
      height: parent.height
      property int sourceIndex: 0
      anchors.centerIn: parent
      smooth: true
      isMask: true
      color: getColor()
      source: Qt.resolvedUrl("../../assets/" + root.source)
    }
}
