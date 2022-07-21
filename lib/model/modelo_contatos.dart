class ModeloContato {
  final String Nome;
  final int Telefone;

  ModeloContato({required this.Nome, required this.Telefone});

  @override
  String toString() {
    return 'ModeloContato{Nome: $Nome, Telefone: $Telefone}';
  }
}