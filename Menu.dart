import 'dart:io';
import 'dart:math';

class Tema {
  String temasExposicion;
  int cantAlumnos;
  List<String> estudiantesAsignados = [];

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
        manejoTemas();
        break;
      case 2:
        manejoAlumnos();
        break;
      case 3:
        asignarAlumnosAleatorio();
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

void manejoTemas() {
  int opcion;
  do {
    print("\n Gestión de Temas de Exposición");
    print("1. Crear tema");
    print("2. Editar tema");
    print("3. Eliminar tema");
    print("4. Ver temas");
    print("5. Volver al menú principal");
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
        print("Volviendo al menú principal");
        break;
      default:
        print("Opción incorrecta");
    }
  } while (opcion != 5);
}

void crearTema() {
  String nombre = leerCadena("Ingrese el nombre del tema de exposición: ");
  int cantidad =
      leerEntero("Ingrese la cantidad de estudiantes para este tema: ");
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
        leerEntero("Digite la nueva cantidad de estudiantes del grupo: ");
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
        agregarEstudiante();
        break;
      case 2:
        editarEstudiante();
        break;
      case 3:
        eliminarEstudiante();
        break;
      case 4:
        mostrarEstudiantes();
        break;
      case 5:
        print("Volviendo al menú principal");
        break;
      default:
        print("Opción incorrecta");
    }
  } while (opcion != 5);
}

String leerCadena(String mensaje) {
  print(mensaje);
  String? input = stdin.readLineSync();
  while (input == null || input.isEmpty) {
    print("Por favor, digite de nuevo el valor.");
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
      print("Por favor, digite de nuevo el valor.");
    }
  }
}
