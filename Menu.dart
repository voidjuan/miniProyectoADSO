import 'dart:io';
import 'dart:math';

class Tema {
  String temasExposicion;
  int cantAlumnos;
  List<String> alumnosAsignados = [];

  Tema(this.temasExposicion, this.cantAlumnos);
}

List<Tema> temasExposiciones = [];
List<String> nombresAlumnos = [];

int opcion = 0;

void main(List<String> args) {
  do {
    print("Bienvenido a la aplicacion para la gestion de exposiciones");
    print("Elija lo que quiere hacer");
    print("1. Manejo de temas de exposicion)");
    print("2. Manejo de alumno(s)");
    print("3. Asignacion aleatoria de grupos de Exposicion");
    print("4. Trabajar con lista precargada");
    print("5. Salir de la aplicacion");
    print("***************************");
    opcion = int.parse(stdin.readLineSync()!);
    print("***************************");

    //Procesos de algoritmo
    switch (opcion) {
      case 1:
        manejoTemasExposicion();
        break;
      case 2:
        manejoAlumnos();
        break;
      case 3:
        asignarAlumnosAleatoria();
        break;
      case 4:
        precargarDatosPrueba();
        break;
      case 5:
        print("Hasta luego...");
        print("***************************");
        break;
      default:
        print('Opción inválida');
    }
  } while (opcion != 5);
}

void manejoTemasExposicion() {
  int opcion;
  do {
    print("\n Gestión de Temas de Exposición");
    print("1. Crear tema");
    print("2. Editar tema");
    print("3. Eliminar tema");
    print("4. Ver temas");
    print("5. Volver al menu principal");
    print("***************************");
    opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
        crearTema();
        break;
      case 2:
        editarTema();
        break;
      case 3:
        eliminarTema();
        break;
      case 4:
        mostrarTemas();
        break;
      case 5:
        print("Volviendo al menu principal");
        break;
      default:
        print("Opción incorrecta");
    }
  } while (opcion != 5);
}

void crearTema() {
  String nombre = leerCadena("Ingrese el nombre del tema de exposición: ");
  int cantidad = leerEntero("Ingrese la cantidad de alumnos para este tema: ");
  temasExposiciones.add(Tema(nombre, cantidad));
  print("El tema ha sido creado");
}

void editarTema() {
  mostrarTemas();
  if (temasExposiciones.isEmpty) return;

  int numTema = leerEntero("Digite el número del tema que desea editar: ") - 1;
  if (numTema >= 0 && numTema < temasExposiciones.length) {
    String nuevoNombre = leerCadena("Digite un nuevo nombre para el tema: ");
    int nuevaCantidad =
        leerEntero("Digite la nueva cantidad de alumnos del grupo: ");
    temasExposiciones[numTema].temasExposicion = nuevoNombre;
    temasExposiciones[numTema].cantAlumnos = nuevaCantidad;
    print("El tema ha sido editado");
  } else {
    print("Numero inválido");
  }
}

void eliminarTema() {
  mostrarTemas();
  if (temasExposiciones.isEmpty) return;
  int numTema =
      leerEntero("Ingrese el número del tema que desea eliminar: ") - 1;
  if (numTema >= 0 && numTema < temasExposiciones.length) {
    temasExposiciones.removeAt(numTema);
    print("Tema eliminado");
  } else {
    print("Numero inválido");
  }
}

void mostrarTemas() {
  if (temasExposiciones.isEmpty) {
    print('No se han ingresado temas de exposicion');
  } else {
    print('Lista de temas de exposicion:');
    for (int i = 0; i < temasExposiciones.length; i++) {
      print(
          '${i + 1}. ${temasExposiciones[i].temasExposicion} (${temasExposiciones[i].cantAlumnos} alumnos(s))');
    }
  }
}

void manejoAlumnos() {
  int opcion;
  do {
    print("\n Gestión de Alumnos");
    print("1. Agregar Alumno");
    print("2. Editar Alumno");
    print("3. Eliminar Alumno");
    print("4. Mostrar Alumno");
    print("5. Volver al menú principal");

    opcion = leerEntero("Ingrese la opción deseada: ");

    switch (opcion) {
      case 1:
        agregarAlumno();
        break;
      case 2:
        editarAlumno();
        break;
      case 3:
        eliminarAlumno();
        break;
      case 4:
        mostrarAlumnos();
        break;
      case 5:
        print("Volviendo al menu principal");
        break;
      default:
        print("Opción incorrecta");
    }
  } while (opcion != 5);
}

void agregarAlumno() {
  String nombre = leerCadena("Ingrese el nombre del alumno: ");
  nombresAlumnos.add(nombre);
  print("Alumno agregado correctamente");
}

void editarAlumno() {
  mostrarAlumnos();
  if (nombresAlumnos.isEmpty) return;
  int opcion =
      leerEntero("Ingrese el número del alumno que desea editar: ") - 1;
  if (opcion >= 0 && opcion < nombresAlumnos.length) {
    String nuevoNombre = leerCadena("Ingrese el nombre completo del alumno: ");
    nombresAlumnos[opcion] = nuevoNombre;
    print("Alumno editado correctamente");
  } else {
    print("Opción inválida");
  }
}

void eliminarAlumno() {
  mostrarAlumnos();
  if (nombresAlumnos.isEmpty) return;
  int opcion =
      leerEntero("Ingrese el número del alumno que desea eliminar: ") - 1;
  if (opcion >= 0 && opcion < nombresAlumnos.length) {
    nombresAlumnos.removeAt(opcion);
    print("Alumno eliminado correctamente");
  } else {
    print("Opción inválida");
  }
}

void mostrarAlumnos() {
  if (nombresAlumnos.isEmpty) {
    print("No se han registrado alumnos.");
  } else {
    print("Lista de Alumnos:");
    for (int i = 0; i < nombresAlumnos.length; i++) {
      print("${i + 1}. ${nombresAlumnos[i]}");
    }
  }
}

void asignarAlumnosAleatoria() {
  if (temasExposiciones.isEmpty || nombresAlumnos.isEmpty) {
    print(
        "No hay temas y/o alumnos para asignar. Por favor, agregue temas y alumnos antes de asignarlos.");
    return;
  }

  for (var tema in temasExposiciones) {
    tema.alumnosAsignados.clear();
  }

  Random random = Random();
  List<String> alumnosNoAsignados = List.from(nombresAlumnos);

  for (var tema in temasExposiciones) {
    int cantidadAsignar = min(tema.cantAlumnos, alumnosNoAsignados.length);
    for (int i = 0; i < cantidadAsignar; i++) {
      if (alumnosNoAsignados.isNotEmpty) {
        int opcionAleatoria = random.nextInt(alumnosNoAsignados.length);
        tema.alumnosAsignados.add(alumnosNoAsignados[opcionAleatoria]);
        alumnosNoAsignados.removeAt(opcionAleatoria);
      }
    }
  }

  print("\nAsignación de alumnos a temas de exposicion:");
  for (var tema in temasExposiciones) {
    print("${tema.temasExposicion}:");
    for (var Alumno in tema.alumnosAsignados) {
      print("- $Alumno");
    }
  }

  if (alumnosNoAsignados.isNotEmpty) {
    print("\nAlumnos sin temas de exposicion:");
    for (var Alumno in alumnosNoAsignados) {
      print("- $Alumno");
    }
  }
}

void precargarDatosPrueba() {
  temasExposiciones = [
    Tema("Que es POO?", 3),
    Tema("Difrencia entre POO y PE", 3),
    Tema("Objeto, clase y cual es la diferencia ", 3),
    Tema("Que es abstraccion?", 3),
    Tema("Que es encapsulacion?", 3),
    Tema("Que es la herencia?", 4),
    Tema("Que es polimorfismo y de un ejemplo", 4),
    Tema("Principales diagramas de UML", 4),
    Tema("Que es la herencia?", 4),
  ];

  nombresAlumnos = [
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
  
  print("Datos precargados correctamente.");
}

String leerCadena(String Texto) {
  print(Texto);
  String? input = stdin.readLineSync();
  while (input == null || input.isEmpty) {
    print("Por favor, digite de nuevo el valor.");
    input = stdin.readLineSync();
  }
  return input;
}

int leerEntero(String Texto) {
  while (true) {
    print(Texto);
    try {
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        return int.parse(input);
      }
    } catch (e) {
      print("Por favor, digite de nuevo el valor.");
    }
  }
}
