extends Node

enum State{
	Play,
	Building,
	Destroying
}
var CurrentState = State.Play

var Runewood := 500 # Wood
var Voidstone := 500 # Stone
var Lunarium := 100 # Gold
var Ethertite := 1110 # Iron
var AtekGas := 1000 # Food
