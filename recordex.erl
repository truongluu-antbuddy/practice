-module(recordex).
-compile(export_all).
-record(per, {name, address, phone, card={}}).
-record(animal, {name, speak, action=[]}).
-record(user, {id, name, group, age}).
% In erlang shell type rd(person, {name, phone, address}).
% call by #person{name="", phone="", address=""}.
per1() ->
   #per{name = "truong",
	address = 'DaNang',
	%phone = '0123456789',
	card = {"10101010"}}.
per1(Name) ->
   #per{name = Name,
	address = 'SaiGon',
	phone = '21212121'}.
% admin_panel: which user have group is 'admin' will be allowed
admin_panel(#user{name=Name,group=admin}) ->
	io:format("~p is allowed~n",[#user.name]), %print 3 is allowed
	Name ++ "is allowed"; %return this, so this line behind print statement
admin_panel(#user{name=Name}) ->
	io:format("~p is not allowed~n",[#user.name]), %print 3 is not allowed
	Name ++ "is not allowed".
%check user have age >= 18
adult_section(U=#user{}) when U#user.age>=18 ->
	allowed;
adult_section(_) ->
	forbidden.
%check animal have which action
action_animal(A=#animal{},Action) ->
case lists:member(Action,A#animal.action) of
	true -> Action;
	false -> no
end;
action_animal(_,_) -> none.
% Dog=#animal{name="Dog",action=[walk,run,bark]}.
% Cat=#animal{name="Cat",action=[run,talk]}.
% Fish=#animal{name="Fish",action=[swim,eat]}.
% Birl=#animal{name="Birl",action=[fly,eat]}.
