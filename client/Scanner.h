#ifndef SCANNER_H
#define SCANNER_H

#include <QObject>

class Scanner : public QObject
{
    Q_OBJECT
public:
    explicit Scanner(QObject *parent = nullptr);
    Q_PROPERTY(QVector<QString> list READ list WRITE setList NOTIFY listChanged)

signals:
    void listChanged();
    void pingStarted();
    void pingFinished();

public slots:
    void onReady();
    void scan();
    void ping();

private:

    void setList(QVector<QString> list);
    QVector<QString> list();
    QVector<QString> m_list;

};

#endif // SCANNER_H
