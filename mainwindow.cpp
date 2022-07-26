#include "mainwindow.h"


DashData *dd;
MainWindow *mw;
//=====================================================================
DashData::DashData(QObject *pobj) : QObject(pobj)
{
    dd = this;
}

int DashData::inputCurs() const
{ return curs;}

void DashData::setInputData_Curs(const int& data)
{
   curs = data;
   emit onCursChanged(curs);
}

//=====================================================================

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent)
{
    mw = this;
    RSocAD = new QUdpSocket(this);
    RSocAD->bind(QHostAddress::Any,55055,QUdpSocket::ReuseAddressHint);
    connect(RSocAD,SIGNAL(readyRead()),this,SLOT(readSocet()));
}

MainWindow::~MainWindow()
{
    RSocAD->close();
}

void MainWindow::readSocet()
{
    QUdpSocket *udp = qobject_cast<QUdpSocket*>(sender());
    QDateTime UTC(QDateTime::currentDateTimeUtc());
    QDateTime t(UTC.toLocalTime());

        if (udp->hasPendingDatagrams())
        {
           QByteArray rec_data;
           QHostAddress ip;
           quint16 port;

           rec_data.resize(udp->size());
           udp->readDatagram(rec_data.data(),rec_data.size(), &ip, &port);

           QString _ip = ip.toString();
           int p = _ip.lastIndexOf(":");
           _ip = _ip.right(_ip.length()-p-1);

           qDebug() << t.toString("dd MMMM yyyy hh:mm:ss") << " from " << _ip << "::" << port;

           int buff = 0;

            if (rec_data.size() > 1) {
                buff = (quint8)rec_data.at(0);
                buff |=(quint8)rec_data.at(1)<<8;
                if (buff < 360)
                    if (dd->inputCurs() != buff) dd->setInputData_Curs(buff);
            }

        }

}




