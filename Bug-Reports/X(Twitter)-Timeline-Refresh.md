Bug Report: Loss of Scroll Position on App Switch (Timeline Auto-Refresh)
=========================================================================

**Project:** X (formerly Twitter) Android

**Version:** v11.42.0-release.2

**Device:** Xiaomi Poco C75

**OS:** HyperOS 2 / Android 15

**Status:** Open

### **Description**

When switching from the X app to another application and returning within a short duration (under 30 seconds), the "For You" or "Following" timeline performs an unprompted auto-refresh. This causes the user to lose their current scroll position, forcing them to manually search for the post they were previously viewing.

### **Steps to Reproduce**

1.  Launch X and scroll down approximately 20-30 posts into the "For You" timeline.
    
2.  Stop at a specific post and leave the app visible.
    
3.  Use the system navigation to switch to another app (e.g., WhatsApp or Calculator).
    
4.  Wait for approximately 5-10 seconds.
    
5.  Switch back to X using the "Recent Apps" switcher or the app icon.
    

### **Expected Result**

The app should resume in its previous state with the same post visible on the screen. No auto-refresh should occur unless manually triggered by the user (pull-to-refresh).

### **Actual Result**

The app displays the X splash screen for a split second, the timeline jumps to the top (latest posts), and the previous scroll position is lost.

### **Technical Analysis & Hypotheses**

*   **Memory Management:** Even with the upgraded HyperOS 2 and Android 15 optimizations, the Xiaomi Poco C75 may be aggressively killing background processes to save RAM. However, the app should implement onSaveInstanceState or local caching to preserve the scroll Y-offset.
    
*   **Aggressive Polling:** The app’s onResume logic in this specific release (v11.42.0-release.2) may be triggering a network call to fetch new tweets without checking a "Last Refresh" timestamp or verifying if the user has requested new content.
    

### **Impact**

*   **User Retention:** High frustration; users find it difficult to consume long-form content or threads if they are interrupted by a notification or a quick task in another app.
    
*   **Data Usage:** Unnecessary data consumption for users on limited plans due to frequent forced refreshes.
    

**Severity:** **Medium** (Functional/UX Issue)

**Priority:** **Medium** (Affects daily usability)
