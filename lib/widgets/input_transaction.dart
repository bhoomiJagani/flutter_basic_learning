import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  final Function addTransaction;

  InputTransaction({@required this.addTransaction});

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();
  DateTime _selectedDate;

  void submitData(BuildContext context) {
    if (_titleController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _selectedDate == null) return;

    final price = double.parse(_priceController.text);
    final title = _titleController.text;
    if (title.isEmpty || price <= 0) {
      return;
    }

    widget.addTransaction(title, price, _selectedDate);
    Navigator.of(context).pop();
  }

  openDatePicker() {
    print("openDatePicker");
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
            firstDate: DateTime(2019))
        .then((pickerDate) {
      if (pickerDate == null) return;
      setState(() {
        _selectedDate = pickerDate;
        print("_selectedDate" + DateFormat.yMMMMd().format(_selectedDate));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: _priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(context),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? "No Date Choosen"
                      : 'Picked Date: ${DateFormat.yMMMMd().format(_selectedDate)}'),
                ),
                TextButton(
                  onPressed: openDatePicker,
                  child: Text(
                    'Choose Date',
                    //style: Theme.of(context).textTheme.title,
                  ),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.title)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  submitData(context);
                },
                child: Text('Add Transaction'),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.title))),
          ],
        ),
      ),
    );
  }
}
