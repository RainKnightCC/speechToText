#include <iostream>
#include "config.h"

#include "sphinxbase/cmd_ln.h"
#include "sphinxbase/logmath.h"
#include "sphinxbase/fe.h"
#include "sphinxbase/feat.h"

//#include "pocketsphinx/pocketsphinx_export.h"
#include "pocketsphinx/pocketsphinx.h"

#include "ekho.h"

#define MODEL_ENGLISG_DIR "/home/smg/Downloads/PocketSphinx/sample/1" // english
#define MODEL_CHINESE_DIR "/home/smg/Downloads/PocketSphinx/sample/2" // chinese

using namespace std;
using namespace ekho;

arg_t const *ps_args(void);

int main()
{
    cout << "Start ..." << endl;
    ps_decoder_t *ps = NULL;
    cmd_ln_t *config = NULL;
    ngram_model_t *model;
    char const *hyp, *uttid;
    int16 buf[512];
    int rv;
    int32 score;
    FILE *file;

    config = cmd_ln_init(NULL, ps_args(), TRUE, "-hmm", MODEL_ENGLISG_DIR"/en-us/en-us", "-lm", MODEL_ENGLISG_DIR"/en-us/en-us.lm.bin", "-dict", MODEL_ENGLISG_DIR"/en-us/cmudict-en-us.dict", NULL);
    if (config == NULL) {
        fprintf(stderr, "Failed to create config object, see log for details\n");
        return -1;
    }

    ps = ps_init(config);
    if (ps == NULL) {
        fprintf(stderr, "Failed to create recognizer, see log for details\n");
        return -1;
    }

    file = fopen("/home/smg/swork/Speed2TextDemo/wadechen_voice.wav", "rb");
    if (file == NULL) {
        fprintf(stderr, "Unable to open input file goforward.raw\n");
        return -1;
    }

    rv = ps_start_utt(ps);
    while (!feof(file)) {
        size_t nsamp;
        nsamp = fread(buf, 2, 512, file);
        rv = ps_process_raw(ps, buf, nsamp, FALSE, FALSE);
    }

    rv = ps_end_utt(ps);
    hyp = ps_get_hyp(ps, &score);
    printf("Recognized: %s\n", hyp);

    string str(hyp);

    fclose(file);
    ps_free(ps);
    cmd_ln_free_r(config);


    Ekho wong("Mandarin");
//    wong.setVoice("pinyin");
//    wong.setEnglishVoice("voice_cmu_us_slt_arctic");
//    wong.blockSpeak("你好嗎? 我今天早晨吃了一碗粥 喝了一杯紅茶 test 123");
    wong.blockSpeak(str);


    return 0;
}
