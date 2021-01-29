#include "Scanner.h"
#include <QProcess>
#include <iostream>

Scanner::Scanner(QObject *parent) : QObject(parent)
{

}

void Scanner::onReady()
{
    scan();
}

void Scanner::scan()
{
    QProcess myProcess;
    QString program = "arp";
    QStringList arguments;
    arguments << "-a";
    myProcess.start(program, arguments);
    myProcess.waitForFinished();
    QByteArray result = myProcess.readAllStandardOutput();
    const QString all(result);

    QStringList temp = all.split(" ", Qt::SkipEmptyParts);
    QVector<QString> res;
    QRegExp regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$");

    for(int i = 0; i < temp.length(); i++){
        if(regex.exactMatch(temp[i])){
            if(i != temp.length()-3){
                if(temp[i+2].compare("dynamic") == 0){
                    res.append(temp[i]);
                }
            }
        }
    }

    for(QString &text : res){
        std::cout << text.toStdString() << "\n" << std::endl;
    }
    setList(res);
}

void Scanner::ping()
{
    QProcess myProcess;
    QString program = "ping";
    QStringList arguments;
    arguments << "-t";
    arguments << "192.168.80.114";
    arguments << "-n";
    arguments << "1";
    myProcess.start(program, arguments);
    myProcess.waitForFinished();
    // result = myProcess.readAllStandardOutput();
}

void Scanner::setList(QVector<QString> newList)
{
    m_list = newList;
}

QVector<QString> Scanner::list()
{
    return m_list;
}
