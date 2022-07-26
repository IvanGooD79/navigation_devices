#include "mainwindow.h"
#include "QtQml"
#include <QApplication>
#include "QQmlApplicationEngine"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    //w.show();

    qmlRegisterType<DashData> ("com.myinc.DashData", 1, 0, "DashData");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/_Dashboard.qml"));
    engine.load(url);

    return a.exec();
}
