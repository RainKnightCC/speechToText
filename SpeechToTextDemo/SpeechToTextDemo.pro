QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

INCLUDEPATH += /home/smg/Downloads/ekho/ekho-7.7.1/
INCLUDEPATH += /home/smg/Downloads/ekho/ekho-7.7.1/sonic/
INCLUDEPATH += /home/smg/Downloads/ekho/ekho-7.7.1/utfcpp/source/
INCLUDEPATH += /usr/local/include/
INCLUDEPATH += /usr/include/

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp

LIBS += -L$$PWD/./ -lekho

#INCLUDEPATH += $$PWD/.
#DEPENDPATH += $$PWD/.

#PRE_TARGETDEPS += $$PWD/./ libekho.a

#LIBS += -L$$PWD/../../../../usr/lib/x86_64-linux-gnu/ -lpulse-simple
#LIBS += -L$$PWD/../../../../usr/lib/x86_64-linux-gnu/ -lstdlib

#INCLUDEPATH += $$PWD/../../../../usr/lib/x86_64-linux-gnu
#DEPENDPATH += $$PWD/../../../../usr/lib/x86_64-linux-gnu
