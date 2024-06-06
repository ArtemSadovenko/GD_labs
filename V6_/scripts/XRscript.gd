extends Node3D

var xr_intrface: XRInterface
# Called when the node enters the scene tree for the first time.
func _ready():
	xr_intrface =XRServer.find_interface("OpenXR")
	if xr_intrface and xr_intrface.is_initialized():
		print("xr_intrface init")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("xr_intrface Error")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
