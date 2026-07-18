// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
String result = JSONPlaceholderExercise.getPostById(1);
System.debug(JSON.serializePretty(JSON.deserializeUntyped(result)));

String createResult = JSONPlaceholderExercise.createPost('My Test Title', 'My test body content', 1);
System.debug(JSON.serializePretty(JSON.deserializeUntyped(createResult)));

String updateResult = JSONPlaceholderExercise.updatePost(1, 'Updated Title', 'Updated body content', 1);
System.debug(JSON.serializePretty(JSON.deserializeUntyped(updateResult)));

String patchResult = JSONPlaceholderExercise.patchPostTitle(1, 'Patched Title');
System.debug(JSON.serializePretty(JSON.deserializeUntyped(patchResult)));

Integer statusCode = JSONPlaceholderExercise.deletePost(1);
System.debug('Delete status code: ' + statusCode);
