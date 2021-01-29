#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Scanner.h"
#include "client.h"
#include <QQuickStyle>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<Scanner>("com.company.scanner", 1, 0, "Scanner");
    qmlRegisterType<Client>("com.company.client", 1, 0, "Client");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
