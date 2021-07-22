extends Node


var basevalue = 1
var multiplier = 1



func _ready():
	add_to_group("Store")
	add_to_group("Powerup")
	UpdateUI()


func UpdateUI():
	$HUD/Points.text = str(int(Global.points)) + ' points'


func _on_planet_pressed():
	add_points(basevalue*multiplier)
	var star = load("res://Star.tscn").instance()
	star.position = get_viewport().get_mouse_position()
	add_child(star)
	
func add_points(pts):
	Global.points+=pts
	UpdateUI()
