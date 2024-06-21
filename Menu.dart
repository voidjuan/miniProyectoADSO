import 'dart:io';

void main(List<String> args) {
  List<String?> nombresAlumnos = [];
  List<String?> temasExposiciones = [];
  int opcion = 0, cantAlumnos = 0, cantTemas = 0;
  String? nombreAlumnos, temasExposicion;

  //Entrada de Algoritmo
  do {
    print("Bienvenido a la aplicacion para la gestion de exposiciones");
    print("Elija lo que quiere hacer");
    print("1. Ingresar temas de exposicion)");
    print("2. Ingresar alumno(s)");
    print("3. Asignacion aleatoria de grupos de Exposicion");
    print("4. Salir de la aplicacion");
    print("***************************");
    opcion = int.parse(stdin.readLineSync()!);
    print("***************************");

    //Procesos de algoritmo
    switch (opcion) {
      case 1:
        print("Ingrese el nombre del tema que se va a exponer");
        temasExposicion = stdin.readLineSync();
        print("Ingrese la cantidad de estudiantes asociados al grupo");
        cantAlumnos = int.parse(stdin.readLineSync()!);
        temasExposiciones.add(temasExposicion);
        print(temasExposiciones);
        print("************************");
        break;
      case 2:
        print("Ingrese el nombre completo del alumno");
        nombreAlumnos = stdin.readLineSync();
        nombresAlumnos.add(nombreAlumnos);
        print("************************");
        break;
      case 3:
    }
  } while (opcion != 4);
}
