extends Panel


func _ready():
	$Button/Powerup/Label.text = "Double cps. Price: "+str(Global.price)
	add_to_group("Store")
	




func _on_Button_pressed():
	if Global.points >= Global.price:
		Global.points-= Global.price
		get_tree().call_group("Store","UpdateUI")
		Global.price = 1.5*Global.price
		Global.multiplier=Global.multiplier*2
		updateUI()
		get_tree().call_group("Store","updatePrice")
		$Button.disabled = true
		$Button.hide()


func updateUI():
	$Button/Powerup/Label.text = "Double cps. Price: "+str(Global.price)
	
func updatePrice():
	$Button/Powerup/Label.text = "Double cps. Price: "+str(Global.price)


func _on_Button_mouse_entered():
	$Button/Powerup.show()
	



func _on_Button_mouse_exited():
	$Button/Powerup.hide()
