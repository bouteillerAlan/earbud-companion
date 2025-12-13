import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.kquickcontrols as KQuickControls

Kirigami.ScrollablePage {
  id: commandConfigPage

  property alias cfg_iconUseCustomColor: iconUseCustomColor.checked
  property alias cfg_iconColor: iconColor.color
 
  property alias cfg_iconDim: iconDim.checked
  property alias cfg_iconDimUseCustomColor: iconDimUseCustomColor.checked
  property alias cfg_iconDimColor: iconDimColor.color

  property alias cfg_batPercentage: batPercentage.checked

  property alias cfg_mainDot: mainDot.checked
  property alias cfg_mainDotUseCustomColor: mainDotUseCustomColor.checked
  property alias cfg_mainDotColor: mainDotColor.color

  ColumnLayout {
    anchors {
      left: parent.left
      top: parent.top
      right: parent.right
    }

    Kirigami.FormLayout {
      Layout.alignment: Qt.AlignLeft
      wideMode: false

      Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: "Icon"
      }
    }

    Kirigami.FormLayout {
      Layout.alignment: Qt.AlignLeft
      RowLayout {
        Kirigami.FormData.label: "Custom icon color: "
        visible: true
        Controls.CheckBox {
          id: iconUseCustomColor
          checked: cfg_iconUseCustomColor
        }

        KQuickControls.ColorButton {
          id: iconColor
          enabled: iconUseCustomColor.checked
        }
      }
    }

    Kirigami.FormLayout {
      Layout.alignment: Qt.AlignLeft
      RowLayout {
        Kirigami.FormData.label: "Dim icon when no device is connected: "
        visible: true
        Controls.CheckBox {
          id: iconDim
          checked: cfg_iconDim
        }

      }

      RowLayout {
        Kirigami.FormData.label: "Custom dim color: "
        visible: true

        Controls.CheckBox {
          id: iconDimUseCustomColor
          checked: cfg_iconDimUseCustomColor
          visible: cfg_iconDim
        }

        KQuickControls.ColorButton {
          id: iconDimColor
          enabled: cfg_iconDim && iconDimUseCustomColor.checked
        }
      }

    }

    Kirigami.FormLayout {
      Layout.alignment: Qt.AlignLeft
      wideMode: false

      Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: "Display"
      }
    }

    Kirigami.InlineMessage {
      Layout.fillWidth: true
      text: "Dot is shown when a device is connected."
      visible: true
    }

    Kirigami.FormLayout {
      Layout.alignment: Qt.AlignLeft
      Controls.CheckBox {
        id: mainDot
        Kirigami.FormData.label: "Show dot: "
        checked: cfg_mainDot
        enabled: !cfg_batPercentage
      }

      RowLayout {
        Kirigami.FormData.label: "Custom dot color: "
        visible: mainDot.checked
        Controls.CheckBox {
          id: mainDotUseCustomColor
          checked: cfg_mainDotUseCustomColor
        }

        KQuickControls.ColorButton {
          id: mainDotColor
          enabled: mainDotUseCustomColor.checked
        }
      }
    }

    Kirigami.FormLayout {
      Layout.alignment: Qt.AlignLeft
      Controls.CheckBox {
        id: batPercentage
        Kirigami.FormData.label: "Show battery percentage: "
        checked: cfg_batPercentage
        enabled: !cfg_mainDot
      }
    }

  }
}
