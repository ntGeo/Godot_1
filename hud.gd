extends CanvasLayer

func _ready():
	await get_tree().process_frame
	
	var pantalla = get_viewport().get_visible_rect().size
	
	# Botones izquierda y derecha — abajo a la izquierda
	$BtnIzquierda.position = Vector2(30, pantalla.y - 80)
	$BtnDerecha.position = Vector2(200, pantalla.y - 80)
	
	# Botón salto — abajo a la derecha con más margen por el scale
	$BtnSalto.position = Vector2(pantalla.x - 180, pantalla.y - 80)
