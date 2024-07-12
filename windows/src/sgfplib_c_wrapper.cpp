// #include "sgfplib_c_wrapper.h"

// extern "C" {

// int initializeSecuGenSDK() {
//     DWORD err = SGFPM_Create(&m_hFPM);
//     if (err != SGFDX_ERROR_NONE) {
//         return err;
//     }
    
//     // Initialize SGFPM using SGFPM_Init()
//     return SGFPM_Init(m_hFPM, SG_DEV_AUTO); // Auto-detect device
// }

// int openDevice() {
//     DWORD devId = USB_AUTO_DETECT; // Auto detect device ID
//     return SGFPM_OpenDevice(m_hFPM, devId);
// }

// int closeDevice() {
//     if (m_hFPM) {
//         int err = SGFPM_CloseDevice(m_hFPM);
//         m_hFPM = NULL;
//         return err;
//     }
//     return 0;
// }

// int captureFingerprint(unsigned char* fingerprintBuffer, int bufferSize) {
//     return SGFPM_GetImage(m_hFPM, fingerprintBuffer);
// }

// int createFingerprintTemplate(SGFingerInfo* fpInfo, unsigned char* fingerprintBuffer, unsigned char* templateBuffer, int* templateSize) {
//     return SGFPM_CreateTemplate(m_hFPM, fpInfo, fingerprintBuffer, templateBuffer);
// }

// int matchFingerprintTemplates(unsigned char* enrolledTemplateBuffer, int enrolledTemplateSize, unsigned char* capturedTemplateBuffer, int capturedTemplateSize, BOOL* matched) {
//     DWORD secuLevel = 80; // Example security level, replace with appropriate value
//     return SGFPM_MatchTemplate(m_hFPM, enrolledTemplateBuffer, capturedTemplateBuffer, secuLevel, matched);
// }

// int getFingerprintQuality(unsigned char* imgBuf, int width, int height, int* qualityScore) {
//     DWORD quality;
//     DWORD err = SGFPM_GetImageQuality(m_hFPM, width, height, imgBuf, &quality);
//     if (err == SGFDX_ERROR_NONE) {
//         *qualityScore = quality;
//         return 0; // Success
//     }
//     return err; // Return SDK error code
// }

// int adjustBrightness(int brightness) {
//     return SGFPM_SetBrightness(m_hFPM, brightness);
// }

// } // extern "C"
