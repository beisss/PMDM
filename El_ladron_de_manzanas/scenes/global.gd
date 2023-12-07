extends Node

var frutas = 0:
	set(val):
		frutas = val
		if player != null:
			player.actualizaInterfazFrutas()
			$sonido_manzana.play()
	get:
		return frutas
		
var player
