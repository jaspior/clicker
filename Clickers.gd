extends Panel

export var price = 10
var quantity = 0
export var cps = 1
export var wait_time = 1
export(int, "Green", "Blue","Orange", "Pink", "Yellow") var color

func _ready():
	print(color)
	$Timer.wait_time = wait_time
	add_to_group("Store")
	updateUI()
	if color == 0:
		$TextureRect.modulate = Color( 0.75, 0.84, 0.10, 1 )
	elif color == 1:
		$TextureRect.modulate = Color( 0.19, 0.82, 0.80, 1 )
	elif color == 2:
		$TextureRect.modulate = Color( 0.97, 0.65, 0.07, 1 )
	elif color == 3:
		$TextureRect.modulate = Color( 0.94, 0.12, 0.38, 1 )
	elif color == 4:
		$TextureRect.modulate = Color(.99,1,.61,1)
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
	
