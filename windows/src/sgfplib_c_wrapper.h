#ifndef SGFPLIB_C_WRAPPER_H
#define SGFPLIB_C_WRAPPER_H

#include "sgfplib.h" // Include SecuGen SDK headers

extern HSGFPM m_hFPM; // Declare SGFPM handle as extern

extern "C" {
    int initializeSecuGenSDK();
    int openDevice();
    int closeDevice();
    int captureFingerprint(unsigned char* fingerprintBuffer, int bufferSize);
    int createFingerprintTemplate(SGFingerInfo* fpInfo, unsigned char* fingerprintBuffer, unsigned char* templateBuffer, int* templateSize);
    int matchFingerprintTemplates(unsigned char* enrolledTemplateBuffer, int enrolledTemplateSize, unsigned char* capturedTemplateBuffer, int capturedTemplateSize, BOOL* matched);
    int getFingerprintQuality(unsigned char* imgBuf, int width, int height, int* qualityScore);
    int adjustBrightness(int brightness);
}

#endif // SGFPLIB_C_WRAPPER_H
