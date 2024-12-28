import 'package:flutter/material.dart';

class DatepickerExample extends StatefulWidget{
  const DatepickerExample({super.key});
  @override
  State<DatepickerExample> createState()=> _datepickerState();
}

class _datepickerState extends State<DatepickerExample>{
  DateTime? selectedDate;

    Future <void> _selectedDate(BuildContext context)async{
      final DateTime? picked=await showDatePicker(context: context, initialDate: DateTime.now(),firstDate: DateTime(1990), lastDate: DateTime(2100));
      if( picked != null && picked != selectedDate){
        setState(() {
          selectedDate=picked;
        });
      }
    }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("DatepickerExample"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(selectedDate != null? "Selected date:${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}":"No date selected",style: TextStyle(fontSize: 20),),
          ElevatedButton(onPressed: (){
            _selectedDate(context);
          }, child: Text("Select date"))
        ],
      ),
    ),
    );
  }
}