import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/documents/docx_document_translator.dart';
import 'package:hy_translate/core/documents/pptx_document_translator.dart';
import 'package:hy_translate/core/documents/translate_options.dart';
import 'package:hy_translate/core/documents/xlsx_document_translator.dart';
import 'package:hy_translate/core/translation/fake_translator.dart';
import 'package:hy_translate/core/translation/translation_service.dart';

Uint8List _zip(Map<String, String> files) {
  final archive = Archive();
  files.forEach((name, content) {
    final bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(name, bytes.length, bytes));
  });
  return Uint8List.fromList(ZipEncoder().encode(archive));
}

String _read(String path, String entry) {
  final archive = ZipDecoder().decodeBytes(File(path).readAsBytesSync());
  final f = archive.files.firstWhere((f) => f.name == entry);
  return utf8.decode(f.content as List<int>);
}

void main() {
  late Directory tmp;
  late TranslationService service;
  const options = TranslateOptions(targetLang: 'tr');

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('office_test');
    service = TranslationService(FakeTranslator('TR_'));
  });
  tearDown(() => tmp.deleteSync(recursive: true));

  test('docx translation rewrites document.xml without touching other parts',
      () async {
    final input = '${tmp.path}/in.docx';
    File(input).writeAsBytesSync(_zip({
      '[Content_Types].xml': '<Types/>',
      'word/document.xml':
          '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body><w:p><w:r><w:t>Hello world</w:t></w:r></w:p></w:body></w:document>',
    }));
    final output = '${tmp.path}/out.docx';
    await DocxDocumentTranslator(service)
        .translate(inputPath: input, outputPath: output, options: options);

    expect(_read(output, 'word/document.xml'), contains('TR_Hello world'));
    expect(_read(output, '[Content_Types].xml'), '<Types/>');
  });

  test('pptx translation works', () async {
    final input = '${tmp.path}/in.pptx';
    File(input).writeAsBytesSync(_zip({
      'ppt/slides/slide1.xml':
          '<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"><a:p><a:r><a:t>Good morning</a:t></a:r></a:p></p:sld>',
    }));
    final output = '${tmp.path}/out.pptx';
    await PptxDocumentTranslator(service)
        .translate(inputPath: input, outputPath: output, options: options);

    expect(_read(output, 'ppt/slides/slide1.xml'), contains('TR_Good morning'));
  });

  test('xlsx translation updates shared strings and sheet names', () async {
    final input = '${tmp.path}/in.xlsx';
    File(input).writeAsBytesSync(_zip({
      'xl/sharedStrings.xml':
          '<sst xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><si><t>Red apple</t></si></sst>',
      'xl/workbook.xml':
          '<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><sheets><sheet name="Prices" sheetId="1"/></sheets></workbook>',
    }));
    final output = '${tmp.path}/out.xlsx';
    await XlsxDocumentTranslator(service).translate(
      inputPath: input,
      outputPath: output,
      options: const TranslateOptions(targetLang: 'tr', translateSheetNames: true),
    );

    expect(_read(output, 'xl/sharedStrings.xml'), contains('TR_Red apple'));
    expect(_read(output, 'xl/workbook.xml'), contains('TR_Prices'));
  });
}
