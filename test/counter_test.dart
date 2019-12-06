import 'package:exposegundointento/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Contador', (){
    Counter obj = Counter();
    test('El contador debe ser incrementado',(){
    int I =obj.increment(10);
    expect(I, 11);
  });
    test('El contador debe ser decrementado', (){
    int D= obj.decrement(11);
    expect(D, 10);
  });
    test('Es cadena vacia', (){
    String M =obj.error();
    expect(M, "Debe ingresar un valor númerico");
  });
  });
}