QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    BatteryCommands.cpp \
    cp2112.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    BatteryCommands.h \
    GPIO_Config.h \
    SLABCP2112.h \
    SMBusConfig.h \
    cp2112.h \
    mainwindow.h \
    types.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32: LIBS += -L$$PWD/./ -lSLABHIDtoSMBus

INCLUDEPATH += $$PWD/./
DEPENDPATH += $$PWD/./

DISTFILES += \
    SLABHIDDevice.dll \
    SLABHIDtoSMBus.dll \
    SLABHIDtoSMBus.lib

unix:!macx {
    # Use the static SDK library so no vendor .so installation is needed.
    isEmpty(SILABS_LIBDIR): SILABS_LIBDIR = $$PWD/Library/Linux/lib
    !exists($$SILABS_LIBDIR/libslabhidtosmbus.a): error("Place the Linux SDK libslabhidtosmbus.a in $$SILABS_LIBDIR or set SILABS_LIBDIR")
    !exists($$SILABS_LIBDIR/libslabhiddevice.a): error("Place the Linux SDK libslabhiddevice.a in $$SILABS_LIBDIR or set SILABS_LIBDIR")
    CONFIG += link_pkgconfig
    PKGCONFIG += libusb-1.0
    LIBS += $$SILABS_LIBDIR/libslabhidtosmbus.a $$SILABS_LIBDIR/libslabhiddevice.a -lpthread -lrt
}

RESOURCES += \
    myResources.qrc

RC_ICONS = icon.ico
