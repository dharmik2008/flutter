import 'Dart:io';

class candidate
{
  var cid;
  var cname;
  var cage;
  var cw;
  var ch;

void GetCandidateDetails()
{
  print("Enter candidate id:");
  this.cid=stdin.readLineSync();
  print("Enter candidate name:");
  this.cname=stdin.readLineSync();
  print("Enter candidate age:");
  this.cage =stdin.readLineSync();
  print("Enter candidate w:");
  this.cw =stdin.readLineSync();
  print("Enter candidate h:");
  this.ch =stdin.readLineSync();
}
void  DisplayCandidateDetails(){
    print("candidate id $cid");
    print("candidate name $cname");
    print("candidate age $cage");
    print("candidate weight $cw");
    print("candidate height $ch");

  }
}
void main(){
  var c = new candidate();
  c.GetCandidateDetails();
  c.DisplayCandidateDetails();
}