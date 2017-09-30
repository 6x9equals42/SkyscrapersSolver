%% This solves a skyscrapers puzzle that's 6x6.
%% It seems to run really slow unless you solves
%% about half the puzzle yourself replace corresponding squares in
%% definition of S.

%% Set number of buildings starting at the top left, and proceeding
%% clockwise around the grid.
%% Replace the last argument of each accMax/4 with these numbers.
%% comment out with '%' if no number is provided.

%% after editing this file, run by calling
%% ?- start(S).

start(S):-	S=[A1,A2,A3,A4,A5,A6,B1,B2,B3,B4,B5,B6,C1,C2,C3,C4,C5,C6,D1,D2,D3,D4,D5,D6,E1,E2,E3,E4,E5,E6,F1,F2,F3,F4,F5,F6],
		unique(S), views(S).
	
unique([A1,A2,A3,A4,A5,A6,B1,B2,B3,B4,B5,B6,C1,C2,C3,C4,C5,C6,D1,D2,D3,D4,D5,D6,E1,E2,E3,E4,E5,E6,F1,F2,F3,F4,F5,F6]):-
	uniqueline([A1,A2,A3,A4,A5,A6]), uniqueline([B1,B2,B3,B4,B5,B6]),
	uniqueline([C1,C2,C3,C4,C5,C6]), uniqueline([D1,D2,D3,D4,D5,D6]),
	uniqueline([E1,E2,E3,E4,E5,E6]), uniqueline([F1,F2,F3,F4,F5,F6]),
	uniqueline([A1,B1,C1,D1,E1,F1]), uniqueline([A2,B2,C2,D2,E2,F2]),
	uniqueline([A3,B3,C3,D3,E3,F3]), uniqueline([A4,B4,C4,D4,E4,F4]),
	uniqueline([A5,B5,C5,D5,E5,F5]), uniqueline([A6,B6,C6,D6,E6,F6]).

uniqueline(L):- set_equal(L,[1,2,3,4,5,6]).

%% How many buildings we should see from each viewpoint
views([A1,A2,A3,A4,A5,A6,B1,B2,B3,B4,B5,B6,C1,C2,C3,C4,C5,C6,D1,D2,D3,D4,D5,D6,E1,E2,E3,E4,E5,E6,F1,F2,F3,F4,F5,F6]):-
	accMax([A1,A2,A3,A4,A5,A6],0,0,3), 
	accMax([B1,B2,B3,B4,B5,B6],0,0,1), 
	accMax([C1,C2,C3,C4,C5,C6],0,0,2), 
	accMax([D1,D2,D3,D4,D5,D6],0,0,3), 
	accMax([E1,E2,E3,E4,E5,E6],0,0,3), 
	accMax([F1,F2,F3,F4,F5,F6],0,0,2), 
	accMax([F1,E1,D1,C1,B1,A1],0,0,2),
	accMax([F2,E2,D2,C2,B2,A2],0,0,3),
	accMax([F3,E3,D3,C3,B3,A3],0,0,3),
	accMax([F4,E4,D4,C4,B4,A4],0,0,4),
	accMax([F5,E5,D5,C5,B5,A5],0,0,1),
	accMax([F6,E6,D6,C6,B6,A6],0,0,2),
	accMax([F6,F5,F4,F3,F2,F1],0,0,2), 
	accMax([E6,E5,E4,E3,E2,E1],0,0,4), 
	accMax([D6,D5,D4,D3,D2,D1],0,0,2), 
	accMax([C6,C5,C4,C3,C2,C1],0,0,3), 
	accMax([B6,B5,B4,B3,B2,B1],0,0,3), 
	accMax([A6,A5,A4,A3,A2,A1],0,0,4), 
	accMax([A6,B6,C6,D6,E6,F6],0,0,4), 
	accMax([A5,B5,C5,D5,E5,F5],0,0,3), 	
	accMax([A4,B4,C4,D4,E4,F4],0,0,3), 
	accMax([A3,B3,C3,D3,E3,F3],0,0,2),
	accMax([A2,B2,C2,D2,E2,F2],0,0,2), 
	accMax([A1,B1,C1,D1,E1,F1],0,0,2).

%% This function returns the number of times an array has a new highest value
%% as you iterate through it.
accMax([H|T],A,N,Num) :-
    H > A,
    accMax(T,H,N,Num1), Num is Num1 + 1.
 
accMax([H|T],A,N,Num) :-
    H =< A,
    accMax(T,A,N,Num).
 
accMax([],A,N,N).

%% A little function that sets the elements of two lists equal, ignoring order.
set_equal([],[]).
set_equal([H|T],R):- member(H,R),remove(H,R,Rez),set_equal(T,Rez).

%% A function to remove the first instance of an element from a list.
remove(X,[X|T],T).
remove(X,[H|T],[H|R]):-remove(X,T,R).