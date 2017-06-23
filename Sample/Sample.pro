TEMPLATE = app

QT += core
QT -= gui

CONFIG += console c++11
CONFIG -= app_bundle

TARGET = Sample

DEFINES += QT_DEPRECATED_WARNINGS

include(../de_skycoder42_qpm-translate.pri)
include(dummy.pri)

SOURCES += main.cpp

TRANSLATIONS += sample_de.ts
