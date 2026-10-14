import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileManager extends StatefulWidget {
  @override
  _FileManagerState createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  List<FileSystemEntity> _files = [];

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _files = directory.listSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مدير الملفات'),
      ),
      body: ListView.builder(
        itemCount: _files.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_files[index].path.split('/').last),
            onTap: () {
              // هنا يمكن إضافة وظائف مثل فتح الملف أو المجلد
            },
          );
        },
      ),
    );
  }
}
