// import 'package:flutter/material.dart';
// import 'package:flutter_clean_arch/api.dart';
// import 'package:flutter_clean_arch/login.dart';
// import 'package:flutter_clean_arch/shared_prefs.dart';
//
// void showLoadingDialog({
//   required BuildContext context,
// }) {
//   showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           content: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               CircularProgressIndicator(),
//               SizedBox(height: 16,),
//               Text(
//                 'Loading, please wait...',
//               ),
//             ],
//           ),
//         );
//       },
//   );
// }
//
// void showLogoutDialog({
//   required BuildContext context,
// }) {
//   showDialog(
//     context: context,
//     builder: (ctx) {
//       return AlertDialog(
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Logout',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Text(
//               'Are you sure you want to logout?',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Center(
//                     child: MaterialButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       color: Colors.redAccent,
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: MaterialButton(
//                       onPressed: () {
//                         prefs.logout();
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (ctx) => const LoginPage(),
//                             ),
//                         );
//                       },
//                       color: Colors.green,
//                       child: const Text(
//                         'Logout',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
//
// Future<bool?> showDeleteJournalDialog({
//   required BuildContext context,
//   required String id,
// }) {
//   return showDialog<bool>(
//     context: context,
//     builder: (ctx) {
//       return AlertDialog(
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Delete Journal',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Text(
//               'Are you sure you want to delete this journal?',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Center(
//                     child: MaterialButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       color: Colors.redAccent,
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: MaterialButton(
//                       onPressed: () async {
//                         showLoadingDialog(context: context);
//
//                         try {
//                           await api.deleteJournal(
//                             id: id,
//                           );
//
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               backgroundColor: Colors.green,
//                               content: Text(
//                                 'Delete journal success!',
//                               ),
//                             ),
//                           );
//
//                           Navigator.pop(context);
//                           Navigator.pop(context, true);
//                         } catch (ex) {
//                           print(ex.toString());
//                           Navigator.pop(context);
//                           Navigator.pop(context, false);
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               backgroundColor: Colors.redAccent,
//                               content: Text(
//                                 'Failed to delete journal!',
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                       color: Colors.green,
//                       child: const Text(
//                         'Delete',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }