import 'package:flutter/material.dart';

class Torneos extends StatefulWidget {
  const Torneos({super.key});

  @override
  State<Torneos> createState() => _TorneosState();
}

class _TorneosState extends State<Torneos> {
  final List<String> imageUrls = [
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
    'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Número de columnas
        crossAxisSpacing: 100, // Espacio horizontal entre columnas
        mainAxisSpacing: 40, // Espacio vertical entre filas
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8), // Bordes redondeados
          child: Image.network(
            imageUrls[index],
            fit: BoxFit.cover, // Ajusta la imagen al espacio disponible
          ),
        );
      },
    );
  }
}
