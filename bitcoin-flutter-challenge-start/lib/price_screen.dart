import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'utilities/coin_data.dart';
import 'utilities/networking.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List rates = ['?', '?', '?'];

  DropdownButton<String> AndroidDropdown() {
    List<DropdownMenuItem<String>> items = [];
    for (String curr in currenciesList) {
      items.add(
        DropdownMenuItem(
          child: Text(curr),
          value: curr,
        ),
      );
    }
    return DropdownButton<String>(
      menuMaxHeight: 320.0,
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData(value);
        });
      },
    );
  }

  CupertinoPicker IOSPicker() {
    List<Text> items = [];
    for (String curr in currenciesList) {
      items.add(
        Text(
          curr,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        currenciesList[value];
      },
      children: items,
    );
  }

  @override
  void initState() {
    super.initState();
    getData('USD');
  }

  void getData(curr) async {
    NetworkHelper networkHelper = NetworkHelper();
    rates = await networkHelper.getCoinData(curr);
    setState(() {
      rates = rates;
    });
  }

  List<Widget> cryptoDivs() {
    List<Widget> cryptos = [];
    List<String> coins = ['BTC', 'ETH', 'LTC'];
    for (int i = 0; i < 3; i++) {
      cryptos.add(Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 ${coins[i]} = ${rates[i]} $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ));
    }
    return cryptos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: cryptoDivs(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? IOSPicker() : AndroidDropdown(),
          ),
        ],
      ),
    );
  }
}
