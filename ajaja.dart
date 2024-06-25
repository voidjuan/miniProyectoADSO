import 'dart:io';
import 'dart:math';

class Tema {
  String nombre;
  int cantidadEstudiantes;
  List<String> estudiantesAsignados = [];

  Tema(this.nombre, this.cantidadEstudiantes);
}

List<Tema> temas = [];
List<String> estudiantes = [];

void main() {
  int opcion;
  do {
    mostrarMenuPrincipal();
    opcion = leerEntero("Ingrese la opción deseada: ");

    switch (opcion) {
      case 1:
        gestionarTemas();
        break;
      case 2:
        gestionarEstudiantes();
        break;
      case 3:
        asignarEstudiantesAleatoriamente();
        break;
      case 4:
        precargarDatosPrueba();
        break;
      case 5:
        print('Saliendo del programa...');
        break;
      default:
        print('Opción inválida');
    }
  } while (opcion != 5);
}

void mostrarMenuPrincipal() {
  print('\nMENU PRINCIPAL');
  print('1. Gestión de temas de exposición');
  print('2. Gestión de estudiantes');
  print('3. Asignar estudiantes aleatoriamente');
  print('4. Precargar datos de prueba');
  print('5. Salir');
}

void gestionarTemas() {
  int opcion;
  do {
    print("\n----- Gestión de Temas de Exposición -----");
    print("1. Crear tema");
    print("2. Editar tema");
    print("3. Mostrar temas");
    print("4. Eliminar tema");
    print("5. Volver al menú principal");

    opcion = leerEntero("Ingrese la opción deseada: ");

    switch (opcion) {
      case 1:
        crearTema();
        break;
      case 2:
        editarTema();
        break;
      case 3:
        mostrarTemas();
        break;
      case 4:
        eliminarTema();
        break;
      case 5:
        print("Volviendo al menú principal");
        break;
      default:
        print("Opción incorrecta");
    }
  } while (opcion != 5);
}

void crearTema() {
  String nombre =
      leerEntrada("Ingrese el nombre del tema de exposición: ");
  int cantidad =
      leerEntero("Ingrese la cantidad de estudiantes para este tema: ");
  temas.add(Tema(nombre, cantidad));
  print("Tema creado correctamente");
}

void editarTema() {
  mostrarTemas();
  if (temas.isEmpty) return;

  int indice =
      leerEntero("Ingrese el número del tema que desea editar: ") - 1;
  if (indice >= 0 && indice < temas.length) {
    String nuevoNombre =
        leerEntrada("Ingrese el nuevo nombre del tema: ");
    int nuevaCantidad =
        leerEntero("Ingrese la nueva cantidad de estudiantes: ");
    temas[indice].nombre = nuevoNombre;
    temas[indice].cantidadEstudiantes = nuevaCantidad;
    print("Tema editado correctamente");
  } else {
    print("Índice inválido");
  }
}

void mostrarTemas() {
  if (temas.isEmpty) {
    print('No hay temas para mostrar.');
  } else {
    print('Lista de temas:');
    for (int i = 0; i < temas.length; i++) {
      print(
          '${i + 1}. ${temas[i].nombre} (${temas[i].cantidadEstudiantes} estudiantes)');
    }
  }
}

void eliminarTema() {
  mostrarTemas();
  if (temas.isEmpty) return;

  int indice =
      leerEntero("Ingrese el número del tema que desea eliminar: ") - 1;
  if (indice >= 0 && indice < temas.length) {
    temas.removeAt(indice);
    print("Tema eliminado correctamente");
  } else {
    print("Índice inválido");
  }
}

void gestionarEstudiantes() {
  int opcion;
  do {
    print("\n----- Gestión de Estudiantes -----");
    print("1. Agregar estudiante");
    print("2. Editar estudiante");
    print("3. Mostrar estudiantes");
    print("4. Eliminar estudiante");
    print("5. Volver al menú principal");

    opcion = leerEntero("Ingrese la opción deseada: ");

    switch (opcion) {
      case 1:
        agregarEstudiante();
        break;
      case 2:
        editarEstudiante();
        break;
      case 3:
        mostrarEstudiantes();
        break;
      case 4:
        eliminarEstudiante();
        break;
      case 5:
        print("Volviendo al menú principal");
        break;
      default:
        print("Opción incorrecta");
    }
  } while (opcion != 5);
}

void agregarEstudiante() {
  String nombre =
      leerEntrada("Ingrese el nombre completo del estudiante: ");
  estudiantes.add(nombre);
  print("Estudiante agregado correctamente");
}

void editarEstudiante() {
  mostrarEstudiantes();
  if (estudiantes.isEmpty) return;

  int indice =
      leerEntero("Ingrese el número del estudiante que desea editar: ") -
          1;
  if (indice >= 0 && indice < estudiantes.length) {
    String nuevoNombre =
        leerEntrada("Ingrese el nuevo nombre completo del estudiante: ");
    estudiantes[indice] = nuevoNombre;
    print("Estudiante editado correctamente");
  } else {
    print("Índice inválido");
  }
}

void mostrarEstudiantes() {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes para mostrar.');
  } else {
    print('Lista de estudiantes:');
    for (int i = 0; i < estudiantes.length; i++) {
      print('${i + 1}. ${estudiantes[i]}');
    }
  }
}

void eliminarEstudiante() {
  mostrarEstudiantes();
  if (estudiantes.isEmpty) return;

  int indice = leerEntero(
          "Ingrese el número del estudiante que desea eliminar: ") -
      1;
  if (indice >= 0 && indice < estudiantes.length) {
    estudiantes.removeAt(indice);
    print("Estudiante eliminado correctamente");
  } else {
    print("Índice inválido");
  }
}

void asignarEstudiantesAleatoriamente() {
  if (temas.isEmpty || estudiantes.isEmpty) {
    print(
        "No hay suficientes temas o estudiantes para realizar la asignación.");
    return;
  }

  // Resetear asignaciones previas
  for (var tema in temas) {
    tema.estudiantesAsignados.clear();
  }

  List<String> estudiantesSinAsignar = List.from(estudiantes);
  Random random = Random();

  for (var tema in temas) {
    int cantidadAsignar =
        min(tema.cantidadEstudiantes, estudiantesSinAsignar.length);
    for (int i = 0; i < cantidadAsignar; i++) {
      if (estudiantesSinAsignar.isNotEmpty) {
        int indiceAleatorio = random.nextInt(estudiantesSinAsignar.length);
        tema.estudiantesAsignados.add(estudiantesSinAsignar[indiceAleatorio]);
        estudiantesSinAsignar.removeAt(indiceAleatorio);
      }
    }
  }

  // Mostrar resultados
  print("\nAsignación de estudiantes a temas:");
  for (var tema in temas) {
    print("${tema.nombre}:");
    for (var estudiante in tema.estudiantesAsignados) {
      print("  - $estudiante");
    }
  }

  if (estudiantesSinAsignar.isNotEmpty) {
    print("\nEstudiantes sin asignar:");
    for (var estudiante in estudiantesSinAsignar) {
      print("  - $estudiante");
    }
  }
}

void precargarDatosPrueba() {
  temas = [
    Tema("que es POO?", 3),
    Tema("difrencia entre POO y PE", 3),
    Tema("objeto, clase y cual es la diferencia ", 3),
    Tema("que es abstraccion?", 3),
    Tema("que es encapsulacion?", 3),
    Tema("que es la herencia?", 4),
    Tema("que es polimorfismo y de un ejemplo", 4),
    Tema("principales diagramas de UML", 4),
    Tema("que es la herencia?", 4),
  ];

  estudiantes = [
    "ANDRES FELIPE SANCHEZ HURTADO",
    "ANGIE DAHIANA RIOS QUINTERO",
    "CRISTIAN ALVAREZ ARANZAZU",
    "DANIEL ESTIVEN ARBOLEDA DUQUE",
    "DAVID ANDRES MORALES GUAPACHA",
    "DAVID STIVEN OCAMPO LONDOÑO",
    "ESTEBAN REYES AGUDELO",
    "JACOBO GALVIS JIMENEZ",
    "JAIME ANDRES CALLE SALAZAR",
    "JEFERSON MAURICIO HERNANDEZ LADINO",
    "JHON ALEXANDER PINEDA OSORIO",
    "JOSE MIGUEL SIERRA ARISTIZABAL",
    "JOSÉ SEBASTIÁN OCAMPO LÓPEZ",
    "JUAN ANDRES OSORIO GOMEZ",
    "JUAN DIEGO CALVO OSORIO",
    "JUAN ESTEBAN LOPEZ CALLE",
    "JUAN PABLO RIOS ARISTIZABAL",
    "MARIA PAULA MELO SOLANO",
    "MIGUEL ANGEL PEÑA JIMENEZ",
    "SAMUEL CASTAÑO CARDONA",
    "JUAN JOSÉ POSADA PÉREZ",
    "ALEJANDRO SERNA LONDOÑO",
    "JUAN MANUEL ZULUAGA RINCON",
    "JUAN DANIEL GOMEZ LASERNA",
    "YERSON STIVEN HERRERA OBANDO",
    "MATEO HERRERA VARGAS",
    "ALEJANDRO VALLEJO ESCOBAR",
  ];

  print("Datos de prueba precargados correctamente.");
}

String leerEntrada(String mensaje) {
  print(mensaje);
  String? input = stdin.readLineSync();
  while (input == null || input.isEmpty) {
    print("Por favor, ingrese un valor válido.");
    input = stdin.readLineSync();
  }
  return input;
}

int leerEntero(String mensaje) {
  while (true) {
    print(mensaje);
    try {
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        return int.parse(input);
      }
    } catch (e) {
      print("Por favor, ingrese un número válido.");
    }
  }
}