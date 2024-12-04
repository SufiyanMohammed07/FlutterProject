// // ----------------------------------------completed1 with no error-------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(CurrencyConverterApp());
// }

// class CurrencyConverterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Roboto',
//       ),
//       home: CurrencyConverter(),
//     );
//   }
// }

// class CurrencyConverter extends StatefulWidget {
//   @override
//   _CurrencyConverterState createState() => _CurrencyConverterState();
// }

// class _CurrencyConverterState extends State<CurrencyConverter>
//     with SingleTickerProviderStateMixin {
//   final _amountController = TextEditingController();
//   String _fromCurrency = 'USD';
//   String _toCurrency = 'INR';
//   String _result = '';
//   List<String> _currencies = ['USD', 'INR', 'EUR', 'GBP', 'JPY'];
//   bool _isLoading = false;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Animation Controller
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _fadeAnimation =
//         CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _amountController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _convertCurrency() async {
//     final amount = double.tryParse(_amountController.text);
//     if (amount == null) {
//       setState(() {
//         _result = 'Enter a valid amount!';
//       });
//       return;
//     }

//     final apiUrl =
//         'https://api.exchangerate-api.com/v4/latest/$_fromCurrency';

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         final rates = json.decode(response.body)['rates'];
//         final rate = rates[_toCurrency];
//         final conversionResult = (amount * rate).toStringAsFixed(2);

//         setState(() {
//           _result = '$amount $_fromCurrency = $conversionResult $_toCurrency';
//         });
//       } else {
//         setState(() {
//           _result = 'Error fetching conversion rate!';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _result = 'Error: $e';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Currency Converter'),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//         elevation: 0,
//       ),
//       body: FadeTransition(
//         opacity: _fadeAnimation,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Hero(
//                 tag: 'currency_icon',
//                 child: Center(
//                   child: Icon(
//                     Icons.attach_money,
//                     color: Colors.green,
//                     size: 80,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _amountController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Enter amount',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   prefixIcon: const Icon(Icons.input),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   DropdownButton<String>(
//                     value: _fromCurrency,
//                     onChanged: (value) {
//                       setState(() {
//                         _fromCurrency = value!;
//                       });
//                     },
//                     items: _currencies
//                         .map((currency) => DropdownMenuItem(
//                               value: currency,
//                               child: Text(currency),
//                             ))
//                         .toList(),
//                   ),
//                   const Icon(Icons.swap_horiz, size: 30),
//                   DropdownButton<String>(
//                     value: _toCurrency,
//                     onChanged: (value) {
//                       setState(() {
//                         _toCurrency = value!;
//                       });
//                     },
//                     items: _currencies
//                         .map((currency) => DropdownMenuItem(
//                               value: currency,
//                               child: Text(currency),
//                             ))
//                         .toList(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isLoading ? null : _convertCurrency,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.white),
//                       )
//                     : const Text(
//                         'Convert',
//                         style: TextStyle(fontSize: 18),
//                       ),
//               ),
//               const SizedBox(height: 20),
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 500),
//                 child: Text(
//                   _result,
//                   key: ValueKey<String>(_result),
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(),
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CurrencyConverter()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Currency Converter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Currency Converter App
class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter>
    with SingleTickerProviderStateMixin {
  final _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'INR';
  String _result = '';
  List<String> _currencies = ['USD', 'INR', 'EUR', 'GBP', 'JPY'];
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _convertCurrency() async {
    final amount = double.tryParse(_amountController.text);
    if (amount == null) {
      setState(() {
        _result = 'Enter a valid amount!';
      });
      return;
    }

    final apiUrl =
        'https://api.exchangerate-api.com/v4/latest/$_fromCurrency';

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final rates = json.decode(response.body)['rates'];
        final rate = rates[_toCurrency];
        final conversionResult = (amount * rate).toStringAsFixed(2);

        setState(() {
          _result = '$amount $_fromCurrency = $conversionResult $_toCurrency';
        });
      } else {
        setState(() {
          _result = 'Error fetching conversion rate!';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'currency_icon',
                child: Center(
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.green,
                    size: 80,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter amount',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.input),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: _fromCurrency,
                    onChanged: (value) {
                      setState(() {
                        _fromCurrency = value!;
                      });
                    },
                    items: _currencies
                        .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            ))
                        .toList(),
                  ),
                  const Icon(Icons.swap_horiz, size: 30),
                  DropdownButton<String>(
                    value: _toCurrency,
                    onChanged: (value) {
                      setState(() {
                        _toCurrency = value!;
                      });
                    },
                    items: _currencies
                        .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            ))
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _convertCurrency,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    : const Text(
                        'Convert',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  _result,
                  key: ValueKey<String>(_result),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
