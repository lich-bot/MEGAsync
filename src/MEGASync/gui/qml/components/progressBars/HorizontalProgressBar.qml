import QtQuick 2.15
import QtQuick.Controls 2.15 as Qml

import common 1.0

Qml.ProgressBar {
    id: root

    height: 2
    value: 0.0

    background: Rectangle {
        anchors.fill: parent
        radius: height
        color: Styles.indicatorBackground
    }

    contentItem: Item {
        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            radius: height
            color: Styles.buttonPrimary
            visible: !indeterminate
        }

        Rectangle {
            id: indeterminateRect

            width: 30
            height: parent.height
            color: Styles.buttonPrimary
            visible: indeterminate

            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                XAnimator {
                    target: indeterminateRect
                    from: 0
                    to: root.width - indeterminateRect.width
                    duration: 1500
                }

                XAnimator {
                    target: indeterminateRect
                    from: root.width - indeterminateRect.width
                    to: 0
                    duration: 1500
                }
            }
        }
    }
}
