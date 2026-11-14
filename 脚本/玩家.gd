extends CharacterBody2D
class_name 玩家类


@export var 重力: float = 600.0
@export var 移动速度 = 150.0
@export var 跳跃初速度 = 250.0

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():  
		velocity.y += 重力 * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -跳跃初速度
		
	var 水平输入 := Input.get_axis("左移", "右移")
	if 水平输入:
		velocity.x = 水平输入 * 移动速度
	else:
		velocity.x = move_toward(velocity.x, 0, 移动速度)
	move_and_slide()
	
