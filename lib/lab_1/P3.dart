import "dart:io";
void main(){
  print("The Body Mass Index");
  print("Enter Your Height");
  var H = int.parse(stdin.readLineSync()!) * 0.0254;
  print("Enter Your Weight");
  var W = int.parse(stdin.readLineSync()!) * 0.45359237;

  var BMI=W/(H*H);
  print("BMI = $BMI");
}