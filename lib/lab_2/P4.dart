import "dart:io";
void main(){
  print("enter element of string");
  int n = int.parse(stdin.readLineSync()!);
  List<double> number=[];
  for(int i = 0; i < n;i++)
  {
    print('enter string:${i + 1}:');
    double  num = double.parse(stdin.readLineSync()!);
    number.add(num);
  }
  double total=0;
  for(double i in number)
  {
    total=total+i;
  }
  print('sum is:${total.toStringAsFixed(2)}');
}