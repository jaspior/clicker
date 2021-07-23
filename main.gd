extends Node


var basevalue = 1
var multiplier = 1
var counter = 0 


func _ready():
	$Animations/anim.play("Event1")
	add_to_group("Store")
	add_to_group("Powerup")
	UpdateUI()
	

func _process(delta):
	basic_counter()
	normal_counter()
	gatileu_counter()
	catinger_counter()
	gatileu_counter()
	gatonauta_counter()

func UpdateUI():
	$HUD/Points.text = str(int(Global.points)) + ' poimts'


func _on_planet_pressed():
	add_points(basevalue*multiplier)
	var star = load("res://Star.tscn").instance()
	star.position = get_viewport().get_mouse_position()
	add_child(star)
	
func add_points(pts):
	Global.points+=pts
	UpdateUI()

func basic_counter():
	if Global.basic_quantity == 1:
		$Animations/sprites/basic1.show()
	elif Global.basic_quantity == 2:
		$Animations/sprites/basic2.show()
	elif Global.basic_quantity == 3:
		$Animations/sprites/basic3.show()
	elif Global.basic_quantity >= 4:
		$Animations/sprites/basic4.show()

func normal_counter():
	if Global.normal_quantity == 1:
		$Animations/sprites/normal1.show()
	elif Global.normal_quantity == 2:
		$Animations/sprites/normal2.show()
	elif Global.normal_quantity == 3:
		$Animations/sprites/normal3.show()
	elif Global.normal_quantity == 4:
		$Animations/sprites/normal4.show()

func gatileu_counter():
	if Global.gatileu_quantity == 1:
		$Animations/sprites/gatileu.show()
	elif Global.gatileu_quantity == 2:
		$Animations/sprites/Planets/Terra.show()
	elif Global.gatileu_quantity == 3:
		$Animations/sprites/Planets/Sol.show()
	elif Global.gatileu_quantity == 4:
		$Animations/sprites/Planets/Marte.show()
	elif Global.gatileu_quantity == 5:
		$Animations/sprites/Planets/Urano.show()
		
func catinger_counter():
	if Global.catinger_quantity == 1:
		$Animations/sprites/gatinger.show()
	elif Global.catinger_quantity == 2:
		$Control/MarginContainer/HBoxContainer/Game_screen/Game/sky.modulate = Color(1,1,1,.2)
	elif Global.catinger_quantity == 3:
		$Control/MarginContainer/HBoxContainer/Game_screen/Game/sky.modulate = Color(1,1,1,.4)
	elif Global.catinger_quantity == 4:
		$Control/MarginContainer/HBoxContainer/Game_screen/Game/sky.modulate = Color(1,1,1,.6)
	elif Global.catinger_quantity == 5:
		$Control/MarginContainer/HBoxContainer/Game_screen/Game/sky.modulate = Color(1,1,1,.8)
	elif Global.catinger_quantity == 6:
		$Control/MarginContainer/HBoxContainer/Game_screen/Game/sky.modulate = Color(1,1,1,1)

func gatonauta_counter():

	if Global.gatonauta_quantity == 1:
		$Animations/sprites/Gatonauta/Gatonauta.show()
	elif Global.gatonauta_quantity == 2:
		$Animations/sprites/Gatonauta/rocket.show()
	elif Global.gatonauta_quantity == 3:
		$Animations/sprites/Gatonauta/rocket.scale.x = 2
		$Animations/sprites/Gatonauta/rocket.scale.y = 2
	elif Global.gatonauta_quantity == 4:
		$Animations/sprites/Gatonauta/rocket.scale.x = 3
		$Animations/sprites/Gatonauta/rocket.scale.y = 3
	elif Global.gatonauta_quantity == 5:
		$Animations/sprites/Gatonauta/rocket.scale.x = 4
		$Animations/sprites/Gatonauta/rocket.scale.y = 4
	elif Global.gatonauta_quantity >= 6 and counter == 0:
		$Animations/sprites/Gatonauta/rocket.scale.x = 5
		$Animations/sprites/Gatonauta/rocket.scale.y = 5
		$Animations/sprites/Gatonauta/rocket.position.y -= 1
		if $Animations/sprites/Gatonauta/rocket.position.y <= -200:
			counter = 1
			$Animations/sprites/Gatonauta/rocket.queue_free()
