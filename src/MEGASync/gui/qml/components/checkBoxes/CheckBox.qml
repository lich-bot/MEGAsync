import QtQuick 2.15
import QtQuick.Controls 2.15 as Qml

import common 1.0

import components.texts 1.0 as Texts
import components.images 1.0

Qml.CheckBox {
    id: root

    property string url: ""
    property bool manageChecked: false
    property Sizes sizes: Sizes {}
    property Colors colors: Colors {}
    property Icons icons: Icons {}
    property Item nextTabItem: null

    function indeterminate() {
        return checkState === Qt.PartiallyChecked;
    }

    function toggleCheckboxState() {
        if(manageChecked) {
            return;
        }

        if(root.tristate) {
            if (root.checkState === Qt.Checked) {
                root.checkState = Qt.Unchecked;
            }
            else if (root.checkState === Qt.Unchecked) {
                root.checkState = Qt.PartiallyChecked;
            }
            else {
                root.checkState = Qt.Checked;
            }
        }
        else {
            root.checked = !root.checked;
        }
    }

    spacing: (text.length === 0) ? 0 : sizes.spacing
    height: Math.max(contentItem.height, focusRect.height)
    padding: 0
    activeFocusOnTab: true

    contentItem: Texts.RichText {
        id: checkLabel

        anchors.left: indicator.right
        leftPadding: root.spacing
        height: Math.max(contentItem.implicitHeight, indicator.height)
        rawText: root.text
        wrapMode: Text.WordWrap
        fontSizeMode: Text.Fit
        url: root.url
        verticalAlignment: Text.AlignVCenter
        KeyNavigation.tab: root.nextTabItem

        MouseArea {
            anchors.fill: parent
            onPressed: { mouse.accepted = false; }
            cursorShape: Qt.PointingHandCursor
        }
    }

    indicator: Rectangle {
        id: focusRect

        color: "transparent"
        border.color: root.enabled ? (root.activeFocus ? Styles.focus : "transparent") : "transparent"
        border.width: sizes.focusBorderWidth
        radius: sizes.focusBorderRadius
        width: sizes.indicatorWidth + 2 * sizes.focusBorderWidth
        height: focusRect.width

        Rectangle {
            id: checkBoxOutRect

            function getBorderColor() {
                if(!root.enabled) {
                    return colors.borderDisabled;
                } else if(rootMouseArea.pressed) {
                    return colors.borderPressed;
                } else if(root.hovered) {
                    return colors.borderHover;
                }
                return colors.border;
            }

            function getBackgroundColor() {
                if(checkState === Qt.Unchecked) {
                    return colors.backgroundUnchecked;
                }
                if(!root.enabled) {
                    return colors.backgroundDisabled;
                } else if(rootMouseArea.pressed) {
                    return colors.backgroundPressed;
                } else if(root.hovered) {
                    return colors.backgroundHover;
                } else {
                    return colors.background;
                }
            }

            anchors.centerIn: focusRect
            width: sizes.indicatorWidth
            height: sizes.indicatorWidth
            radius: sizes.indicatorRadius
            border.color: checkBoxOutRect.getBorderColor()
            border.width: sizes.indicatorBorderWidth
            color: root.checked || root.down || indeterminate()
                   ? checkBoxOutRect.getBackgroundColor()
                   : "transparent"

            SvgImage {
                id: image

                visible: indeterminate() || checked
                source: indeterminate() ? icons.indeterminate : icons.checked
                anchors.centerIn: parent
                sourceSize: indeterminate() ? sizes.iconSizeIndeterminate : sizes.iconSize
                color: Styles.iconInverseAccent
            }
        }
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Space) {
            toggleCheckboxState();
            event.accepted = true;
        }
    }

    MouseArea {
        id: rootMouseArea

        z: -1
        anchors.fill: parent
        onClicked: {
            toggleCheckboxState();
            root.forceActiveFocus();
            mouse.accepted = true;
        }

        cursorShape: Qt.PointingHandCursor
    }

}
