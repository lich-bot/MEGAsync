import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import common 1.0

import components.texts 1.0 as Texts

import onboard 1.0

import LoginController 1.0

SyncsPage {

    property alias buttonGroup: buttonGroupComp
    property alias syncButton: syncButtonItem

    footerButtons.rightPrimary.enabled: false

    ColumnLayout {

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        spacing: 24

        Header {
            title: loginControllerAccess.newAccount
                   ? OnboardingStrings.welcomeToMEGA
                   : OnboardingStrings.letsGetYouSetUp
            description: OnboardingStrings.chooseInstallation
            spacing: 36
            descriptionWeight: Font.DemiBold
            descriptionColor: Styles.textPrimary
        }

        ButtonGroup {
            id: buttonGroupComp
        }

        ColumnLayout {
            spacing: 12

            SyncsHorizontalButton {
                id: syncButtonItem

                Layout.leftMargin: -syncButtonItem.focusBorderWidth
                Layout.rightMargin: -syncButtonItem.focusBorderWidth
                title: OnboardingStrings.sync
                description: OnboardingStrings.syncButtonDescription
                imageSource: Images.sync
                type: SyncsType.Types.Sync
                ButtonGroup.group: buttonGroupComp
            }

            SyncsHorizontalButton {
                id: backupsButton

                Layout.leftMargin: -backupsButton.focusBorderWidth
                Layout.rightMargin: -backupsButton.focusBorderWidth
                title: OnboardingStrings.backup
                description: OnboardingStrings.backupButtonDescription
                imageSource: Images.installationTypeBackups
                type: SyncsType.Backup
                ButtonGroup.group: buttonGroupComp
            }
        }
    }

}
