# Este script controla el movimiento del jugador.
# Hereda de CharacterBody2D, que es un nodo diseñado para personajes
# que necesitan física: gravedad, colisiones, movimiento controlado.
extends CharacterBody2D

# Velocidad horizontal del personaje en píxeles por segundo.
# "const" significa que este valor nunca cambia durante el juego.
const VELOCIDAD = 200.0

# Fuerza del salto. Es negativa porque en Godot el eje Y va hacia abajo,
# entonces para subir necesitamos un valor negativo.
const FUERZA_SALTO = -400.0

# Obtenemos la gravedad definida en la configuración del proyecto.
# Así si alguien cambia la gravedad global, el jugador la respeta automáticamente.
var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")

# _ready() se ejecuta una sola vez cuando el jugador aparece en la escena
func _ready():
	# Inicia la animación idle automáticamente al comenzar el juego
	$AnimatedSprite2D.play("idle")

# _physics_process() se ejecuta 60 veces por segundo, sincronizado con el motor de física.
# "delta" es el tiempo transcurrido desde el último frame (~0.016 segundos).
func _physics_process(delta):
	# Si el jugador está en el aire, aplicamos gravedad.
	# Multiplicar por delta hace que la caída sea igual
	# independiente de la velocidad del computador.
	if not is_on_floor():
		velocity.y += gravedad * delta

	# Si el jugador presiona el botón de salto (Espacio o Enter)
	# y está tocando el suelo, aplicamos la fuerza de salto.
	# is_on_floor() evita que pueda saltar en el aire.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = FUERZA_SALTO

	# get_axis() devuelve -1 si se presiona izquierda, 1 si se presiona derecha,
	# y 0 si no se presiona ninguna. Multiplicado por VELOCIDAD da la velocidad horizontal.
	var direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * VELOCIDAD

	# move_and_slide() aplica la velocidad al personaje y maneja las colisiones
	# automáticamente — detecta suelos, paredes y techos sin código extra.
	move_and_slide()

	# Si el jugador cae más allá de Y=800, cambiamos a la pantalla de Game Over.
	# Este valor puede ajustarse según el tamaño del nivel.
	if position.y > 800:
		get_tree().change_scene_to_file("res://game_over.tscn")
	
	# Voltear el sprite según la dirección de movimiento
	if direccion > 0:
		$AnimatedSprite2D.flip_h = false  # mirando a la derecha
	elif direccion < 0:
		$AnimatedSprite2D.flip_h = true   # mirando a la izquierda
