:- dynamic task/4. 
create_task(TaskID, Description, Assignee) :-
    \+ task(TaskID, _, _, _), % verifier si id unique
    assertz(task(TaskID, Description, Assignee, false)), % creer un nouveau task avec les informations specifi es
    format("Task created: ~w.~n", [TaskID]).

assign_task(TaskID, NewAssignee) :-
    task(TaskID, Description, _, Status),
    retract(task(TaskID, Description, _, Status)), %supprimer les taches anciennes pour eviter les duplicats
    assertz(task(TaskID, Description, NewAssignee, Status)),
    format("Task ~w assigned to user: ~w.~n", [TaskID, NewAssignee]).

mark_completed(TaskID) :-
    task(TaskID, Description, Assignee, false),
    retract(task(TaskID, Description, Assignee, false)),
    assertz(task(TaskID, Description, Assignee, true)), % status ='false' to status = 'true'
    format("Task ~w marked as completed.~n", [TaskID]).

display_tasks :-
    task(TaskID, Description, Assignee, Status),
    format("Task ~w:~n", [TaskID]),
    format("- Description: ~w~n", [Description]),
    format("- Assignee: ~w~n", [Assignee]),
    format("- Completion status: ~w~n~n", [Status]),
    fail.
display_tasks.

display_tasks_assigned_to(User) :-
    format("Tasks assigned to ~w:~n", [User]),
    task(TaskID, Description, User, Status),
    format("Task ~w:~n", [TaskID]),
    format("- Description: ~w~n", [Description]),
    format("- Completion status: ~w~n~n", [Status]),
    fail.
display_tasks_assigned_to(_).

display_completed_tasks :-
    format("Completed tasks:~n"),
    task(TaskID, Description, Assignee, true),
    format("Task ~w:~n", [TaskID]),
    format("- Description: ~w~n", [Description]),
    format("- Assignee: ~w~n~n", [Assignee]),
    fail.
display_completed_tasks.

