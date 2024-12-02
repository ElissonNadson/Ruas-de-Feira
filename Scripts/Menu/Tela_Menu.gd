extends Control

var audio_on := true

# Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready() -> void:
    # Conectar os sinais dos botões
    if $NovoJogoBotao:
        $NovoJogoBotao.connect("pressed", Callable(self, "_on_novo_jogo_botao_pressed"))
    if $Botão_Iniciar_jogo:
        $Botão_Iniciar_jogo.connect("pressed", Callable(self, "_on_botao_iniciar_jogo_pressed"))
    if $Botão_Audio_on:
        $Botão_Audio_on.connect("pressed", Callable(self, "_toggle_audio"))
    if $Botão_Audio_off:
        $Botão_Audio_off.connect("pressed", Callable(self, "_toggle_audio"))
    if $Botão_Menu:
        $Botão_Menu.connect("pressed", Callable(self, "_on_botao_menu_pressed"))
    
    # Atualizar estado inicial dos botões de áudio
    _update_audio_buttons()

func _on_novo_jogo_botao_pressed() -> void:
    # Implementar lógica para iniciar um novo jogo
    print("Novo jogo iniciado")
    pass

func _on_botao_iniciar_jogo_pressed() -> void:
    # Implementar lógica para iniciar o jogo
    print("Jogo iniciado")
    pass

func _toggle_audio() -> void:
    # Alternar estado de áudio e atualizar interface
    audio_on = !audio_on
    _update_audio_buttons()
    print("Áudio ativado" if audio_on else "Áudio desativado")

func _update_audio_buttons() -> void:
    # Controlar a visibilidade dos botões de áudio
    $Botão_Audio_on.visible = audio_on
    $Botão_Audio_off.visible = not audio_on

func _on_botao_menu_pressed() -> void:
    # Implementar lógica para voltar ao menu
    print("Voltando ao menu principal")
    pass
