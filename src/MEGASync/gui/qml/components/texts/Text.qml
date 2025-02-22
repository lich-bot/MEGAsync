import QtQuick 2.15 as Qml

import common 1.0

Qml.Text {
    id: root

    enum Size {
        Small = 10,
        Normal = 12,
        Medium = 14,
        MediumLarge = 16,
        Large = 20,
        Huge = 48
    }

    font.family: Styles.fontFamily
    font.styleName: Styles.fontStyleName
    font.pixelSize: Text.Size.Normal
    color: enabled ? Styles.textPrimary : Styles.textDisabled
    wrapMode: Text.WordWrap
}
