extends Panel

export var price = 10
var quantity = 0
var cps = 1

func _ready():
	add_to_group("Store")
	updateUI()


func _process(delta):
	if quantity >= 1:
		$TextureProgress.value = $Timer.time_left


func _on_TextureButton_pressed():
	if Global.points >= price:
		if quantity == 0:
			$Timer.start()
		Global.points-= price
		quantity+=1
		get_tree().call_group("Store","UpdateUI")
		price+=pow(1.1,quantity)
		cps = cps*quantity
		updateUI()
		
		
		
func updateUI():
	$Quantity.text = "Quantity :"+str(quantity)
	$Price.text = "Price :"+str(price)
	$Cps.text = "cps :"+str(cps)
	#get_tree().call_group("Store","add_points",cps)

func _on_Timer_timeout():
	get_tree().call_group("Store","add_points",cps)
	
