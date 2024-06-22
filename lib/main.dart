import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

var wtController = TextEditingController();
var ftController = TextEditingController();
var InnController = TextEditingController();

var  result = "";
var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
         color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.bold
                ),),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kg',style: TextStyle(fontWeight: FontWeight.w700),),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your hight in feet',style: TextStyle(fontWeight: FontWeight.w700),),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: InnController,
                  decoration: InputDecoration(
                      label: Text('Enter your hight in Inch',style: TextStyle(fontWeight: FontWeight.w700),),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString(); //these value are change from adatative formate to string
                  var ft = ftController.text.toString();
                  var inch = InnController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                  //ibm calculation
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iInch = int.parse(inch);

                  var tInch = (ift*12) + iInch; //
                  var tcm = tInch*2.54;         // by using these total height in meter
                  var tM = tcm/100;             //

                  var bmi = iwt/(tM*tM);

                  var msg = "";
                  if(bmi>25){
                    msg = "you are Overweight";
                    bgColor = Colors.orange.shade50;
                  }else if(bmi<18){
                  msg = "you are under weight";
                  bgColor = Colors.red.shade50;
                  }else{
                  msg = "you are Healthy";
                  bgColor = Colors.greenAccent;
                  }

                  setState(() {
                    result  = "$msg \n your BMI is : ${bmi.toStringAsFixed(4)}";
                  });



                  }else {
                    setState(() {
                     result="please fill all the required blanks!!";
                    });
                  }

                }, child: Text('Calculate')),
                SizedBox(height: 11,),

                Text(result,style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
        ),
      )

    );
  }
}
