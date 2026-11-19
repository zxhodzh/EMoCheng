@icon("res://状态/state.svg")
extends Node
class_name 玩家状态框架类


var 玩家: 玩家类
var 下一个状态: 玩家状态框架类


func 初始化() -> void:
	pass
	
func 进入() -> void:
	pass

func 退出() -> void:
	pass

func 处理输入(_event: InputEvent) -> 玩家状态框架类:
	return 下一个状态

func 帧更新(_delta: float) -> 玩家状态框架类:
	return 下一个状态
	
func 物理更新(_delta: float) -> 玩家状态框架类:
	return 下一个状态
	
	
	
	
