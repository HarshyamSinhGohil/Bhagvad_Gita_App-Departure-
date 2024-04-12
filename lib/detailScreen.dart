import 'package:departure/bookmark.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.chapter_name_eg,
    required this.verseList,
  });

  final String chapter_name_eg;
  final List<Verses> verseList;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent.withOpacity(.4),
          title: Text(
            widget.chapter_name_eg,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
           actions: [
             IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookMarkScreen(),));}, icon: Icon(Icons.menu))
           ],
        ),


        body: ListView.builder(
            itemCount: widget.verseList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orangeAccent.withOpacity(.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0, top: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      bookMarkList.add(bookMark(slock: widget.verseList[index].verse));
                                    },
                                    icon: Icon(
                                      Icons.bookmark_border,
                                      size: 16,
                                    ))
                              ],
                            ),
                            isSwitched == false
                                ? Text(
                                    "Verse ${widget.verseList[index].verse_id.toString()}",
                                    style: TextStyle(fontSize: 12))
                                : Text(
                                    "श्लोक ${widget.verseList[index].verse_id.toString()}",
                                    style: TextStyle(fontSize: 12)),
                            Divider(
                              thickness: 1.5,
                            ),
                            Text(
                              widget.verseList[index].verse,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            isSwitched == false
                                ? Text(
                                    "Commentary : ${widget.verseList[index].commentary_eg}",
                                    style: TextStyle(fontSize: 14))
                                : Text(
                                    "भाष्य : ${widget.verseList[index].commentary_hn}",
                                    style: TextStyle(fontSize: 14)),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
