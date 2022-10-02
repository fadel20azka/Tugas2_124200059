import 'package:flutter/material.dart';
import 'package:tugas2prak/detail.dart';
import 'tourism_place.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Utama"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {

          // Instansiasi
          // dengan format
          // final namaClass namaVariabel = namaConstructor
          final TourismPlace place = tourismPlaceList[index];

          // Inkwell mirip seperti button yang bisa diklik dan ada fungsinya
          // Bedanya adalah button hanyalah sebuah tombol
          // Sedangkan Inkwell adalah container yang bisa di klik
          // ElevatedButton menggunakan onPressed, sedangkan InkWell menggunakan onTap
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(place : place)));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.blueAccent
                    ),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(place.imageUrls[0], width: 120,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(place.name, style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 2,
                      ),
                      Text(place.ticketPrice),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}