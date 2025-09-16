import "dart:io";
void main(){
  int n = int.parse(stdin.readLineSync()!);

  if(n>0){
    print("+ve Number");
  }
  else{
    print("-VE Number");
  }
}