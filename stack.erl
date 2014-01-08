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
-define(EMPTY_STACK,0).

new(StackName) ->
	set_max_size(StackName,?EMPTY_STACK),
	ok.

delete(StackName) ->
	MaxSize = get_max_size(StackName),
	[erlang:erase({StackName,Local})||Local<-lists:seq(1,MaxSize)],
	set_max_size(StackName,?EMPTY_STACK),
	ok.

top(StackName) ->
	MaxSize = get_max_size(StackName),
	case MaxSize of
		?EMPTY_STACK ->
			{error,empty_stack};
		_ ->
			get_data(StackName,MaxSize)
	end.

push(StackName,Value) ->
	MaxSize = get_max_size(StackName),
	NewMaxSize = MaxSize + 1,
	set_data(StackName,NewMaxSize,Value),
	set_max_size(StackName,NewMaxSize),
	Value.

pop(StackName) ->
	MaxSize = get_max_size(StackName),
	case MaxSize of
		?EMPTY_STACK ->
			{error,empty_stack};
		_ ->
			NewMaxSize = MaxSize - 1,
			set_max_size(StackName,NewMaxSize),
			get_data(StackName,MaxSize)
	end.

empty(StackName) ->
	case get_max_size(StackName) of
		?EMPTY_STACK ->
			true;
		_ ->
			false
	end.

set_max_size(StackName,MaxSize) ->
	erlang:put({StackName,?MAX_SIZE},MaxSize).

get_max_size(StackName) ->
	MaxSize = erlang:get({StackName,?MAX_SIZE}),
	case erlang:is_integer(MaxSize) of
		false ->
			?EMPTY_STACK;
		true ->
			MaxSize
	end.

set_data(StackName,Local,Value) ->
	erlang:put({StackName,Local},Value).

get_data(StackName,Local) ->
	erlang:get({StackName,Local}).