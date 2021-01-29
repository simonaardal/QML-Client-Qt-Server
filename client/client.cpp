#include "client.h"

Client::Client(QObject *parent) : QObject(parent)
{
    connect(&socket, &QTcpSocket::connected, this, &Client::connected);
    connect(&socket, &QTcpSocket::disconnected, this, &Client::disconnected);
    connect(&socket, &QTcpSocket::readyRead, this, &Client::readyRead);
    connect(&socket, QOverload<QAbstractSocket::SocketError>::of(&QAbstractSocket::error), this, &Client::error);
}

void Client::connectToHost(QString host, quint16 port)
{
    if(socket.isOpen()){
        disconnect();
    }

    qInfo() << "Connecting to: " << host << " on port " << port;

    socket.connectToHost(host, port);
}

void Client::disconnect()
{
    socket.close();
}

void Client::writeUp()
{
    socket.write("Go up!\r\n");
}

void Client::writeRight()
{
    socket.write("Go right!\r\n");
}

void Client::writeDown()
{
    socket.write("Go down!\r\n");
}

void Client::writeLeft()
{
    socket.write("Go left!\r\n");
}

void Client::connected()
{
    emit connectedToHost();
    qInfo() << "Connected";
    qInfo() << "Sending...";
    socket.write("Greetings from client!\r\n");
}

void Client::disconnected()
{
    qInfo() << "Disconnected";
}

void Client::error(QAbstractSocket::SocketError socketError)
{
    qInfo() << "Error: " << socketError << socket.errorString();
}


void Client::readyRead()
{
    qInfo() << "data from " << sender();
    qInfo() << "Data: " << socket.readAll();
}
