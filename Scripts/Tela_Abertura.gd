extends Control

@onready var logo_textura: TextureRect = $LogoTextura
@onready var fade_retangulo: ColorRect = $FadeRetangulo

var logos = [
	"res://Assets/logo_Clinica Radiologica.png",
	"res://Assets/logo_da_hotel_Acalanto.png",
	"res://Assets/logo_da_Prefeitura.png",
	"res://Assets/logo_Fiat_Jacuipe.png"
]

var indice_logo_atual = 0
var tempo_exibicao = 1.0  # Tempo em segundos para cada logo
var pular_logo = false  # Variável para controlar o pulo de logo

func _ready():
	mostrar_proximo_logo()

func mostrar_proximo_logo():
	if indice_logo_atual < logos.size():
		logo_textura.texture = load(logos[indice_logo_atual])
		indice_logo_atual += 1
		fade_in()
	else:
		mudar_para_proxima_cena()

func fade_in():
	fade_retangulo.modulate.a = 1.0
	fade_retangulo.show()
	var tween = create_tween()
	tween.tween_property(fade_retangulo, "modulate:a", 0.0, 1.0)
	tween.connect("finished", Callable(self, "esperar_exibicao"))

func esperar_exibicao():
	await get_tree().create_timer(tempo_exibicao).timeout
	if not pular_logo:
		fade_out()
	else:
		pular_logo = false
		fade_out()

func fade_out():
	var tween = create_tween()
	tween.tween_property(fade_retangulo, "modulate:a", 1.0, 1.0)
	tween.connect("finished", Callable(self, "mostrar_proximo_logo"))

func mudar_para_proxima_cena():
	get_tree().change_scene_to_file("res://Scenes/Menu/Tela_Menu.tscn")

func _input(event):
	if event.is_action_pressed("ui_accept"):  # Verifica se a tecla espaço foi pressionada
		mudar_para_proxima_cena()  # Pula todos os logos e vai para a próxima cena
