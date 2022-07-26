#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QQuickWidget>
#include <QUdpSocket>
#include "QDebug"
#include "QScreen"
#include "QDateTime"

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);   
    ~MainWindow();

    QUdpSocket *WSocAD;
    QUdpSocket *RSocAD;

private slots:
    void readSocet();

private:
    QQuickWidget* _quickWidget;

};

class DashData : public QObject
{
    Q_OBJECT
private:

    Q_PROPERTY (int curs WRITE setInputData_Curs
                          READ inputCurs
                          NOTIFY onCursChanged)

    int curs;

public:
    DashData(QObject* pobj = 0);

    void setInputData_Curs(const int&);

    int inputCurs ( ) const;


signals:
    void onCursChanged (int);
};
#endif // MAINWINDOW_H
