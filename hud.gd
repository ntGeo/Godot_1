extends CanvasLayer

func _ready():
	await get_tree().process_frame
	
	var pantalla = get_viewport().get_visible_rect().size
	
	# Botón salto — abajo a la derecha
	$BtnSalto.position = Vector2(pantalla.x - 180, pantalla.y - 80)
	
	# Joystick — abajo a la izquierda
	$Joystick.position = Vector2(80, pantalla.y - 160)
	
	# Ocultamos los controles táctiles si no es pantalla táctil
	if not DisplayServer.is_touchscreen_available():
		$Joystick.visible = false
		$BtnSalto.visible = false
