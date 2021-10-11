import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/pegawai.dart';
import 'package:latihan_mvvm/Services/apiStatic.dart';
import 'package:latihan_mvvm/UI/detailPegawaiPage.dart';
import 'package:latihan_mvvm/UI/homePage.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({ Key? key }) : super(key: key);

  @override
  _PegawaiPageState createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Daftar Pegawai Loka POM"),
      ),
      body: FutureBuilder<List<Pegawai>>(
        future: ApiStatic.getPegawai(),
        builder: (context, snapshot){
            if (snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
                List<Pegawai> listPegawai=snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index)=>Column(
                      children: [
                        InkWell(
                          onTap:  (){
                               Navigator.of(context).push(new MaterialPageRoute(
                                 builder: (BuildContext context)=>DetailPegawaiPage(pegawai: listPegawai[index],)
                                   ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(width: 1,color: Colors.lightGreenAccent)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Image.network(listPegawai[index].foto,width: 40,),
                              Column(
                                children:[
                                  Text(listPegawai[index].nama),
                                ],
                              )
                              ],
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                );
            }
        },
    ),
   bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
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
      ),
    );
  }
}