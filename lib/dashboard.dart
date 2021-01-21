
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
double budget = 0.00;
double savings = 0.00;
class HomePage extends StatefulWidget{
  
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage>{
  
  _HomepageState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Cartshier'),
          backgroundColor: Colors.black,
        ),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Text('Total Budget', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 ),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Row(
                children: <Widget>[
                  Text(budget.toStringAsFixed(2), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                  new Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.black,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BudgetMenu(),
                      ));
                    }
                  )
                ]
              )
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.qr_code),
                    color: Colors.black,
                    onPressed: (){
                      
                    }
                  ),
                  Text("Scan Product")
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetMenu extends StatefulWidget{
  @override
  _BudgetMenuState createState() => _BudgetMenuState();
}

class _BudgetMenuState extends State<BudgetMenu> {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Cartshier'),
          backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed:(){
                                        Navigator.pop(context,true);
                              }
                             )
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            FlatButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditBudget(),
                      ));
              },
    color: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.black),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        Icon(Icons.edit, color: Colors.black),
        Text(
            "EDIT BUDGET",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Colors.black, fontSize: 18.0),
        ),
    ],
),
          ),
             FlatButton(
              onPressed:(){
                setState((){
                  savings = savings + budget;
                  budget = 0.00; 
              }
                      );  
               showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
              },
    color: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.black),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        Icon(Icons.control_point_rounded, color: Colors.black),
        Text(
            "ADD TO SAVINGS",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Colors.black, fontSize: 18.0),
        ),
    ],
),
          ),
              FlatButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Transaction(),
                      ));
              },
    color: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.black),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        Icon(Icons.dialpad, color: Colors.black),
        Text(
            "TRANSACTION",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Colors.black, fontSize: 18.0),
        ),
    ],
),
          ),
          FlatButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Savings(),
                      ));
              },
    color: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.black),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        Icon(Icons.how_to_vote, color: Colors.black),
        Text(
            "MY SAVINGS",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Colors.black, fontSize: 18.0),
        ),
    ],
),
          ),  
          
          ]
        )
      )
    );
}}

class EditBudget extends StatefulWidget{
  
  @override
  _EditBudgetState createState() => _EditBudgetState();
}

class _EditBudgetState extends State<EditBudget> {
  String input;
  TextEditingController inputcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Cartshier'),
          backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed:(){
                                Navigator.pop(context);
                              }
                             )
        ),
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            controller: inputcontroller,
            decoration: new InputDecoration(labelText: "Enter your budget"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
            
          ),
          new FlatButton(
            child: Text("Save"),
            onPressed:(){
              setState((){
                budget = double.parse(inputcontroller.text);
              }
                      );
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
            },
            color : Colors.blue
          ),
        ],
      )),
    );
  }
}

class AddSavings extends StatefulWidget{
  @override
  _AddSavingState createState() => _AddSavingState();
}

class _AddSavingState extends State<AddSavings> {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Cartshier'),
          backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed:(){
                                Navigator.pop(context);
                              }
                             )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                children:<Widget>[
                  Icon(Icons.check, color:Colors.greenAccent),
                  Text("Successfully added to savings.", style: TextStyle(color: Colors.greenAccent))
                ]
              )
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[
                  Text("NEW SAVINGS BALANCE", textAlign: TextAlign.left),
                  Text(savings.toStringAsFixed(2), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left)
                ]
              )
            )
          ]
        )));

}}

class Savings extends StatefulWidget{
  @override
  _SavingsState createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Cartshier'),
          backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed:(){
                                Navigator.pop(context);
                              }
                             )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[
                  Text("YOUR SAVINGS", textAlign: TextAlign.left),
                  Text(savings.toStringAsFixed(2), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left)
                ]
              )
            ),
              FlatButton(
              onPressed:(){
                setState((){
                savings = 0.00;
              }
                      );
              },
    color: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.black),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        Icon(Icons.delete, color: Colors.black),
        Text(
            "RESET",
            textAlign: TextAlign.left,
            style: TextStyle(
            color: Colors.black, fontSize: 18.0),
        ),
    ],
),
          ), 
          ]
        )));

}}

class Transaction extends StatefulWidget{
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Cartshier'),
          backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed:(){
                                Navigator.pop(context);
                              }
                             )
        ),
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(labelText: "Enter your total transaction"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
          ),
        ],
      )),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Info'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Successfully Added"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Okay'),
      ),
    ],
  );
}