QT       += core gui
QT       += core gui quickwidgets
QT       += core network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

TARGET = qmlmain
TEMPLATE = app

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

RESOURCES += \
    qml.qrc

DISTFILES += \
    BankBoard.qml \
    BankDuoBoard.qml \
    CompasBoard.qml \
    CounterBoard.qml \
    CounterBox.qml \
    GraficBoard.qml \
    ICO_antena.qml \
    ICO_car_front.qml \
    ICO_car_side.qml \
    ICO_chassis.qml \
    ICO_counter_box.qml \
    InclinometrBoard.qml \
    PitchBoard.qml

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
