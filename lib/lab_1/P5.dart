import "dart:io";
void main(){
  print("Enter 1:");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter 2:");
  int b = int.parse(stdin.readLineSync()!);

  print("Enter + for add:");
  print("Enter - for sub:");
  print("Enter * for multi:");
  print("Enter / for divi:");

  print("Enter Your Choise:");
  int c = int.parse(stdin.readLineSync()!);

  switch(c){
    case 1:
      int ans =a+b;
      print("Addition :: $ans");
      break;

    case 2:
      int ans =a-b;
      print("Subtraction :: $ans");
      break;

    case 3:
    case 3:
      int ans =a*b;
      print("Muliplication :: $ans");
      break;

    case 4:
      var ans =a/b;
      print("Subtraction :: $ans");
      break;

    default:
      print("Enter Valid Number");
      break;
  }
}