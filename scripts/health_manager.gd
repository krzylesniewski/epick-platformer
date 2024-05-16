extends Node

var max_health: int = 5
var current_health: int

func _ready():
	current_health = max_health

func decreace_health(amount: int):
	current_health -= amount
	
	if current_health < 0:
		current_health = 0
		
	print("Get HIT by " + str(amount))


func increace_health(amount: int):
	current_health += amount
	
	if current_health > max_health:
		current_health = max_health
		
	print("Get HEALTH by " + str(amount))
