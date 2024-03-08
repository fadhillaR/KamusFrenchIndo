import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    );
  }
}