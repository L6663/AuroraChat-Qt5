QT += core gui widgets network

CONFIG += c++11
CONFIG -= app_bundle

TEMPLATE = app
TARGET = AuroraClient

include(../AuroraCommon/AuroraCommon.pri)

SOURCES += \
    main.cpp \
    networkmanager.cpp \
    loginwidget.cpp \
    mainwindow.cpp \
    messagebubble.cpp \
    draggabletitlebar.cpp \
    usersearchdialog.cpp \
    friendrequestdialog.cpp \
    creategroupdialog.cpp \
    groupmembersdialog.cpp \
    auroraconfirmdialog.cpp \
    screenshotoverlay.cpp

HEADERS += \
    networkmanager.h \
    loginwidget.h \
    mainwindow.h \
    messagebubble.h \
    draggabletitlebar.h \
    usersearchdialog.h \
    friendrequestdialog.h \
    creategroupdialog.h \
    groupmembersdialog.h \
    auroraconfirmdialog.h \
    screenshotoverlay.h

RESOURCES += \
    resources.qrc
