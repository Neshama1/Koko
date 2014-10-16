/*
 * Copyright (C) 2014 Vishesh Handa <vhanda@kde.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) version 3, or any
 * later version accepted by the membership of KDE e.V. (or its
 * successor approved by the membership of KDE e.V.), which shall
 * act as a proxy defined in Section 6 of version 3 of the license.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

//
// The file is just for testing a different user interface for
// viewing an application
//

import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.0 as QtControls

import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
//QtControls.ApplicationWindow {
    id: root

//    color: "#192629"
    Rectangle {
        color: "#192629"
        anchors.fill: parent
        z: -1
    }

    property string filePath: "/home/vishesh/Images/danbo.jpeg"

    ColumnLayout {
        anchors.fill: parent
        Image {
            id: img
            source: root.filePath
            fillMode: Image.PreserveAspectFit

            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ClipRectangle {
            id: clipRect
            source: img
            visible: false
        }

        QtControls.ToolBar {
            Layout.fillWidth: true

            RowLayout {
                anchors.fill: parent
                PlasmaComponents.ToolButton {
                    iconName: "object-rotate-left"
                    onClicked: img.rotation = img.rotation - 90
                }
                PlasmaComponents.ToolButton {
                    iconName: "object-rotate-right"
                    onClicked: img.rotation = img.rotation + 90
                }
                PlasmaComponents.ToolButton {
                    iconName: "transform-crop"
                    onClicked: {
                        clipRect.visible = !clipRect.visible
                        // Marking the button as in use. It's an ugly way
                        flat = !clipRect.visible
                        // Reset the clip rectangle?
                    }
                }
                PlasmaComponents.ToolButton {
                    iconName: "trash-empty"
                }

                // Spacer
                Item {
                    Layout.fillWidth: true
                }
                QtControls.Slider {
                    value: 0.4
                    Layout.alignment: Qt.AlignRight
                }
            }
        }
    }
}