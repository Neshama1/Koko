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

import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.1

import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

ApplicationWindow {
    id: window

    toolBar: ToolBar {
        RowLayout {
            PlasmaComponents.ToolButton {
                iconName: "draw-arrow-back"
                text: "Back"

                onClicked: {
                    view.pop()
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            Layout.minimumWidth: 400
            Layout.maximumWidth: 400
            Layout.fillHeight: true

            PlasmaExtras.Heading {
                text: "Navigation"
                font.bold: true
                Layout.fillWidth: true
                level: 2
            }

            ColumnLayout {
                Layout.fillWidth: true

                PlasmaExtras.Heading {
                    text: "Locations"
                    font.bold: true
                    Layout.fillWidth: true
                    level: 4
                }
                PlasmaComponents.ToolButton {
                    text: "1000 kms"
                    iconName: "system-search"
                    Layout.fillWidth: true
                    onClicked: {
                        locationView.distance = 1000
                        if (view.currentItem != locationView) {
                            view.push(locationView)
                        }
                    }
                }
                PlasmaComponents.ToolButton {
                    text: "100 kms"
                    iconName: "system-search"
                    Layout.fillWidth: true
                    onClicked: {
                        locationView.distance = 100
                        if (view.currentItem != locationView) {
                            view.push(locationView)
                        }
                    }
                }
                PlasmaComponents.ToolButton {
                    text: "10 kms"
                    iconName: "system-search"
                    Layout.fillWidth: true

                    onClicked: {
                        locationView.distance = 10
                        if (view.currentItem != locationView) {
                            view.push(locationView)
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true

                PlasmaExtras.Heading {
                    text: "Time"
                    font.bold: true
                    Layout.fillWidth: true
                    level: 4
                }
                PlasmaComponents.ToolButton {
                    text: "year"
                    iconName: "system-search"
                    Layout.fillWidth: true
                    onClicked: {
                        timeImages.hours = 24 * 365;
                        if (view.currentItem != timeImages) {
                            view.push(timeImages)
                        }
                    }
                }
                PlasmaComponents.ToolButton {
                    text: "month"
                    iconName: "system-search"
                    Layout.fillWidth: true
                    onClicked: {
                        timeImages.hours = 24 * 30;
                        if (view.currentItem != timeImages) {
                            view.push(timeImages)
                        }
                    }
                }
                PlasmaComponents.ToolButton {
                    text: "week"
                    iconName: "system-search"
                    Layout.fillWidth: true

                    onClicked: {
                        timeImages.hours = 24 * 7;
                        if (view.currentItem != timeImages) {
                            view.push(timeImages)
                        }
                    }
                }
                PlasmaComponents.ToolButton {
                    text: "day"
                    iconName: "system-search"
                    Layout.fillWidth: true

                    onClicked: {
                        timeImages.hours = 24;
                        if (view.currentItem != timeImages) {
                            view.push(timeImages)
                        }
                    }
                }
            }

            Rectangle {
                SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

                color: myPalette.alternateBase
                anchors.fill: parent
                z: -1
            }
        }

        StackView {
            id: view
            Layout.fillWidth: true
            Layout.fillHeight: true

            initialItem: Locations {
                id: locationView
                onImagesSelected: {
                    imageGrid.model = files
                    view.push(imageGrid)
                }
            }

            ImageGrid2 {
                id: imageGrid
                visible: false
                onImageSelected: {
                    imageViewer.filePath = filePath
                    view.push(imageViewer)
                }
            }

            Viewer {
                id: imageViewer
                visible: false
            }

            TimeImages {
                id: timeImages
                visible: false
                onImagesSelected: {
                    imageGrid.model = files
                    view.push(imageGrid)
                }
            }
        }
    }
}
