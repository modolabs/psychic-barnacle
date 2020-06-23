(Semi Broken) Todo App!

Hello!

Your task with this Modolabs homework is to fix the bugs and improve the application however you see fit along the way.

The specs are already all green and should still be green when you're finished.

(!!) - urgent
(!) - high priority
() - normal priority

BUGS

- (!!) Creating todo items is currently broken

- (!) Projects with the same title should not be allowed

IMPROVEMENTS

- (!) Switch to "soft" deletes of Project objects. That is flag them as
  deleted in the database and hide them from the UI, but don't actually delete
  them from the database.

- () The UI is a mess and not very pretty. Please make it pretty or at least
  consistent.

NEW FEATURES

- (!) Add a rake task that outputs all projects and their todo items to the command line.

For example:

    Project One
    - [X] Todo Item 1
    - [ ] Todo Item 2
    - [ ] Todo Item 3

    Project Two
    - [ ] Todo Item 1
