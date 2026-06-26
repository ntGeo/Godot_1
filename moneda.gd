# Este script controla el comportamiento de una moneda coleccionable.
# Hereda de Area2D, que es un nodo que detecta cuando algo entra en su zona
# sin tener colisión física sólida (el jugador la atraviesa en lugar de chocar).
extends Area2D

# _ready() se ejecuta automáticamente una sola vez cuando la moneda aparece en el juego.
func _ready():
	# Conectamos la señal "body_entered" a nuestra función _on_body_entered.
	# Una señal es un aviso automático — cada vez que un cuerpo físico
	# entre al área de la moneda, Godot llamará a esa función.
	body_entered.connect(_on_body_entered)

# Esta función se ejecuta automáticamente cada vez que un cuerpo físico
# (como el jugador) entra en contacto con el área de la moneda.
# "body" es el nodo que entró — puede ser el jugador u otro objeto.
func _on_body_entered(body):
	# Verificamos que quien entró sea específicamente el jugador
	# comparando su nombre. Así la moneda no reacciona a otras cosas.
	if body.name == "Jugador":
		# Buscamos el nodo Label "Contador" dentro del árbol de escenas.
		# get_tree().root nos da el nodo raíz y get_node() busca por ruta.
		var contador = get_tree().root.get_node("Nivel/HUD/Contador")
		
		# Leemos el número actual del texto "Monedas: X",
		# lo separamos por ": " para obtener solo el número,
		# lo convertimos a entero con int() y le sumamos 1.
		var numero = int(contador.text.split(": ")[1]) + 1
		
		# Actualizamos el texto del contador con el nuevo número.
		# str() convierte el número entero a texto para poder concatenarlo.
		contador.text = "Monedas: " + str(numero)
		
		# Eliminamos la moneda de la escena.
		# queue_free() la borra de forma segura al final del frame actual.
		queue_free()
