import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  List<dynamic>? _data;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final String? endpoint = dotenv.env['API_ENDPOINT']! + '/vendor';
    final String? token = dotenv.env['API_TOKEN'];
    if (endpoint == null || token == null) {
      setState(() {
        _error = 'API endpoint or token not found in .env';
        _loading = false;
      });
      return;
    }
    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Authorization': 'Bearer ' + token,
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        setState(() {
          _data = decoded['data'] as List<dynamic>?;
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to fetch data: ' + response.statusCode.toString();
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: ' + e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barang'),
      ),
      drawer: const MainDrawer(currentPage: 'barang'),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _error != null
                ? Text(_error!, style: const TextStyle(color: Colors.red))
                : (_data != null && _data!.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: _data!.length,
                        itemBuilder: (context, index) {
                          final vendor = _data![index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              title: Text(vendor['nama_vendor'] ?? ''),
                              subtitle: Text(vendor['alamat'] ?? ''),
                              trailing: Text(vendor['telepon'] ?? ''),
                            ),
                          );
                        },
                      )
                    : const Text('No data'),
      ),
    );
  }
}
