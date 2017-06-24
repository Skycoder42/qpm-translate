#include <QCoreApplication>

int main(int argc, char *argv[])
{
	QCoreApplication a(argc, argv);

	QCoreApplication::translate("CONTEXT", "main translation");

	return a.exec();
}
