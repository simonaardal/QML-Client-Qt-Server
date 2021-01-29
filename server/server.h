#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QTcpServer>

class Server : public QObject
{
    Q_OBJECT
public:
    explicit Server(QObject *parent = nullptr);

public slots:
    void start();
    void quit();
    void newConnection();
    void disconnected();
    void readyRead();

private:
    QTcpServer server;

};

#endif // SERVER_H
