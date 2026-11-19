extends CharacterBody2D
class_name 玩家类

var 状态列表 : Array[玩家状态框架类]
var 当前状态: 玩家状态框架类 :
	get : return 状态列表.front()
var 先前状态: 玩家状态框架类 :
	get : return 状态列表[ 1 ]

var 方向: Vector2 = Vector2.ZERO
var 重力: float = 980

func _ready() -> void:
	初始化所有状态()
	pass

func _unhandled_input(_event: InputEvent) -> void:
	_过渡到下一个状态(当前状态.处理输入(_event))
	pass
	
func _process(_delta: float) -> void:
	更新方向()
	_过渡到下一个状态(当前状态.帧更新(_delta))
	pass

func _physics_process(_delta: float) -> void:
	velocity.y += 重力 * _delta
	move_and_slide()
	_过渡到下一个状态(当前状态.物理更新(_delta))
	
	pass

func 初始化所有状态() -> void:
	状态列表 = [] #先清空
	## 获取所有状态
	for 子项 in $"玩家状态机".get_children():
		if 子项 is 玩家状态框架类:
			状态列表.append(子项)
			子项.玩家 = self
		pass
		
	if 状态列表.size() == 0:
		return
		
	## 初始化所有状态
	for 子项 in 状态列表:
		子项.初始化()
	
	## 设置初始状态
	_过渡到下一个状态(当前状态)
	pass
	
	
func _过渡到下一个状态(新状态: 玩家状态框架类) -> void:  
	## 防错准备工作
	if 新状态 == null:
		return
	if 新状态 == 当前状态:
		return
	if 先前状态 != null:
		当前状态.退出()
	
	状态列表.push_front(新状态)
	当前状态.进入()
	状态列表.resize(3) #只保留列表前三项
	pass
	
func 更新方向() -> void:
	#var 先前方向 : Vector2 = 方向
	方向 = Input.get_vector("左移","右移","上移","下移")
	pass
	
	
	
	
	
	
	
	
	
	
	
