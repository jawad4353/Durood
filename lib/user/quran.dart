



import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:gulshshanedurood/main.dart';
import 'package:gulshshanedurood/routes.dart';
import 'package:path_provider/path_provider.dart';
import '../supportingfunctions.dart';

class quran extends StatefulWidget{
  @override
  State<quran> createState() => _quranState();
}

class _quranState extends State<quran> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  TextEditingController search_controller=new TextEditingController();
  List<String> pdfFileNames = [];
  var Sorted_names={},Final_Surahs={};
  @override
  void initState() {
    super.initState();
    fetchPdfFileNames();
  }
  void fetchPdfFileNames() async {
    try {
      final listResult = await _storage.ref('surah').listAll();
      final items = listResult.items;
      pdfFileNames = items.map((item) => item.name).toList();
      for(int i=0;i<pdfFileNames.length;i++){
        var s=pdfFileNames[i].split('.');
        Sorted_names[s[0]]=s[1];
        setState(() {
          Final_Surahs[s[0]]=s[1];
        });
      }
    } catch (e) {
      EasyLoading.showError("Error fetching PDF files: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
   return Scaffold(
     appBar: AppBar(title: Text("Surah's"),),
     body:pdfFileNames==null? show_progress_indicator(color1: Colors.white,color2: myPrimaryColor,) :
    ListView(children: [
      Padding(
        padding: EdgeInsets.only(left: size.width*0.1,right: size.width*0.1,top: 8),
        child: TextField(
          onChanged: (a){
            if(a.isEmpty){
              fetchPdfFileNames();
            }
            Searched_Surah(a);


          },
          controller: search_controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: '  Search Surha',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )
        ),
        ),
      ),
      SizedBox(height: 10,),
      Container(
        height:size.height*0.76,
        
        child: ListView.builder(
            itemCount: Final_Surahs.length,
            itemBuilder: (context,index)=>ListTile(
              onTap: () {
                var name= Getting_Pdf_path(Final_Surahs['${index+1}']);
                print(name);
                Navigator.push(context, Myroute(View_Pdf(name: name,)));
              },
              splashColor: myPrimaryColor,
              hoverColor: myPrimaryColor,
              leading:Text('${index+1}',style: TextStyle(
                      fontSize: 19,fontWeight: FontWeight.w500,color: myPrimaryColor
                       ),),
            title: Text( ':  ${Final_Surahs['${index+1}']}',style: TextStyle(
                        fontSize: 23,fontWeight: FontWeight.w500
               ),) ,

            )),
      ) ,
    ],)
   );
  }




  void Searched_Surah(String a){
    Final_Surahs.clear();
    var i=0;
    Sorted_names.forEach((key, value) {

      if ('${value.toLowerCase()}'.startsWith(a.toLowerCase())) {
        i++;
        setState(() {
          Final_Surahs['$i']=value;
        });
      }
    });
  }



   Getting_Pdf_path(selected_pdf) {
  var find,name;
    for (var entry in Sorted_names.entries) {
      if (entry.value == selected_pdf) {
       find= entry.key;
        break; // No need to continue searching
      }
    }
    name='${find}.${selected_pdf}';

  String path = "surah/$name.pdf";
  print(path);
  return path;
  }





}















class View_Pdf extends StatefulWidget{
  var name;
  View_Pdf({required this.name});
  @override
  State<View_Pdf> createState() => _View_PdfState();
}

class _View_PdfState extends State<View_Pdf> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
   return  SafeArea(
     child: Scaffold(
       appBar: AppBar(actions: [IconButton(onPressed: () async {
         try {
           EasyLoading.show(status: 'Downloading');
           final Directory appDocDir = await getApplicationDocumentsDirectory();
           final String filePath = '${appDocDir.path}/file.pdf';
           final  ref = FirebaseStorage.instance.ref(widget.name);
           final File localFile = File(filePath);
           await ref.writeToFile(localFile);
           EasyLoading.showSuccess('Downloaded');
         } catch (e) {
           EasyLoading.showError('Error Downloading file ! Check Internet Connection');
         }
       },icon: Icon(Icons.download_outlined),)],),
        body:StreamBuilder(
          stream: FirebaseStorage.instance.ref(widget.name).getData().asStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: show_progress_indicator(color1: Colors.white,color2: myPrimaryColor,));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading PDF'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No PDF data available'));
            } else {
              return PDFView(
                pdfData: snapshot.data!,
              );
            }
          },
        ),
     )

   );
  }

}





