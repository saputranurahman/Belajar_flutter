import 'package:flutter/material.dart';

class Latihan extends StatelessWidget {
  const  Latihan({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  width: 400,
                  height: 80,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    
                    child: Container(
                      width: 160,
                      height: 130,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(0),
                         color: Colors.brown,
                         child: Image.network("data:image/png;base64,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",fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 160, 
                      height: 130, 
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: double.infinity, 
                      height: double.infinity, 
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(0),
                        color: Colors.brown,
                        child: Image.network("data:image/jpeg;base64,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", fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 100,
                  width: 380,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 100,
                              width: 40,
                              
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset("assets/img/mi.jpg", fit: BoxFit.fill,),
                            )),
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectur adlipscing elit',
                              maxLines: 4, 
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 100,
                  width: 380,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 100,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset("assets/img/ik.jpg", fit: BoxFit.fill,
                              
                               ) ,
                            )),
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectur adlipscing elit',
                              maxLines: 4, 
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                    ],
                  ),
                ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  width: 500,
                  height: 80,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    "Saput Ganteng,Terimakasih.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
