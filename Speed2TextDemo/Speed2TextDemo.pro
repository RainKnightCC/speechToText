TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    sonic/sonic.c \
    sonic/wave.c

INCLUDEPATH += /usr/include/espeak/
#INCLUDEPATH += /home/smg/Downloads/ekho/ekho-7.7.1
INCLUDEPATH += /home/smg/swork/Speed2TextDemo/sonic
INCLUDEPATH += /home/smg/swork/Speed2TextDemo/utfcpp/source
#INCLUDEPATH += /home/smg/Downloads/ekho/ekho-7.7.1/src
#INCLUDEPATH += /home/smg/Downloads/ekho/ekho-7.7.1/src

#INCLUDEPATH += /usr/local/espeak/

INCLUDEPATH += /usr/local/include/pocketsphinx/
INCLUDEPATH += /usr/local/include/sphinxbase/



#LIBS += /home/smg/Downloads/ekho/ekho-7.7.1 -l/ekho

PRE_TARGETDEPS += $$PWD/./libekho.a
PRE_TARGETDEPS += $$PWD/./libmusicxml2.a

LIBS += -L$$PWD/./ -lekho
LIBS += -L$$PWD/./ -lmusicxml2

INCLUDEPATH += $$PWD/.
DEPENDPATH += $$PWD/.

LIBS += -lpthread -lsndfile -lpulse-simple -lpulse -lespeak -lpocketsphinx -lsphinxbase -lsphinxad

INCLUDEPATH += $$PWD/../../../../usr/lib/x86_64-linux-gnu
DEPENDPATH += $$PWD/../../../../usr/lib/x86_64-linux-gnu

HEADERS += \
    config.h \
    utfcpp/source/utf8/checked.h \
    utfcpp/source/utf8/core.h \
    utfcpp/source/utf8/unchecked.h \
    utfcpp/source/utf8.h \
    sonic/sonic.h \
    sonic/wave.h


