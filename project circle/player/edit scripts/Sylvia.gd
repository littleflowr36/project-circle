class_name player extends CharacterBody2D
	
#region ///machine variables
var states:Array[Playerstate]
var current_state:Playerstate:
	get:return states.front()
var previous_state:Playerstate:
	get:return states[1]
#endregion


#region ///standard variables
var direction :Vector2=Vector2.ZERO
var gravity:float=90
#endregion

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	change_state(current_state.process(_delta))
	pass
	
	
func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))

func _physics_process(_delta: float) -> void:
	velocity.y+=gravity*_delta
	move_and_slide()
	change_state(current_state.physics_process(_delta))


func initialize_states() ->void:
	states=[]
	for a in $Machine_variables.get_children():
		if a is Playerstate:
			states.append(a)
			a.player=self
	
	if states.size()==0:
		return
	
	change_state(current_state)
	
	for state in  states:
		state._init()

func change_state(new_state=Playerstate)->void:
	if new_state==null or new_state==current_state:
		return 
	if current_state:
		current_state.exit()
	
	states.push_front(new_state)
	current_state.enter()
	states.resize(3)
	
func update_direction()->void:
	var _prev_direciton:Vector2=direction
	direction=Input.get_vector("left","right","up","down")
	pass
