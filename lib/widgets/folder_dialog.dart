// import 'package:flutter/material.dart';

// import '../data/create_fileStructure.dart';

// class FolderDialog extends StatelessWidget {
//   final dynamic parentId;
//   final Function(String folderName, dynamic parentId)? onFolderCreated;
//   final FileItemNew? folderData;
//   final Function(String, FileItemNew)? renameFolder;

//   const FolderDialog(
//       {super.key, this.onFolderCreated, this.folderData, this.renameFolder, this.parentId});

//   @override
//   Widget build(BuildContext context) {
//     final isLightTheme = Theme.of(context).brightness == Brightness.light;

//     TextEditingController folderNameController =folderData != null ?
//     TextEditingController(text: folderData!.name) : TextEditingController();

//     return AlertDialog(
//       title: Text(
//         'Create Folder',
//         style: TextStyle(
//           color: isLightTheme ? Colors.black : Colors.white,
//         ),
//       ),
//       content: TextField(
//         style: TextStyle(
//           color: isLightTheme ? Colors.black : Colors.white,
//         ),
//         controller: folderNameController,
//         decoration: const InputDecoration(hintText: 'Folder Name'),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text('Cancel'),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//     TextButton(
//     child: folderData != null ? const Text("Rename") : const Text('Create'),
//     onPressed: () {
//     folderData != null ? renameFolder!(folderNameController.text, folderData!) : onFolderCreated!(folderNameController.text, parentId);
//     Navigator.of(context).pop();
//     },
//     ),
//       ],
//     );
//   }
// }








// IOS LOOK AND FEEL CODE

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // For ColorScheme & other references
import '../data/create_fileStructure.dart';

class FolderDialog extends StatelessWidget {
  final dynamic parentId;
  final Function(String folderName, dynamic parentId)? onFolderCreated;
  final FileItemNew? folderData;
  final Function(String, FileItemNew)? renameFolder;

  const FolderDialog(
      {super.key, this.onFolderCreated, this.folderData, this.renameFolder, this.parentId});

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    TextEditingController folderNameController = folderData != null
        ? TextEditingController(text: folderData!.name)
        : TextEditingController();

    return CupertinoAlertDialog(
      title: Text(
        folderData != null ? 'Rename Folder' : 'Create Folder',
        style: TextStyle(
          color: isLightTheme ? CupertinoColors.black : CupertinoColors.white,
        ),
      ),
      content: CupertinoTextField(
        controller: folderNameController,
        placeholder: 'Folder Name',
        style: TextStyle(
          color: isLightTheme ? CupertinoColors.black : CupertinoColors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isLightTheme
                ? CupertinoColors.systemGrey
                : CupertinoColors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: folderData != null ? const Text('Rename') : const Text('Create'),
          onPressed: () {
            if (folderData != null) {
              renameFolder!(folderNameController.text, folderData!);
            } else {
              onFolderCreated!(folderNameController.text, parentId);
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
