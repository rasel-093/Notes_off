import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_off/models/Note.dart';

class Addnote extends StatefulWidget {
  final Note? note;
  Addnote({super.key, this.note});

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.note != null){
      titleController.text = widget.note!.title!;
      descriptionController.text = widget.note!.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
      ),
      body: Column(
        children: [
          customTextField("Title", titleController),
          SizedBox(height: 10,),
          customTextField("Description", descriptionController),
          ElevatedButton(onPressed: (){
            // print(titleController.text);
            // print(descriptionController.text);
            final map = {
              "title": titleController.text,
              "description": descriptionController.text,
              "time": widget.note != null ? widget.note!.time! : DateTime.now().millisecondsSinceEpoch
            };
            final note = Note.fromJson(map);
            if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty){
              Navigator.pop(context, note);
            }

          }, child: Text("Save"), style: ElevatedButton.styleFrom(

          ))
        ]
      ),
    );
  }

  Widget customTextField(String hintText, TextEditingController controller){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class Addnote extends StatefulWidget {
//   final Note? note;
//   const Addnote({super.key, this.note});
//
//   @override
//   State<Addnote> createState() => _AddnoteState();
// }
//
// class _AddnoteState extends State<Addnote> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   Timer? _debounce;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.note != null) {
//       titleController.text = widget.note!.title ?? '';
//       descriptionController.text = widget.note!.description ?? '';
//     }
//
//     // Start listening to changes in description
//     descriptionController.addListener(_onNoteChanged);
//     titleController.addListener(_onNoteChanged);
//   }
//
//   void _onNoteChanged() {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       final title = titleController.text;
//       final description = descriptionController.text;
//
//       if (title.isNotEmpty && description.isNotEmpty) {
//         final map = {
//           "title": title,
//           "description": description,
//           "time": widget.note?.time ?? DateTime.now().millisecondsSinceEpoch,
//         };
//         final note = Note.fromJson(map);
//         //Navigator.pop(context, note);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     titleController.dispose();
//     descriptionController.dispose();
//     _debounce?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
//       ),
//       body: Column(
//         children: [
//           // Title field at the top with no padding
//           TextField(
//             controller: titleController,
//             decoration: const InputDecoration(
//               hintText: "Title",
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(horizontal: 16),
//             ),
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const Divider(height: 1, thickness: 1),
//           // Description field takes the rest of the screen
//           Expanded(
//             child: TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 hintText: "Start typing your note...",
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.all(16),
//               ),
//               maxLines: null,
//               expands: true,
//               keyboardType: TextInputType.multiline,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
