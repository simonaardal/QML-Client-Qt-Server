#include "server.h"
#include <QTcpServer>
#include <QTcpSocket>
#include <QDebug>

Server::Server(QObject *parent) : QObject(parent)
{
    connect(&server, &QTcpServer::newConnection, this, &Server::newConnection);
}

void Server::start()
{
    server.listen(QHostAddress::Any, 1234);

}

void Server::quit()
{
    server.close();
}

void Server::newConnection()
{
    QTcpSocket *socket = server.nextPendingConnection();
    connect(socket, &QTcpSocket::disconnected, this, &Server::disconnected);
    connect(socket, &QTcpSocket::readyRead, this, &Server::readyRead);

    qInfo() << "Connected" << socket;
}

void Server::disconnected()
{
    QTcpSocket* socket = qobject_cast<QTcpSocket*>(sender());
    qInfo() << "Disconnected" << socket;
}

void Server::readyRead()
{
    QTcpSocket* socket = qobject_cast<QTcpSocket*>(sender());
    qInfo() << "Ready to read" << socket;
    qInfo() << socket->readAll();

}
