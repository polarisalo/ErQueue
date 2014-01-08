%%%-------------------------------------------------------------------
%%% @author polarisalo@gmail.com
%%% @doc stack code by erlang
%%% Created :  9 Jan 2014
%%%-------------------------------------------------------------------
-module(stack).

-export([new/1,
		 delete/1,
	 	 top/1,
		 push/2,
		 pop/1,
		 empty/1]).
-define(MAX_SIZE,max_size).

new(StackName) ->
	set_max_size(StackName,0).

delete(StackName) ->
	set_max_size(StackName,0).

top(StackName) ->

push(StackName,Value) ->
	MaxSize = get_max_size(StackName),


get_max_size(StackName) ->
	MaxSize = erlang:get({StackName,?MAX_SIZE}),
	case erlang:is_integer(MaxSize) of
		false ->
			0;
		true ->
			MaxSize
	end.
set_max_size(StackName,MaxSize) ->
	erlang:put({StackName,?MAX_SIZE},MaxSize).

set_data(StackName,Local,Value) ->
	erlang:put({StackName,Local},Value).
	
get_data(StackName,Local) ->
	erlang:get({StackName,Local}).