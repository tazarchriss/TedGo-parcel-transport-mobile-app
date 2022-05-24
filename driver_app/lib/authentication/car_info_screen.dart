import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  // formkey
  final _formKey = GlobalKey<FormState>();
  // editing controllers
  final carModelController = new TextEditingController();
  final carNumberController = new TextEditingController();
  final carColorController = new TextEditingController();

  // list creation
  List<String> carTypesList = ["Boda Boda", "Bajaji", "Van", "Truck"];

  String? selectedCarType;

  @override
  Widget build(BuildContext context) {
    // First Name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: carModelController,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value) {
        carModelController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.car_repair),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Car Model",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Car Number field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: carNumberController,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value) {
        carNumberController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Car Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // car controller
    final emailField = TextFormField(
      autofocus: false,
      controller: carColorController,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value) {
        carColorController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Car Color",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

// Start of Drop Down
    final CarType = Material(
      child: DropdownButton(
        borderRadius: BorderRadius.circular(30),
        iconSize: 26,
        dropdownColor: Colors.red,
        hint: const Text(
          "Please Choose the Vehicle Type",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red,
          ),
        ),
        value: selectedCarType,
        onChanged: (newValue) {
          setState(() {
            selectedCarType = newValue.toString();
          });
        },
        items: carTypesList.map((car) {
          return DropdownMenuItem(
            child: Text(
              car,
              style: const TextStyle(color: Colors.black),
            ),
            value: car,
          );
        }).toList(),
      ),
    );

    // start of signup button
    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => CarInfoScreen()));
        },
        child: Text(
          "Save Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("TedGO parcels"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // logo section
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/car.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),

                    // first name section
                    firstNameField,
                    SizedBox(
                      height: 20,
                    ),
                    //second name section
                    secondNameField,
                    SizedBox(
                      height: 20,
                    ),
                    // email section
                    emailField,
                    SizedBox(
                      height: 20,
                    ),
                    // Drop Down
                    CarType,
                    SizedBox(
                      height: 20,
                    ),
                    // save button section
                    SignUpButton,
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
