import QtQuick 2.15
import QtQuick.Layouts 1.15

import common 1.0

import components.texts 1.0 as Texts

ColumnLayout {

    property alias title: title.rawText
    property alias titleWeight: title.font.weight
    property alias description: description.text
    property alias descriptionWeight: description.font.weight
    property alias descriptionColor: description.color
    property alias descriptionFontSize: description.font.pixelSize

    spacing: 8

    Texts.RichText {
        id: title

        Layout.fillWidth: true
        font.pixelSize: Texts.Text.Size.Large
        font.weight: Font.DemiBold
    }

    Texts.SecondaryText {
        id: description

        Layout.fillWidth: true
        font.pixelSize: Texts.Text.Size.Medium
        wrapMode: Text.WordWrap
    }

}
