import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamusfrench_indo/models/model_kata.dart';
import 'package:kamusfrench_indo/screen_page/detail_screen.dart';

class PageListDetail extends StatefulWidget {
  const PageListDetail({super.key});

  @override
  State<PageListDetail> createState() => _PageListDetailState();
}

class _PageListDetailState extends State<PageListDetail> {

  Future<List<Datum>?> getKata() async{
    try{
      http.Response res = await http.get(Uri.parse('http://192.168.100.6/kamusDb/getKata.php'));
      return modelKataFromJson(res.body).data;
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          'Kosa Kata Bahasa Prancis',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      
      body: FutureBuilder(
        future: getKata(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                Datum? data = snapshot.data?[index];
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                        => PageDetail(data)
                      ));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text("${data?.kosakata}",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text("${data?.terjemahan}",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else if (snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
        },
      ),
    );
  }
}
