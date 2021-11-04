import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:tech_monkeys/src/components/save.dart';

Future<void> createPDF() async{
  PdfDocument document = PdfDocument();
  final page = document.pages.add();
  page.graphics.drawString("Welcome to Pdf", PdfStandardFont(PdfFontFamily.helvetica, 24));
  List<int> bytes = document.save();
  document.dispose();
  saveAndLaunchFile(bytes, 'Output.pdf');
}