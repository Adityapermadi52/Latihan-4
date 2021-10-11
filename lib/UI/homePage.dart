import 'package:flutter/material.dart';
import 'package:latihan_mvvm/UI/PegawaiPage.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
   Widget build(BuildContext context) {
    final appTitle = 'Form Validation';

    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body:  MyCustomFrom(),
        ));
  }
}
    class MyCustomFrom extends StatefulWidget {
  @override
     _MyCustomFromState createState(){
       return _MyCustomFromState();
     }
}

  class _MyCustomFromState extends State<MyCustomFrom> {
  final _formKey = GlobalKey<FormState>();

          TextEditingController namaController = TextEditingController();
          TextEditingController nipController = TextEditingController();
          TextEditingController alamatController = TextEditingController();
          TextEditingController notelpController = TextEditingController();
   final format = DateFormat('yyyy-MM-dd'); 
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
       child: ListView(
        children: <Widget>[
          Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mohon Isi Dengan Lengkap';
                          }
                          return null;
                        },
                          controller: namaController,
                          decoration: InputDecoration(
                          labelText: 'Nama Pegawai',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                        )),
                  ),
                Padding(
                      padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                            controller: nipController,
                            decoration: InputDecoration(
                              labelText: 'NIP ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                                  )),
                      ),
               Padding(
                      padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                            controller: alamatController,
                            decoration: InputDecoration(
                              labelText: 'Alamat',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                                  )),
                      ),
               Padding(
                      padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                            controller: notelpController,
                            decoration: InputDecoration(
                              labelText: 'NO Telp ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                                  )),
                      ),
              Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                              }
                            },
                  child: Text('Submit'),
                ),
              ),
        ],
       ),
    );

      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap:  (i){
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context)=>HomePage()
              ));
              break;
               case 1:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context)=>PegawaiPage()
              ));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
           BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), title: Text("Pegawai")),
        ],
      ); 
  }
  }