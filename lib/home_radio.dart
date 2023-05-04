import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';


class HomeRadioFm extends StatefulWidget {
  const HomeRadioFm({Key? key}) : super(key: key);

  @override
  State<HomeRadioFm> createState() => _HomeRadioFmState();
}

class _HomeRadioFmState extends State<HomeRadioFm> {
  RadioPlayer radioPlayer = RadioPlayer();
  bool inPause = true;
  @override
  void initState() {
    radioPlayer.setChannel(title: "France Bleu Normandie (Calvados – Orne)", url: "http://direct.francebleu.fr/live/fbbassenormandie-midfi.mp3?ID=76zqey582k",imagePath: "assets/image/franceBleu.png");
    radioPlayer.pause();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Radio App",
          style: TextStyle(
            color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,5),
          child: Container(
            height: 5,
            width:MediaQuery.of(context).size.width ,
            color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Align(
               alignment: Alignment.center,
               child: CircleAvatar(
                radius: 160,
                backgroundImage: AssetImage("assets/image/radio.jpg"),
            ),
             ),
            const Text(
              "France Bleu Normandie ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),
            ),

            InkWell(
              onTap: (){
                if(inPause){
                  radioPlayer.play();
                  setState(() {
                    inPause = false;
                  });
                }else{
                  radioPlayer.pause();
                  setState(() {
                    inPause = true;
                  });
                }
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(inPause?Icons.play_arrow:Icons.pause,color: Colors.black,size: 45,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
