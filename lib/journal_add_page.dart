// import 'package:flutter/material.dart';
// import 'package:flutter_clean_arch/api.dart';
// import 'package:flutter_clean_arch/dialogs.dart';
// import 'package:image_picker/image_picker.dart';
//
// class JournalAddPage extends StatefulWidget {
//   const JournalAddPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<JournalAddPage> createState() => _JournalAddPageState();
// }
//
// class _JournalAddPageState extends State<JournalAddPage> {
//
//   final ImagePicker _picker = ImagePicker();
//
//   String? _title;
//   String? _body;
//   XFile? _image;
//
//   bool get btnEnabled => (_title?.isNotEmpty ?? false)
//       && (_body?.isNotEmpty ?? false)
//       && _image != null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Create Journal Page',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16.0,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             const SizedBox(height: 16,),
//             TextField(
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Title',
//                 hintText: 'Enter your title here',
//               ),
//               onChanged: (newTitle) {
//                 setState(() {
//                   _title = newTitle;
//                 });
//               },
//             ),
//             const SizedBox(height: 8,),
//             TextField(
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Body',
//                 hintText: 'Enter your body here',
//               ),
//               textAlignVertical: TextAlignVertical.top,
//               minLines: 5,
//               maxLines: 10,
//               onChanged: (newBody) {
//                 setState(() {
//                   _body = newBody;
//                 });
//               },
//             ),
//             const SizedBox(height: 16,),
//             const Text(
//               'Thumbnail (*)',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 8,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 MaterialButton(
//                   onPressed: () async {
//                     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//                     if (image != null) {
//                       setState(() {
//                         _image = image;
//                       });
//                     }
//                   },
//                   color: Colors.blue,
//                   child: const Icon(
//                     Icons.upload,
//                     size: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 if (_image != null) ...[
//                   const SizedBox(width: 8,),
//                   Expanded(
//                     child: Text(
//                       _image!.name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8,),
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _image = null;
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.close,
//                         size: 16,
//                         color: Colors.redAccent,
//                       ),
//                   ),
//                 ],
//               ],
//             ),
//             const SizedBox(height: 16,),
//             SizedBox(
//               width: double.infinity,
//               child: MaterialButton(
//                 color: Colors.blue,
//                 disabledColor: Colors.blue.withOpacity(0.5),
//                 onPressed: !btnEnabled
//                     ? null
//                     : () async {
//                   final title = _title;
//                   final body = _body;
//                   final imagePath = _image!.path;
//                   final imageName = _image!.name;
//
//                   showLoadingDialog(context: context);
//
//                   try {
//                     final journal = await api.createJournal(
//                       title: title!,
//                       body: body!,
//                       imagePath: imagePath,
//                       imageName: imageName,
//                     );
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         backgroundColor: Colors.green,
//                         content: Text(
//                           'Create journal success!',
//                         ),
//                       ),
//                     );
//
//                     Navigator.pop(context);
//                     Navigator.pop(context, journal);
//                   } catch (ex) {
//                     print(ex.toString());
//                     Navigator.pop(context);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         backgroundColor: Colors.redAccent,
//                         content: Text(
//                           'Failed to create journal!',
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text(
//                   'Create journal',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16,),
//           ],
//         ),
//       ),
//     );
//   }
// }
