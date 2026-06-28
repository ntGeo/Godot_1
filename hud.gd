extends CanvasLayer

func _ready():
	# Obtenemos el tamaño real de la pantalla
	var pantalla = get_viewport().get_visible_rect().size
	
	# Botón izquierda — abajo a la izquierda
	$BtnIzquierda.position = Vector2(20, pantalla.y - 80)
	
	# Botón derecha — al lado del izquierda
	$BtnDerecha.position = Vector2(130, pantalla.y - 80)
	
	# Botón salto — abajo a la derecha
	$BtnSalto.position = Vector2(pantalla.x - 100, pantalla.y - 80)
