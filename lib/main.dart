import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/pages/home_page.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Qoute> qoutes = [
//     Qoute(text: 'hello', author: 'edilbert'),
//     Qoute(text: 'hi', author: 'edilbert'),
//     Qoute(text: 'supp', author: 'edilbert'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My List'),
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Column(
//         children: qoutes
//             .map((qoute) => QouteList(
//                 qoute: qoute,
//                 onDelete: () {
//                   setState(() {
//                     qoutes.remove(qoute);
//                   });
//                 }))
//             .toList(),
//       ),
//     );
//   }
// }

// class Qoute {
//   final String text;
//   final String author;
//   const Qoute({required this.text, required this.author});
// }

// class QouteList extends StatelessWidget {
//   final Qoute qoute;
//   final Function() onDelete;
//   const QouteList({required this.qoute, required this.onDelete, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(qoute.text),
//           SizedBox(height: 10),
//           Text(qoute.author),
//           SizedBox(height: 10),
//           TextButton(
//             onPressed: onDelete,
//             child: Icon(Icons.delete),
//           ),
//         ],
//       ),
//     );
//   }
// }
