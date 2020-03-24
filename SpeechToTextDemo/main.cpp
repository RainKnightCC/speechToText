#include <QCoreApplication>

#include "config.h"
#include "ekho.h"
#include <stdlib.h>

using namespace ekho;

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    Ekho wong("Cantonese");
    wong.blockSpeak("123");

    return a.exec();
}
