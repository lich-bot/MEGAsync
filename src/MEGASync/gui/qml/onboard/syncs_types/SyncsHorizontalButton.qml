import QtQuick.Layouts 1.15

import components.buttons 1.0

CardHorizontalButton {

    property alias type: syncsType.type
    property SyncsType syncs: SyncsType { id: syncsType }

}


