import 'package:latihan_mvvm/Model/pegawai.dart';

class ApiStatic{
  static Future<List<Pegawai>> getPegawai() async{
    List<Pegawai> pegawai=[];
    for(var i = 0; i < 8; i++){
      pegawai.add(
        Pegawai(
          idPegawai: i, nama: "Pegawai"+i.toString(), nip: "NIP Pegawai: 000000000"+i.toString(), alamat: "Alamat ", telp: "No Telp: 08596590042", foto: "http://scymark.semarangkota.go.id/daftar-aplikasi/kategori/2019022801491820190130095051pimpinan.png", createdAt:"", updateAt: ""
          )
      );
    }
    return pegawai;
  }
}