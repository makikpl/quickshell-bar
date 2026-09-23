pragma Singleton

import Quickshell
import QtQuick

Singleton {
    <* if {{is_dark_mode}} *>
    property string barColor: "{{colors.on_primary_fixed.dark.hex}}"
    <* else *>
    property string barColor: "{{colors.secondary_container.light.hex}}"
    <* endif *>
    property string boxColor: "{{colors.inverse_primary.default.hex}}"
    property string textColor: "{{colors.on_secondary_container.default.hex}}"
    property string borderColor: "{{colors.surface_tint.default.hex}}"
    property string errorColor: "{{colors.error.default.hex}}"
}
