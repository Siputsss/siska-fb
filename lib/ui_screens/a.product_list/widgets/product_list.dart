// part of '../_index.dart';

// class ProductList extends StatelessWidget {
//   const ProductList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return dt.rxProductList.state.isEmpty
//         ? const Center(
//             child: Text('data is empty'),
//           )
//         : SingleChildScrollView(
//             child: Column(
//               children: [
//                 ...List.generate(
//                   dt.rxProductList.state.length,
//                   (index) => OnReactive(
//                     () => Card(
//                       child: ListTile(
//                         title: Text(dt.rxProductList.state[index].nama),
//                         subtitle: Text(dt.rxProductList.state[index].createdAt),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 dt.rxIsEnd.state == true
//                     ? const Center(child: Text('- end of list -'))
//                     : ElevatedButton(
//                         onPressed: () {
//                           ct.readGetColl();
//                         },
//                         child: const Text("loadmore"),
//                       ),
//               ],
//             ),
//           );
//   }
// }