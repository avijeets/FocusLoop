# FocusLoop

For a while, I've been thinking about how great and straightforward Apple Watch's Activity loops are in showing you how active you *really* are on a daily basis. Now, imagine there was a similar diagram for your productivity levels.

### y tho

For optimal productivity, I like to set hourly goals ensuring I have something to consistently deliver to keep me on track. FocusLoop lets users set notification routines (triggered every X hours) asking if you are indeed staying productive. If the user prompts yes, the dialog box disappears. If the user prompts no, it brings you to a table of common distractions to let you log what kept you from your goals. 

The paired iOS application then shows (and persists, shout out Core Data) you the log of what held you from your hourly deliverables.

### let me try

Once you've cloned the project, head over to the `DistractionInterfaceController` in the FocusLoopExtension folder. You can set your own common distractions (sadly, just a static array for now) which will let you eventually log them into the app. 

### help me with:

If you like the application, feel free to fork it and mess with it. I've had a couple ideas that I wish would be implemented into this application, listed below:
- Polish iOS app
- User-inputted array of common distractions
- iOS app filters by distraction/day
- Logging hourly goals

