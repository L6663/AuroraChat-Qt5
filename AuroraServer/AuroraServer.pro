QT += core network sql

CONFIG += console c++11
CONFIG -= app_bundle

TEMPLATE = app
TARGET = AuroraServer

include(../AuroraCommon/AuroraCommon.pri)

SOURCES += \
    main.cpp \
    chatserver.cpp \
    clientconnection.cpp \
    databasemanager.cpp

HEADERS += \
    chatserver.h \
    clientconnection.h \
    databasemanager.h
