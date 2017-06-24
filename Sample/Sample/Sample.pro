TEMPLATE = app

QT += core
QT -= gui

CONFIG += console c++11
CONFIG -= app_bundle

TARGET = Sample

DEFINES += QT_DEPRECATED_WARNINGS

include(vendor/vendor.pri) #dummy to simlulate qpm behavior

SOURCES += main.cpp

TRANSLATIONS += sample_de.ts

DISTFILES += \
	sample.py

sample.target = translations
sample.commands = cd $$PWD && ./sample.py
QMAKE_EXTRA_TARGETS += sample
