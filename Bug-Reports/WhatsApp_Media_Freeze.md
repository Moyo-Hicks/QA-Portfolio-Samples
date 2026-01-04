Bug Report: Persistent Audio and UI Deadlock on App Resume
==========================================================

**Project:** WhatsApp Messenger (Android)

**Version:** v2.25.12.80 (Stable Build - June 2025)

**Device:** Xiaomi Poco X4 GT (MediaTek Dimensity 8100)

**OS:** MIUI 14 / Android 13

**Status:** Open

### **Description**

A critical regression was identified in the June 2025 build, where audio from a Status update (video) continues to play through the system media output even after the application is closed or minimised. Upon attempting to reopen the app, the user is met with a persistent blank screen (UI Deadlock), requiring a "Force Stop" of the process to restore functionality.

### **Steps to Reproduce**

1.  Launch WhatsApp and navigate to the **Status/Updates** tab.
    
2.  Open a Status update that contains a video with an active audio track.
    
3.  While the video is playing, use the Android **Home gesture/button** to minimise the app to the background.
    
4.  Observe the system audio output (Audio persists).
    
5.  Attempt to relaunch WhatsApp from the App Drawer or the "Recent Apps" switcher.
    

### **Expected Result**

*   **Step 3:** Audio should terminate or pause immediately upon the onPause() or onStop() activity lifecycle events.
    
*   **Step 5:** The application should resume smoothly to the last active state (Status tab) without UI lag.
    

### **Actual Result**

*   **Step 3:** The video audio continues to stream in the background despite the application no longer being in the foreground.
    
*   **Step 5:** The application launches to a non-responsive blank screen. The system UI remains locked, indicating the Main Thread (UI Thread) is blocked.
    

### **Technical Observations**

*   **Lifecycle Management:** The ExoPlayer or Mediaplayer instance is failing to trigger the release() or pause() methods during the background transition.
    
*   **Thread Deadlock:** The blank screen suggests a race condition where the media codec is holding a lock on the hardware buffer, preventing the app from re-drawing its UI upon resumption.
    

### **Impact**

*   **User Experience:** Major privacy and intrusive noise issue (audio cannot be stopped without killing the app).
    
*   **Functionality:** Critical; effectively locks the user out of the application until a manual process restart is performed.
    

**Severity:** **Critical** (App Unusable / Resource Leak)

**Priority:** **High** (Regression in June 2025 release)
