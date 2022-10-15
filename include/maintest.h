#ifndef __MAIN_TEST_H__
#define __MAIN_TEST_H__

#define DET_MODEL "models/ch_PP-OCRv3_det_infer.onnx"
#define CLS_MODEL "models/ch_ppocr_mobile_v2.0_cls_infer.onnx"
#define REC_MODEL "models/ch_PP-OCRv3_rec_infer.onnx"
#define KEY_FILE  "models/ppocr_keys_v1.txt"

#define THREAD_NUM 3

#ifdef WIN32
const char* DEFAULT_IMG_PATH = "images\\";
#else
const char *DEFAULT_IMG_PATH = "images/";
#endif

const char *DEFAULT_IMG_NAME = "1.jpg";

#endif //__MAIN_TEST_H__
