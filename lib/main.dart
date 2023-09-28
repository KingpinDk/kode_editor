import 'package:flutter/material.dart';
import 'package:highlight/languages/java.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/python.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KodeEditor(),
  ));
}

class KodeEditor extends StatefulWidget {
  const KodeEditor({super.key});

  @override
  State<KodeEditor> createState() => _KodeEditorState();
}

class _KodeEditorState extends State<KodeEditor> {
  final codecontroller = CodeController(
    text: 'print("Hello, World!")',//"class Main{\n\tpublice static void main(String args[])\n}",
    language: python,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // final min_lines = (MediaQuery.of(context).size.height)/27;
    // print("$min_lines *********************");
    return Scaffold(
      appBar: AppBar(title: const Text("Kode Editor"),),
      body: CodeTheme(
        data: CodeThemeData(styles: monokaiSublimeTheme),
        child: SingleChildScrollView(
          child: Container(
            //padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
            constraints: BoxConstraints(
              minHeight: screenHeight,
              //minWidth: screenWidth
            ),
            child: CodeField(
              controller: codecontroller,

              gutterStyle: const GutterStyle(
                showLineNumbers: true,
                showFoldingHandles: true,
                width: 40.0,
                margin: 10.0,
                textAlign: TextAlign.right
              ),
              expands: false,
            ),
          ),
        ),
      ),
    );
  }
}


