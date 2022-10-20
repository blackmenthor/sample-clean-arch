// import 'package:flutter/material.dart';
// import 'package:flutter_clean_arch/api.dart';
// import 'package:flutter_clean_arch/dialogs.dart';
// import 'package:flutter_clean_arch/models.dart';
//
// class JournalSinglePage extends StatefulWidget {
//   const JournalSinglePage({
//     Key? key,
//     required this.id,
//   }) : super(key: key);
//
//   final String id;
//
//   @override
//   State<JournalSinglePage> createState() => _JournalSinglePageState();
// }
//
// class _JournalSinglePageState extends State<JournalSinglePage> {
//
//   dynamic error;
//   Journal? journal;
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       fetchData();
//     });
//   }
//
//   Future<void> fetchData() async {
//     setState(() {
//       journal = null;
//       error = null;
//     });
//
//     try {
//       final resp = await api.getJournal(id: widget.id);
//       setState(() {
//         journal = resp;
//       });
//     } catch (ex) {
//       setState(() {
//         journal = null;
//         error = ex;
//       });
//     }
//   }
//
//   Widget body(BuildContext context) {
//     if (error != null) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Encountered an error while fetching your request',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 16,),
//               MaterialButton(
//                 onPressed: () {
//                   fetchData();
//                 },
//                 color: Colors.blue,
//                 child: const Text(
//                   'Retry',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     if (journal == null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: const [
//             CircularProgressIndicator(),
//             SizedBox(height: 16,),
//             Text(
//               'Loading your data, please wait...',
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.network(
//             journal!.thumbnail,
//             width: 348,
//           ),
//         ),
//         const SizedBox(height: 16,),
//         const Text(
//           'Title:',
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(height: 8,),
//         Text(
//           journal!.title,
//           style: const TextStyle(
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 16,),
//         const Text(
//           'Body:',
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(height: 8,),
//         Text(
//           journal!.body,
//           style: const TextStyle(
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 16,),
//         const Text(
//           'Date:',
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(height: 8,),
//         Text(
//           journal!.date,
//           style: const TextStyle(
//             fontSize: 16,
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Journal Detail Page',
//         ),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               final resp = await showDeleteJournalDialog(
//                   context: context,
//                   id: widget.id,
//               );
//               if (resp ?? false) {
//                 Navigator.pop(context, true);
//               }
//             },
//             icon: const Icon(
//               Icons.delete,
//               size: 18.0,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: body(context),
//     );
//   }
// }
