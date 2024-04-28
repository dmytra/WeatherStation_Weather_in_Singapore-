QT += quick
QT += network
QT += core
QT += gui
QT += qml

target.path = /Users/ <<user path>> /Downloads/WeatherStation10/bin
INSTALLS += target

# https://doc.qt.io/qt-6.2/android-openssl-support.html
# https://github.com/KDAB/android_openssl
android: include(/Users/   <<user path>>  /Downloads/android_openssl-master/openssl.pri)

CONFIG      += c++11
CONFIG      += mobility
MOBILITY    += sensors

SOURCES += \
            apirest.cpp \
            main.cpp

HEADERS += \
            apirest.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

#Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target




DISTFILES += \
            main.qml \
            ItemWeather.qml

contains(ANDROID_TARGET_ARCH,x86_64) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
