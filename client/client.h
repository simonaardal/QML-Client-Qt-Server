#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>

class Client : public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = nullptr);

signals:
    void connectedToHost();
public slots:
    void connectToHost(QString host, quint16 port);
    void disconnect();
    void writeUp();
    void writeRight();
    void writeDown();
    void writeLeft();

private slots:
    void connected();
    void disconnected();
    void error(QAbstractSocket::SocketError socketError);
    void readyRead();
private:
    QTcpSocket socket;

};

#endif // CLIENT_H
