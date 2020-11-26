-module(test).
-compile(export_all).

times(X,Y) -> 
    X*Y.

pow(X,Y) when Y==0 -> 1;
pow(X,Y) when Y>0 -> X*pow(X,Y-1). % only use for integer

hello() ->
    io:fwrite("Hello World!~n").

add(X,Y) ->
    X+Y.
add(X,Y,Z) ->
    X+Y+Z.
% pattern matching
current_time() ->
    {H,M,S} = erlang:time(),
    io:format("Bay gio la ~p gio ~p phut ~p giay~n",[H,M,S]).
% use ~p will print exactly what we input
% use ~s convert to string. Ex: [1,2,3] will be converted to [^A,^B,^C]
greet(male,Name) ->
    io:format("Hello Mr.~p~n",[Name]);
greet(female,Name) ->
    io:format("Hello Mrs.~s~n",[Name]);
greet(_,Name) ->
    io:format("Hello ~p~n",[Name]).
%Matching list
head([H|_]) -> H.
second([_,S|_]) -> S.
third([_,_,T|_]) -> T.

same(X,X) -> true;
same(_,_) -> false.
% times list A with number N, return a list
times_list(A,N) ->
    lists:map(fun(X)-> N*X end, A).

valid_month(M) when M=<12, M>=1  -> 
    true;
valid_month(_) -> false.
% fake function calendar:last_day_of_the_month(Y,M)
max_day_of_month(M,Y) ->
    case lists:member(M,[1,2,3,4,5,6,7,8,9,10,11,12]) of
        false -> "invalid";
 	true ->
    	    case lists:member(M,[1,3,5,7,8,10,12]) of
            true -> 31;
	    false ->
		case lists:member(M,[4,6,9,11]) of
	     	    true -> 30;
		    false -> 
			case calendar:is_leap_year(Y) of %
			    true -> 29;
			    false -> 28
			end
     	    	end
  	    end	
    end.
