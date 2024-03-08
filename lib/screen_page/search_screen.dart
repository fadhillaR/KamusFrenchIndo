import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamusfrench_indo/screen_page/detail_screen.dart';
// import 'package:kamusfrench_indo/models/model_kata.dart';

class PageListKata extends StatefulWidget {
  const PageListKata({super.key});

  @override
  State<PageListKata> createState() => _PageListKataState();
}

class _PageListKataState extends State<PageListKata> {  
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _kosakataList = [];
  List<dynamic> _filteredKosakataList = [];

  @override
  void initState() {
    super.initState();
    getKata();
  }

  Future<void> getKata() async {
    final response = await http.get(Uri.parse('http://192.168.100.6/kamusDb/getKata.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        _kosakataList = responseData['data'];
        _filteredKosakataList = _kosakataList;
      });
    } else {
      throw Exception('Failed to load kosakata');
    }
  }

  void _filterKosakata(String query) {
    setState(() {
      _filteredKosakataList = _kosakataList
          .where((kosakata) =>
          kosakata['kosakata'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors  .blue,
        title: Text(
          'Kosa Kata Bahasa Prancis',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    _filterKosakata(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search Data",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.1),
                    suffixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredKosakataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Card(
                      child: ListTile(
                        title: Text(_filteredKosakataList[index]['kosakata']),
                        subtitle: Text(_filteredKosakataList[index]['terjemahan']),
                        // onTap: (){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)
                        //     => PageDetail(_filteredKosakataList[index]['kosakata']),
                        //   ));
                        // },
                      ),
                    ),
                  )
                );
              },
            ),
          ),
        ],
      ),

      // body: Padding(
      //   padding: EdgeInsets.all(10),
      //   child: Column(
      //     children: [
      //       TextFormField(
      //         controller: txtCari,
      //         decoration: InputDecoration(
      //           hintText: "Search Data",
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(10),
      //             borderSide: BorderSide.none
      //           ),
      //           filled: true,
      //           fillColor: Colors.green.withOpacity(0.1)
      //         ),
      //       ),
      //       //kondisi
      //       isCari ?
      //       Expanded(child: ListView.builder(
      //         itemCount: filterDevice.length,
      //           itemBuilder: (context, index){
      //           return ListTile(
      //             title: Text(
      //               filterDevice[index].kosakata!,
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold
      //                 ),
      //             ),
      //           );

      //           })) : CreateFilterList()
      //     ],
      //   ),
      // ),

      // body: Padding(
      //   padding: EdgeInsets.all(16),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Search for word",
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 22.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20.0,
      //       ),
      //       TextField(
      //         style: TextStyle(color: Colors.black),
      //         decoration: InputDecoration(
      //           filled: true,
      //           fillColor: const Color.fromARGB(255, 227, 227, 227),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(8.0),
      //             borderSide: BorderSide.none,
      //           ),
      //           hintText: "eg: halo",
      //           suffixIcon: Icon(Icons.search),
      //           prefixIconColor: Colors.grey,
      //         ),
      //       ),
      //       SizedBox(height: 20.0,),
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: ,
      //           itemBuilder: (context, index) => ListTile(),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // body: FutureBuilder(
      //   future: getKata(),
      //   builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot){
      //     if(snapshot.hasData){
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index){
      //           Datum? data = snapshot.data?[index];
      //           return Padding(
      //             padding: EdgeInsets.all(8),
      //             child: GestureDetector(
      //               onTap: (){
      //                 Navigator.push(context, MaterialPageRoute(builder: (context)
      //                   => PageDetail(data)
      //                 ));
      //               },
      //               child: Card(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     ListTile(
      //                       title: Text("${data?.kosakata}",
      //                         style: TextStyle(
      //                           color: Colors.red,
      //                           fontWeight: FontWeight.bold
      //                         ),
      //                       ),
      //                       subtitle: Text("${data?.terjemahan}",
      //                         maxLines: 2,
      //                         style: TextStyle(
      //                           fontSize: 10,
      //                           color: Colors.black54
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }else if (snapshot.hasError){
      //       return Center(
      //         child: Text(snapshot.error.toString()),
      //       );
      //     }else{
      //       return const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.orange,
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}