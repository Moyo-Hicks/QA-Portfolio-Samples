Bug Report: Deep Link Routing Failure (Incorrect Content Display)
=================================================================

**Project:** TikTok Mobile App (Android/iOS)

**Version:** Persistent since v28.x (Observed since 2024)

**Device:** Cross-Platform (Observed on Xiaomi Poco X4 GT, Poco C75, and iPhone 13)

**Status:** Open / Long-standing Regression

### **Description**

An intermittent issue where clicking a shared TikTok URL (e.g., vt.tiktok.com/...) occasionally fails to route the user to the specific video associated with the link. While the application launches correctly, it periodically displays an unrelated video - often the first video in the "For You" feed or a previously cached post - instead of the intended content.

### **Steps to Reproduce**

1.  Receive a TikTok share link via an external messaging app (WhatsApp, Telegram, or SMS).
    
2.  Ensure the TikTok app is either closed or running in the background.
    
3.  Click the shared link (e.g., https://vm.tiktok.com/ZM.../).
    
4.  Observe the video that loads once the app opens.
    
5.  **Note:** If the correct video loads, repeat steps 1–4 with different links, as the failure occurs occasionally (approximately 3 out of 10 attempts).
    

### **Expected Result**

The app should consistently resolve the deep link and play the specific video shared by the sender.

### **Actual Result**

The app opens correctly, but occasionally, the video displayed is unrelated to the shared link. The user often has to click the link multiple times before the app eventually routes to the correct content.

### **Technical Analysis & Hypotheses**

*   **Intermittent Parsing Error:** The Intent filter in the Android Manifest captures the URL, but the VideoID parameter may occasionally fail to pass to the Video Player Activity due to a timing issue or null pointer.
    
*   **Race Condition:** The app may be triggering the "Default Feed" fetch and the "Deep Link" fetch simultaneously. The failure occurs when the default feed returns faster and overrides the deep link metadata.
    
*   **Short-link Resolution Latency:** TikTok uses shortened URLs. The server-side redirect that resolves these to the actual item\_id may occasionally timeout or fail to pass the metadata to the app's internal router.
    

### **Impact**

*   **Viral Growth/Sharing:** Significant impact on the core "Share" functionality, as users cannot rely on links to show specific content to peers.
    
*   **User Frustration:** High friction in the user journey; requires manual workarounds (re-clicking) to see intended content.
    

**Severity:** **Major** (Core feature failure)

**Priority:** **High** (Directly impacts content discovery and sharing metrics)
