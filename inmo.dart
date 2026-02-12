sealed class Inmueble {}

class Casa extends Inmueble {
  final int habitaciones;
  final double metrosCuadrados;
  Casa(this.habitaciones, this.metrosCuadrados);
}

class Apartamento extends Inmueble {
  final int piso;
  final bool tieneAscensor;
  Apartamento(this.piso, this.tieneAscensor);
}

typedef InfoFinanciera = ({
  double lat,
  double lng,
  String zona,
  double precio
});

void procesarCatalogo(List<(Inmueble, InfoFinanciera)> catalogo) {
  print('--- REPORTE DE PROPIEDADES INMODART ---\n');

  for (var (inmueble, info) in catalogo) {

    var (:lat, :lng, :zona, :precio) = info;

    String categoria = switch (inmueble) {
      Casa(habitaciones: > 4) => 'Mansion Familiar',
      Casa() => 'Casa Estandar',
      Apartamento(piso: > 10, tieneAscensor: true) => 'Penthouse / Atico',
      Apartamento(tieneAscensor: false) => 'Dep. Acceso por Escala',
      _ => 'Propiedad General',
    };

    double precioFinal = switch (precio) {
      < 50000 => precio * 0.95,
      >= 50000 && <= 150000 => precio,
      _ => precio * 1.10,
    };

    print('Tipo: $categoria');
    print('Ubicacion: [$lat, $lng] en Zona: $zona');
    print('Precio Final: \$${precioFinal.toStringAsFixed(2)}\n');
  }
}

void main() {

  var listaPropiedades = <(Inmueble, InfoFinanciera)>[
    (
      Casa(5, 250.0),
      (lat: -12.04, lng: -77.03, zona: 'Miraflores', precio: 180000.0)
    ),
    (
      Apartamento(12, true),
      (lat: -12.08, lng: -76.99, zona: 'San Isidro', precio: 120000.0)
    ),
    (
      Apartamento(2, false),
      (lat: -12.12, lng: -77.01, zona: 'Surquillo', precio: 45000.0)
    ),
  ];

  procesarCatalogo(listaPropiedades);
}
