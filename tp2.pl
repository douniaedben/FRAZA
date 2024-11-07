%1-X est un element de la liste ?:
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

%2- E est le premier element de la liste?:
first(E, [E|_]).

%3-trouve le dernier element de la list:
last(E, [E]).
last(E, [_|T]) :- last(E, T).

%4-trouve l'avant-dernier element de la liste:
penultimate(E, [E,_]).
penultimate(E, [_|T]) :- penultimate(E, T).

%5-supprime l'element k de la liste:
remove_kth(X, [X|T], 1, T).
remove_kth(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    remove_kth(X, T, K1, R).

%6-alcule la longueur  de la liste:
list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

%7-L has an even number of elements?:
even([]).
even([_,_|T]) :- even(T).


%8-Concatner deux listes:
concat([], L, L). %la 1ere liste est vide ==> la concatenation == la 2eme liste
concat([H|T], L, [H|R]) :-
    concat(T, L, R).

%9-palindrome?:
palindrome(L) :- %L == son inverse?
    reverse(L, L).

reverse([], []).
reverse([H|T], R) :-
    reverse(T, RevT),
    concat(RevT, [H], R).






