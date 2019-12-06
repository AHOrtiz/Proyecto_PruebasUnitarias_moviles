  String value = "",mensja;
class Counter{
  int increment(x){
    x++;
    return x;
  }
  int decrement(v){
    v--;
    return v;
  }
  String error(){
   if(value==""){
     mensja="Debe ingresar un valor númerico";
   }
  return mensja;
  }
}