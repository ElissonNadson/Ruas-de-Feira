extends Control

# Lista de imagens (caminho completo dos arquivos)
var patrocinadores = [
	preload("res://Assets/logo_Clinica Radiologica.png"),
	preload("res://Assets/logo_da_hotel_Acalanto.png"),
	preload("res://Assets/logo_da_Prefeitura.png"),
	preload("res://Assets/logo_Fiat_Jacuipe.png")
]

# Índice atual da imagem
var indice_atual = 0

# Referências para nós
@onready var logo = $TextureRect  # O nó que exibe as imagens
@onready var timer = $Timer       # O timer para alternar as imagens
@onready var fundo_preto = $ColorRect  # O nó que exibe o fundo preto
@onready var anim_fade = $AnimationPlayer  # O nó que controla a animação de fade

func _ready():
	# Configura a primeira imagem e inicia a animação de fade in
	logo.texture = patrocinadores[indice_atual]
	anim_fade.play("fade_in")

func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		# Pula para a próxima imagem se a tecla espaço for pressionada
		_proxima_imagem()

func _on_Timer_timeout():
	# Inicia a animação de fade out
	anim_fade.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		_proxima_imagem()
	elif anim_name == "fade_in":
		# Reinicia o timer para a próxima imagem
		timer.start(2)  # Tempo de espera antes de iniciar o fade out

func _proxima_imagem():
	# Avança para a próxima imagem
	indice_atual += 1
	if indice_atual < patrocinadores.size():
		logo.texture = patrocinadores[indice_atual]
		# Inicia a animação de fade in
		anim_fade.play("fade_in")
	else:
		_ir_para_proxima_tela()

func _ir_para_proxima_tela():
	# Muda para a próxima cena (exemplo: tela de carregamento)
	get_tree().change_scene("res://Scenes/Tela_Carregamento.tscn")
