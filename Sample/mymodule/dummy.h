#ifndef DUMMY_H
#define DUMMY_H

#include <QObject>

class Dummy : public QObject
{
	Q_OBJECT

public:
	explicit Dummy(QObject *parent = nullptr);
};

#endif // DUMMY_H
