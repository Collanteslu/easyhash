import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class HashPage extends StatefulWidget {
  const HashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HashPage> createState() => _HashPageState();
}

class _HashPageState extends State<HashPage> {
  String _hashString = "";
  String _hashMethod = 'MD5';
  String textoMostrar = "";
  // Digest _hashDecoded = md5.convert("hola mundo");

  void _hashText() {
    var bytes = utf8.encode(_hashString);
    if (_hashMethod == "MD5") {
      textoMostrar = md5.convert(bytes).toString();
    }
    if (_hashMethod == "SHA1") {
      textoMostrar = sha1.convert(bytes).toString();
    }
    if (_hashMethod == "SHA224") {
      textoMostrar = sha224.convert(bytes).toString();
    }
    if (_hashMethod == "SHA256") {
      textoMostrar = sha256.convert(bytes).toString();
    }
    if (_hashMethod == "SHA384") {
      textoMostrar = sha384.convert(bytes).toString();
    }
    if (_hashMethod == "SHA512") {
      textoMostrar = sha512.convert(bytes).toString();
    }

    setState(() {
      textoMostrar = textoMostrar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //caja para introducir el texto sin hashear
          TextField(
            decoration: const InputDecoration(
              labelText: 'Introduce un texto a codificar',
            ),
            onChanged: (String value) {
              setState(() {
                _hashString = value;
                _hashText();
              });
            },
          ),
          //select con loas distintos tipos de hasheo
          DropdownButton<String>(
            value: _hashMethod,
            isExpanded: true,
            onChanged: (String? value) {
              setState(() {
                _hashMethod = value!;
                _hashText();
              });
            },
            items: <String>[
              'MD5',
              'SHA1',
              'SHA224',
              'SHA256',
              'SHA384',
              'SHA512',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SelectableText(
            textoMostrar,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    ));
  }
}
