import 'package:departure/model.dart';
import 'package:flutter/material.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.withOpacity(.4),
        title: Text('Bookmarked'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: ListView.builder(
            itemCount: bookMarkList.length,
            itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(height: 8,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orangeAccent.withOpacity(.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 8),
                    child: Column(
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.close,size: 14,),
                          ],
                        ),
                        Text(bookMarkList[index].slock!)
                      ],
                    ),
                  ),
                ),


              ],),
            );
          },),
        ),
      ),
    );
  }
}
