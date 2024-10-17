void main() {

  List<Cotxe> cotxes = [];
  List<Moto> motos = [];

    Cotxe c1 = new Cotxe.vacio();
    Cotxe c2 = new Cotxe.matricula("4332KBB");
    Cotxe c3 = new Cotxe.complet("4354FFF", "Toyota", "Corola", null);
    Cotxe c4 = new Cotxe.matricula("8785EFF");
    Cotxe c5 = new Cotxe.complet("9888BCC", "SEAT", "Ibiza", "43543419C");

    Moto m1 = new Moto.vacio();
    Moto m2 = new Moto.complet("3998DAW", "Yamaha", "VR9", "44455598A", 90);
    Moto m3 = new Moto.matricula("4443DDD");
    Moto m4 = new Moto.matricula("W3321ED");
    Moto m5 = new Moto.complet("4556VCD", "Suzuki", "XR7", null, 70);

    cotxes.addAll([c1, c2, c3, c4, c5]);
    motos.addAll([m1, m2, m3, m4, m5]);

    Client cli1 = new Client.Simple("4334233D", "Alfredo García");
    Client cli2 = new Client.Completo("98757756C", "Marta Fernandez", "marta@gmail.com", 988954459, 546637728839485812);

    print(c1);
    print(c2);
    print(c3);
    print(c4);
    print(c5);
  

}

// ----------------------------------------------------------
// -------------------------------------------------  CLIENTE

class Client {

  String _dni;
  String _nom;
  String? _email;
  int? _telefon;
  int? _tarjeta;

 Client.Simple(this._dni, this._nom) {}
 Client.Completo(this._dni, this._nom, this._email, this._telefon, this._tarjeta) {}

//SETTERS
set dni(String dni) {
  _dni = dni;
}
set nom(String nom) {
  _nom = nom;
}

set email(String? email) {
  _email = email;
}

set telefon(int? telefon) {
  _telefon = telefon;
}

set tarjeta(int? tarjeta) {
  _tarjeta = tarjeta;
}

//GETTERS
String get dni => _dni;
String get nom => nom;
String? get email => _email; 
int? get telefon => _telefon;
int? get tarjeta => _tarjeta;


// SOBREESCRITURA DE toString()
  @override
  String toString() {
    return 'Client(dni: $_dni,\n nom: $_nom,\n email: ${_email ?? "Sin email"},\n '
           'telefon: ${_telefon ?? "No disponible"},\n tarjeta: ${_tarjeta ?? "No disponible"})';
  }

}


// ----------------------------------------------------------
// ------------------------------------------------  VEHICULO

abstract class Vehicle {

String? _matricula;
String? _marca;
String? _model;
bool _llogat = false;
String? _dniClient;
int _km = 0;

Vehicle.vacio(){}
Vehicle.matricula(this._matricula) {}
Vehicle.complet(this._matricula, this._marca, this._model, this._dniClient){}


//SETTERS
set matricula(String? matricula){
  _matricula = matricula;
}
set marca(String? marca) {
  _marca = marca;
}
set model(String? model) {
  _model = model;
}
set client(String? dniClient) {
  _dniClient = dniClient;
}

//GETTERS
String? get matricula => _matricula;
String? get marca => _marca;
String? get model => _model;
String? get client => _dniClient;
int get km => _km;


//Metodos adicionales
llogat() => _llogat = true;
retornat() => _llogat = false;
bool estaLlogat() => _llogat;
sumaKm(int km) => _km += km;


// SOBREESCRITURA DE toString()
// Añadida una condición que comprueba si está alquilado y, si lo está, añade el dni del cliente. 
  @override
String toString() {
  String data = 'Vehicle --- Matricula: ${_matricula ?? "Matrícula no asignada"},\n'
          'Marca: ${_marca ?? "Marca no asignada"},\n Model: ${_model ?? "Model no asignat"},\n'
          'Está llogat: ${_llogat ?? "no"},\n Km: $_km\n';
          if (_llogat) data += ' DNI Client: $_dniClient';
  return data;
}

}

class Cotxe extends Vehicle {

    Cotxe.vacio(): super.vacio() {}
    Cotxe.matricula(String matricula): super.matricula(matricula) {}
    Cotxe.complet(String matricula, String marca, String model, String? dniClient): super.complet(matricula, marca, model, dniClient){
      if(dniClient != null) llogat(); //Al incluirse un DNI, se entiende que el vehículo está alquilado. 
    }

}

class Moto extends Vehicle {

  int? cilindrada;

  Moto.vacio():super.vacio() {}
  Moto.matricula(String matricula):super.matricula(matricula){}
  Moto.complet(String matricula, String marca, String model, String? dniClient, this.cilindrada):super.complet(matricula, marca, model, dniClient){
     if(dniClient != null ) llogat();
  }
}