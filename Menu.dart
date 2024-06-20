import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  List<String?> nombresAlumnos = [];
  List<String?> temasExposiciones = [];
  int opcion = 0, cantAlumnos = 0, cantTemas = 0;
  String? nombreAlumnos, temasExposicion;

  //Entrada de Algoritmo
  do{
    print("Bienvenido a la aplicacion para la gestion de exposiciones");
    print("Elija lo que quiere hacer");
    print("1. Ingresar alumno(s)");
    print("2. Ingresar un tema de Exposicion");
    print("3. Asignacion aleatoria de grupos de Exposicion");
    print("4. Salir de la aplicacion");
    print("***************************");
    opcion = int.parse(stdin.readLineSync()!);
    print("***************************");
    

    //Procesos de algoritmo
    switch (opcion) {
      case 1:
      print("Ingrese la cantidad de alumnos que desea registrar");
      cantAlumnos = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < cantAlumnos; i++) {
      print("Ingrese el nombre del alumno ${i + 1}");
      nombreAlumnos = stdin.readLineSync();
      nombresAlumnos.add(nombreAlumnos); 
      }
      print(nombresAlumnos);
      print("************************");
      break;
      case 2:
      print("Ingrese la cantidad de temas para exponer");
      cantTemas = int.parse(stdin.readLineSync()!);
      for (var y = 0; y < cantTemas; y++){
        print("Ingrese el tema a exponer #${y + 1}");
        temasExposicion = stdin.readLineSync();
        temasExposiciones.add(temasExposicion);
      }
      print(temasExposiciones);
      print("************************");
    }
  }while (opcion != 4);
}