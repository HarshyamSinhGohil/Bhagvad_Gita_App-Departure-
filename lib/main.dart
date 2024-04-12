import 'dart:convert';
import 'package:departure/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detailScreen.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData.light(),
      home: const SplashScreen(),
    );
  }
}

bool isSwitched = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BhagvadModel? Obj;
  // List<CountryModel> countryList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadApiData().then((value) {});
  }

  List<BhagvadModel> bhagvadList = [];

  Future loadApiData() async {
    final Data = await rootBundle.loadString("Assets/data.json");
     // print(Data);
    var d = jsonDecode(Data);
    for (var e in d) {
      setState(() {
        bhagvadList.add(BhagvadModel.fromJson(e));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.orangeAccent.withOpacity(.4),
          title: isSwitched==false ?
          Text("Bhagvad Gita",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
          :
          Text("भगवद गीता",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          centerTitle: false,
          actions: [
            Row(
              children: [
                Text('En',style: TextStyle(color: Colors.black)),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched==false ? isSwitched=true : isSwitched=false;
                    });
                  },
                  activeColor: Colors.orange.shade300,
                  activeTrackColor: Colors.orange.shade100,
                  inactiveThumbColor: Colors.orange.shade300,
                  inactiveTrackColor: Colors.orange.shade100,
                ),
                Text('Hn',style: TextStyle(color: Colors.black),),
                SizedBox(width: 10,)
              ],
            )

          ],
        ),


        body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: .7,
                //  crossAxisSpacing: 20,
                // mainAxisSpacing: 10,
              ),
              itemCount: bhagvadList.length,
              itemBuilder: (context, int index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      chapter_name_eg: isSwitched==false ? bhagvadList[index].chapter_name_eg : bhagvadList[index].chapter_name_hn,
                                      verseList: bhagvadList[index].verses,
                                    )));
                          },


                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 290,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent.shade100,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        bhagvadList[index].image,
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                                        child: isSwitched==false ? Text(
                                          "Chapter ${bhagvadList[index].chapter_id}",
                                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                                        ) : Text(
                                          "अध्याय ${bhagvadList[index].chapter_id}",
                                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      isSwitched==false ?
                                      Text(
                                          bhagvadList[index]
                                              .chapter_name_eg,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                                          :
                                      Text(
                                          bhagvadList[index]
                                              .chapter_name_hn,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: isSwitched==false ?
                                        Text("Total Verse : ${bhagvadList[index].total_verse.toString()}",
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                                            :
                                        Text("कुल श्लोक : ${bhagvadList[index].total_verse.toString()}",
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))

                                      ),

                                      // Text(bhagvadList[index].verses[index].toString(),
                                      //     style: TextStyle(fontSize: 8)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),


        // ListView.builder(
        //     itemCount: countryList.length,
        //     itemBuilder: (context, index) {
        //       return InkWell(
        //         onTap: (){
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (context) => DetailScreen(
        //                 chapter_name_eg: countryList[index].chapter_name_eg,
        //
        //               )));
        //         },
        //         child: Column(
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.all(6.0),
        //               child: Container(
        //                   height: 300,
        //                   width: 300,
        //                   decoration: BoxDecoration(
        //                       color: Colors.orangeAccent.withOpacity(.4),
        //                     borderRadius: BorderRadius.circular(10),
        //                     border: Border(bottom: BorderSide(color: Colors.black12))
        //                       ),
        //                   child: Column(
        //                     children: [
        //                       Image.network(countryList[index].image,height: 130,width: 130,fit: BoxFit.fill,),
        //                       Row(
        //                         children: [
        //                           Text("Chapter ${countryList[index].chapter_id} : ",
        //                             style: TextStyle(fontSize: 22),),
        //                           Text(countryList[index].chapter_name_eg,
        //                               style: TextStyle(fontSize: 22)),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //               ),
        //             ),
        //
        //           ],
        //         ),
        //
        //       );
        //     })

        );
  }
}
