import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imageview/signup.dart';
import 'colors.dart';
import 'gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode myFocusNode;

  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    if (LogicalKeyboardKey.arrowLeft == event.logicalKey) {
      FocusManager.instance.primaryFocus!
          .focusInDirection(TraversalDirection.left);
    } else if (LogicalKeyboardKey.arrowRight == event.logicalKey) {
      FocusManager.instance.primaryFocus!
          .focusInDirection(TraversalDirection.right);
    } else if (LogicalKeyboardKey.arrowUp == event.logicalKey) {
      FocusManager.instance.primaryFocus!
          .focusInDirection(TraversalDirection.up);
    } else if (LogicalKeyboardKey.arrowDown == event.logicalKey) {
      FocusManager.instance.primaryFocus!
          .focusInDirection(TraversalDirection.down);
    }
    return KeyEventResult.handled;
  }

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  bool isChecked = false;

  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Color signUpColor = MainColors.SECONDARY_COLOR;
  Color signInColor = MainColors.SECONDARY_COLOR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.PRIMARY_COLOR,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(250, 0, 250, 180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Focus(
                canRequestFocus: false,
                onKey: _handleKeyEvent,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: style,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColors.FOURTH_COLOR,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: MainColors.SECONDARY_COLOR, width: 1.5),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: MainColors.SECONDARY_COLOR, width: 3),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Focus(
                canRequestFocus: false,
                onKey: _handleKeyEvent,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  style: style,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColors.FOURTH_COLOR,
                    hintText: "Senha",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: MainColors.PRIMARY_COLOR, width: 1.5),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: MainColors.SECONDARY_COLOR, width: 3),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      focusColor: MainColors.SECONDARY_COLOR,
                      hoverColor: MainColors.SECONDARY_COLOR,
                      checkColor: MainColors.FOURTH_COLOR,
                      activeColor: MainColors.SECONDARY_COLOR,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  const Text(
                    "Lembrar de mim",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: MainColors.FOURTH_COLOR,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: signUpColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          setState(() {
                            signUpColor = MainColors.FOURTH_COLOR;
                          }
                          );
                        }
                        else {
                          signUpColor = MainColors.SECONDARY_COLOR;
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: MainColors.FOURTH_COLOR,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text('Cadastrar',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: signInColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          setState(() {
                            signInColor = MainColors.FOURTH_COLOR;
                          });
                        }
                        else {
                          signInColor = MainColors.SECONDARY_COLOR;
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: MainColors.FOURTH_COLOR,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Gallery()),
                        );
                      },
                      child: const Text('Log In', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
