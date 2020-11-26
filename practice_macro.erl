-module (practice_macro).
-define (add(X,Y), X+Y).
-define (times(X,Y), X*Y).
-compile (export_all).

func_add(A,B,C) ->
?add(A,?add(B,C)).

func_times(A,B) ->
?times(A,B).
perimeter(A,B) ->
?times((?add(A,B)),2).

