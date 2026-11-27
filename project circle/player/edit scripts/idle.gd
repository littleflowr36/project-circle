class_name Playerstate_stay_idle extends Playerstate


func _init() -> void:
	pass
	#加入其他实例状态的影响

func enter() ->void:
	pass
	#接入外界的信号

func exit() ->void:
	pass
	#发出信号

func handle_input(_event:InputEvent)->Playerstate:
	return next_state
	
	#输入处理


func process(_delta: float) -> Playerstate:
	return


func physics_process(_delta: float) -> Playerstate:
	return
	
	
