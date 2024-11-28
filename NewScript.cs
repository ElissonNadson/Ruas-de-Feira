using Godot;
using System;

namespace YourNamespace
{
    public partial class NewScript : Node
    {
        // Chamado quando o nó entra na árvore de cena pela primeira vez.
        public override void _Ready()
        {
            GD.Print("Hello, World!");
        }

        // Chamado a cada frame. 'delta' é o tempo decorrido desde o frame anterior.
        public override void _Process(double delta)
        {
        }
    }
}