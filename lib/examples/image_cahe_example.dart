import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCacheExample extends StatelessWidget {
  const ImageCacheExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cache de imagens')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/100?random=$index',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
            ),
            title: Text('Produto ${index + 1}'),
          );
        },
      ),
    );
  }
}