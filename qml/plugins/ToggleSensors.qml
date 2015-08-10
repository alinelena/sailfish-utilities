import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0
import Sailfish.Utilities 1.0

ActionItem {
    //% "Toggle Sensors"
    actionName: qsTrId("sailfish-tools-me-toggle-sensors")
    deviceLockRequired: false
    //% "Toggle Sensors, if stopped will start"
    //% "and vice-versa"
    description: qsTrId("sailfish-utilities-me-toggle-sensors-desc")

    function action(on_reply, on_error) {
        tools.request("toggleSensors", {}, {
            on_reply: on_reply, on_error: on_error
        });
    }
}
