extends Control

@onready var progress_bar: ProgressBar = $BarraProgresso
@onready var label_bottom_left: Label = $TextoInferiorEsquerdo
@onready var label_top: Label = $TextoTopo
@onready var fade_rect: ColorRect = $RetanguloDesvanecer

# Lista de mensagens para exibir no topo durante o carregamento
var loading_messages = [
	"Preparando os recursos...",
	"Carregando as ruas de Feira...",
	"Quase pronto! Finalizando detalhes..."
]

func _ready():
	progress_bar.value = 0
	_fade_in()

func _fade_in():
	fade_rect.modulate.a = 1.0
	fade_rect.show()
	fade_rect.create_tween().tween_property(fade_rect, "modulate:a", 0.0, 1.0).connect("finished", Callable(self, "_start_loading"))

func _fade_out():
	fade_rect.create_tween().tween_property(fade_rect, "modulate:a", 1.0, 1.0).connect("finished", Callable(self, "_change_scene"))

func _start_loading():
	var total_steps = 100
	var delay = 0.1  # Tempo de espera entre cada passo
	var message_index = 0
	var message_interval = total_steps / float(loading_messages.size())

	for step in range(total_steps):
		progress_bar.value = step
		
		# Atualiza as mensagens no topo
		if step % int(message_interval) == 0 and message_index < loading_messages.size():
			label_top.text = loading_messages[message_index]
			message_index += 1

		# Cria o atraso entre os passos
		await get_tree().create_timer(delay).timeout

	_fade_out()

func _change_scene():
	get_tree().change_scene_to_file("res://Scenes/Tela_Abertura.tscn")
