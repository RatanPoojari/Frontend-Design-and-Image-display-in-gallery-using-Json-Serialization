// import 'package:flutter/material.dart';
// import 'package:weddings/product.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(context) {
//     return MaterialApp(
//       title: 'Weddings',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 157, 248, 227),
//         appBar: AppBar(
//           title: const Text(
//             'Your Special Moments!',
//           ),
//           centerTitle: true,
//         ),
//         body: const ImageList(),
//       ),
//     );
//   }
// }

// class ImageList extends StatelessWidget {
//   const ImageList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ImageModel>>(
//       future: loadImages(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Directionality(
//             textDirection:
//                 TextDirection.ltr, // Set the text direction to left-to-right
//             child: ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return Image.asset(snapshot.data![index].path);
//               },
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:weddings/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weddings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 157, 248, 227),
        appBar: AppBar(
          title: const Text(
            'Your Special Moments!',
          ),
          centerTitle: true,
        ),
        body: const ImageList(),
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: loadImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No images available'));
        } else {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Image.asset(snapshot.data![index].path);
              },
            ),
          );
        }
      },
    );
  }
}
