extends CanvasLayer

func _ready():
	# Esperamos un frame para que el viewport esté listo
	await get_tree().process_frame
	
	var pantalla = get_viewport().get_visible_rect().size
	
	$BtnIzquierda.position = Vector2(20, pantalla.y - 120)
	$BtnDerecha.position = Vector2(150, pantalla.y - 120)
	$BtnSalto.position = Vector2(pantalla.x - 150, pantalla.y - 120)
