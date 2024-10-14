/*
Genera un programa que mostri tots els nombre primers fins a un nombre donat per paràmetre. 
Seguidament, a partir d’aquests nombres primers, mostra una llista de parelles de nombres 
primers la diferència entre els quals sigui de dos. Per exemple:
 */


void main() {

print("Lista de enteros");
List<int> lista = (numerosPrimos(56));
print(lista);
print("Lista de parejas");
print(parejasPrimas(lista));

}
List<int> numerosPrimos(int n) {
    List<int> lista = [2];
    int calculador = 3;
    bool comp;

    while (lista.length < n) {
      comp = true;
        for (int i = 2; i*i <= calculador; i++) {
            if (calculador % i == 0) {
              comp = false;
              break;
            }
        }
        if (comp) {
          lista.add(calculador);
        }
        calculador+=2;
    }
    return lista;
}


List<String> parejasPrimas(List<int> lista) {

  List<String> listaDevuelta = [];
  String texto = "";

  for (int i = 0; i < lista.length-1; i++) {
    if (lista[i]+2 == lista[i+1]) {
      texto = lista[i].toString() + " i " + lista[i+1].toString();
      listaDevuelta.add(texto);
    } 
  }

  return listaDevuelta;
}