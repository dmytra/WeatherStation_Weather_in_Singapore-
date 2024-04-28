#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "apirest.h"
#include <QSslSocket>

    //  https://www.youtube.com/watch?v=BMo8vUrdWZ8

int main(int argc, char *argv[])
{

    #if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    #endif

    QGuiApplication app(argc, argv);

    qInfo() << "\n ######################## \n";

    qDebug() << "Device supports OpenSSL: " << QSslSocket::supportsSsl();

    qInfo() << "\n ######################## \n";

    qInfo() <<QSslSocket::sslLibraryBuildVersionString();

    qInfo() << "\n ######################## \n"
             << "My build Version String is - \n"
             << QSslSocket::sslLibraryBuildVersionString()
             <<  "\n and version string is  \n "
             << QSslSocket::sslLibraryVersionString()
             << "\n ######################## \n";

    ApiRest apirest;

    QQmlApplicationEngine engine;

    //qDebug() << QSslSocket::supportsSsl() << QSslSocket::sslLibraryBuildVersionString() << QSslSocket::sslLibraryVersionString();
    //
    //
    //https://forum.qt.io/topic/149617the-backend-cert-only-does-not-support-qsslkey-qt-android
    //


    qmlRegisterType<ApiRest>("Weather", 1, 0, "ApiRest" );

    engine.rootContext()->setContextProperty("appBridge", &apirest);
    //    QQmlContext* ctx = engine.rootContext();
    //    ctx->setContextProperty("appBridge", &apirest);

    const QUrl url("qrc:/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
