## Ember Persistence Shootout: Pomodoro Tracker 

The to-do list is the de facto standard for testing JS frameworks.

But this is about how Ember's various persistence frameworks deal with real-life apps, so we need something a little larger than a to-do list: we'll build a pomodoro tracker.

### The pomodoro technique

Pomodoros are 25-minute blocks of work, used with 5-minute breaks in between. "Pomodoro" is the Italian word for "tomato", and is so named for the tomato-shaped kitchen timer often used to track your pomodoros.

If you focus for 25 solid minutes, you **complete** the pomodoro.

If you abandon your task for more than a few seconds, you've *abandoned* the pomodoro.

In a nutshell, the Pomodoro technique has you list your day's tasks, estimate the number of pomodoros they'll take you to complete. Then, after each pomodoro is completed, you mark one pomodoro for that task as complete.

This is typically done with pen and paper, but we want to be able to use a webapp so we don't have to carry a pad of paper with us. Plus, we can track how we do day to day, and even run basic analytics on our progress.

Each day, the Pomodoro technique has you reflect on how your day went, and the goal is to improve the number of uninterrupted 25-minute blocks you are able to complete in a day.

### Requirements

The timer is out of scope for this task, you'll have to use the clock to track your 25-minute blocks, and simply use this app the way you would a pad of paper: adding tasks, estimating pomodoros, marking pomodoros as complete or abandoned, and crossing tasks off your list.

Here are the requirements for the app:

- Add a task
- Delete a task
- Mark a task as complete (cross it off the list)
- Add an estimate (# of pomodoros) to a task
- Change (increment/decrement) the estimated number of pomodoros for a task
- Complete a pomodoro
- Abandon a pomodoro
- Tell you how many pomodoros you've completed today