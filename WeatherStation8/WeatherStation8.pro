QT += quick
QT += network
QT += core
QT += gui
QT += qml



CONFIG      += c++11
CONFIG      += mobility
MOBILITY    += sensors

SOURCES += \
            apirest.cpp \
            main.cpp

HEADERS += \
            apirest.h

resources.files = main.qml  \
    ItemWeather.qml
resources.prefix = /$${TARGET}
RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

#Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


#target.path = /Users/srtsrthwqethqerthsrthwryjwrtsdflly/Downloads/WeatherStation6/bin
#INSTALLS += target


DISTFILES += \
            main.qml \
            ItemWeather.qml

contains(ANDROID_TARGET_ARCH,x86_64) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
