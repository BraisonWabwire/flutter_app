import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _fileContent = "no data yet";

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/example.txt');
  }

  Future<void> _writeFile() async {
    final file = await _getFile();
    await file.writeAsString("Hello from flutter, this was saved locally.");
  }

  Future<void> _readFile() async{
    try{
      final file=await _getFile();

      if(await file.exists()){
        final content=await file.readAsString();
        setState(() {
          _fileContent=content;
        });
      } else{
        setState(() {
          _fileContent="File not found";
        });
      }
    }catch(e){
      setState(() {
        _fileContent="error reading file: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read file example"),),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(onPressed: _writeFile, child: Text("Write file")),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: _readFile, child: Text("Read file")),
          const SizedBox(height: 20,),
          Text("File content", style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10,),
          Text(_fileContent),
        ],
      ),
      ),
    ) ;
  }
}
