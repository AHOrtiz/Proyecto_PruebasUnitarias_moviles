import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../counter.dart';
     


class ContadorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}
class _ContadorPageState extends State<ContadorPage>{
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo=0;

  bool ban;
  final myController = TextEditingController();
  Counter obj = Counter();
  @override
  void dispose() {
    // Limpia el controlador cuando el Widddddddget se descarte
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador Full'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de taps:',style: _estiloTexto),
            Text('$_conteo',style: _estiloTexto),
            TextFormField(
              controller:myController,
    keyboardType: TextInputType.text,
    inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
    decoration: InputDecoration(
        labelText:"Ingresa numero", 
        hintText: "El que tu quieras",    
    )
    
            )
            
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(child: Icon(Icons.donut_large),
          backgroundColor: Colors.red,
        onPressed: (){
          setState(() {
            _conteo=int.parse(myController.text);
          });
        },),
        FloatingActionButton( child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: (){
          setState(() {
            _conteo=obj.increment(_conteo);
            
          });
          },
        ),
        FloatingActionButton( child: Icon(Icons.remove),
          backgroundColor: Colors.blue,
        onPressed: (){
          setState(() {
            _conteo=obj.decrement(_conteo);
            
          });
        },
        ),
        FloatingActionButton(
          backgroundColor: Colors.yellow,
        onPressed: () {
          setState(() {
          if(myController.text==""){
            ban=true;
          }else{
            _conteo=int.parse(myController.text);
            ban=false;
          }
          });
          if(ban==true){
            return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Debes ingresar un valor númerico'),
              );
            },
          );
          }else{
            return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('El contador iniciará en '+myController.text),
              );
            },
          );
          }
        },
        tooltip: 'El contador iniciara en $myController!',
        child: Icon(Icons.update),
      ),
        FloatingActionButton( child: Icon(Icons.exposure_zero),
          backgroundColor: Colors.red,
          onPressed: (){
            setState(() {
              _conteo=0;
            });
          },
        ),
      ],
    );
  }
}