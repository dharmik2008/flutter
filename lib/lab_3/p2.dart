class Animal{
  void animalsound(){
    print("animal sound");
  }
}
class cat extends Animal{
  void animalsound(){
    print("Meow Meow");
  }
}
void main(){
  Animal a=new Animal();
  a.animalsound();
  var cobj = new cat();
  cobj.animalsound();
}