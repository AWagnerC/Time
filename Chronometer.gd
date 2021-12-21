# Script para exibir o tempo como um cronômetro.
# Vamos utilizar o node label para exibir o tempo
extends Label

var time :float # variável responsável por fazer o tempo avançar
var cent :float # centésimos de segundo
var sec :float # segundos
var minutes :float # minutos
var stop = false # pode ser usado para parar o cronômetro

func _ready():
	# Inicialmente, colocamos o tempo inicial para ser 0
	time = 0

func _process(delta):
	if !stop:
		# O time sobe a cada segundo, graças ao delta
		time += delta
		# sec poderia ser igual ao time, no entanto, sabemos que quando os segundos chegam em 60, precisa zerar.
		# o fmod serve justamente para isso, cria um intervalo entre um float e outro float.
		sec = fmod(time, 60)
		# A cada 100 centisegundos, temos um segundo, certo? Então colocamos o intervalo entre 0 e 1 e * 100
		cent = fmod(time, 1) * 100
		# A cada 60 segundos, temos um minuto
		minutes = time/60
		# Veja em notas a importância do %2d, derivado do python e também útil em outras linguagens
		text = str("%02d:%02d:%02d" % [minutes, sec, cent])
	else:
		text = str("%02d:%02d:%02d" % [minutes, sec, cent])
	
	# Este comando opcional serve para parar o cronômetro
#	if Input.is_action_just_pressed("ui_accept"):
#		stop = true
		
# NOTAS

# Os comandos "%nd" e "%ns", sendo n um número inteiro que delimita a quantidade de dígitos,
# servem, respectivamente, para informar que aqui a informação é de (%d) números inteiros e de (%s) strings.
# Como queremos que apareça minutos:segundos:centésimos, com uma limitação de dois dígitos para cada informação,
# usaremos "%02d:%02d:%02d", acompanhado de % [minutes, sec, cent].
# Se fosse para exibir apenas os segundos, usaríamos "%02d" %sec. Usaremos o colchetes para formar uma matriz
# quando houver mais variáveis a serem exibidas.

