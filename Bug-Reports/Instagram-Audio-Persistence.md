Audio persists after scrolling past video post in the feed
======================================================

📝 Description
--------------

When a user scrolls past a video post in the Instagram feed, the audio stream fails to terminate or mute. The audio continues to play in the background while the user views subsequent static image posts or other videos, leading to overlapping audio streams.

🛠️ Environment & Metadata
--------------------------

*   **App Version:** Instagram Android (November 2025 Release)
    
*   **Device:** Xiaomi Poco X4 GT
    
*   **OS:** Android 14 (HyperOS / MIUI 15)
    
*   **Hardware Note:** MediaTek Dimensity 8100 (Potential interaction with system-level Dolby Atmos or Sound Assistant features).
    

👣 Steps to Reproduce
---------------------

1.  Launch **Instagram** and ensure "Videos start with sound" is enabled in settings.
    
2.  Scroll through the main feed until a **Video Post** appears.
    
3.  Tap the video to ensure the audio is audible.
    
4.  Perform a fast scroll (flick) to move at least **two posts past** the video.
    
5.  Observe the audio state as a new post (Image or Video) enters the viewport.
    

📈 Expected Behaviour
--------------------

The audio from the previous video should trigger an onPause() or onStop() event for the media player instance as soon as the post is no longer visible (off-screen), effectively muting or stopping the stream.

📉 Actual Behaviour
------------------

The audio stream remains active. If the next post is also a video, the **audio overlaps**, playing two different soundtracks simultaneously. The background audio only stops if the app is minimized or the user navigates to a different tab (e.g., Profile or Reels).

📸 Evidence & Logs
------------------

*   **Logcat Observation:** MediaSessionService fails to receive ACTION\_PAUSE command upon View Recycling.
    
*   **Audio Focus:** App retains AUDIOFOCUS\_GAIN without releasing it during feed scroll events.
    

🔴 Severity & Priority
----------------------

*   **Severity:** **High** (Degrades core UX; impacts device battery and resource management).
    
*   **Priority:** **P1** (High-impact functional defect for a primary feature).
    
