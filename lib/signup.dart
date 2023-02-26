import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imageview/colors.dart';
import 'package:imageview/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

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

  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool isChecked = false;

  Color signUpColor = MainColors.SECONDARY_COLOR;



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MainColors.PRIMARY_COLOR,body: Center(
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
                keyboardType: TextInputType.emailAddress,
                style: style,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MainColors.FOURTH_COLOR,
                  hintText: "Senha",
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
                  hintText: "Confirmar Senha",
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
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    child: const Text('Cadastrar', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }

}