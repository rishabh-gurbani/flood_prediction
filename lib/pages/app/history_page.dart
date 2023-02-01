import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flood_prediction_app/read_data/get_prediction.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  List documentIDs = [];
  List documents = [];

  Future getDocIDs() async{
    await FirebaseFirestore.instance.collection('predictions').
    where("UserID", isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
        .orderBy('TIME', descending: true).get().then((value) => value.docs.forEach((element) {
      documents.add(element);
      documentIDs.add(element.reference.id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 145,),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text("Previous Results",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.history, size: 40,),
            ),
          ],
        ),
        Row(
          children: const [Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Text("View, Edit or Delete"),
          )],
        ),
        Expanded(
          child: FutureBuilder(
            future: getDocIDs(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: documentIDs.length,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                      child: GetPrediction(documentId: documentIDs[index],
                        onPressed:() async {
                          await FirebaseFirestore.instance.collection('predictions').doc(documentIDs[index].toString()).delete();
                          setState(() {
                            documentIDs=[];
                            documents=[];
                          });
                        },
                      )
                  ),
                );
              });
            },
          ),
        )
      ],
    );
  }
}
