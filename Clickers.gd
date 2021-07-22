extends Panel

export var price = 10
var quantity = 0
export var cps = 1
export var wait_time = 1

func _ready():
	$Timer.wait_time = wait_time
	add_to_group("Store")
	updateUI()


func _process(delta):
	if quantity >= 1:
		$TextureProgress.value = $Timer.time_left/wait_time


func _on_TextureButton_pressed():
	if Global.points >= price:
		if quantity == 0:
			$Timer.start()
		Global.points-= price
		quantity+=1
		get_tree().call_group("Store","UpdateUI")
		price = 1.07*price
		cps = 1.07*cps
		updateUI()
		
		
		
func updateUI():
	$Quantity.text = "Quantity :"+str(quantity)
	$Price.text = "Price :"+str(int(price))
	$Cps.text = "cps :"+str(int(cps))
	#get_tree().call_group("Store","add_points",cps)

func _on_Timer_timeout():
	get_tree().call_group("Store","add_points",cps)
	
