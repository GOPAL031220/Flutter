import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String _selectedCountry = "India";

  final List<String> _countries = ['India',
    'USA', 'UK', 'Japan', 'France', 'Australia'
  ];

  void _showCountrySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select a Country"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _countries.map((country) {
                return RadioListTile<String>(
                  title: Text(country),
                  value: country,
                  groupValue: _selectedCountry,
                  onChanged: (selected) {
                    setState(() {
                      _selectedCountry = selected!;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country Selector"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Selected Country:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(_selectedCountry, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showCountrySelectionDialog,
              child: const Text("Choose a Country"),
            ),
          ],
        ),
      ),
    );
  }
}
