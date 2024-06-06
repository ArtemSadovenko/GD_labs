extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(2))
	



func _on_coin_aria_body_entered(body):
	
	var mat = $The_coin.mesh.get_material();
	$MeshInstance3D.mesh.set_material(mat)
	print("here!!!!!")
