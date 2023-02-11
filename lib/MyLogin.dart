import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  late TextEditingController _textEditingController;

  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodeFetchButton = FocusNode();
  FocusNode _focusNodeSetButton = FocusNode();
  FocusNode _focusNodeClearButton = FocusNode();

  String displayText = '';
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController()
      ..addListener(() {
        displayText = _textEditingController.text;
      });
    _focusNodeClearButton.skipTraversal = true;
    // _focusNodeEmail.unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool _obsecure = true;
  void _isVisible() {
    setState(() {
      _obsecure = !_obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.lightBlueAccent,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PhysicalModel(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          shadowColor: Colors.green,
                          elevation: 20,
                          child: TextField(
                            // onChanged: (value) {
                            //   setState(() {
                            //     displayText = value;
                            //   });
                            // },
                            autofocus: true,
                            focusNode: _focusNodeEmail,
                            controller: _textEditingController,
                            // obscureText: true,
                            decoration: const InputDecoration(
                                focusColor: Colors.green,
                                hintText: 'i.e ali23@gmail.com',
                                label: Text('Email'),
                                fillColor: Colors.cyan,
                                filled: true,
                                hoverColor: Colors.blueAccent,
                                hintStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 56,
                          child: PhysicalModel(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            shadowColor: Colors.green,
                            elevation: 16,
                            child: TextField(
                              focusNode: _focusNodePassword,
                              // controller: _textEditingController,
                              obscureText: _obsecure,
                              decoration: InputDecoration(
                                  hintText: 'i.e usman423',
                                  label: const Text('Password'),
                                  fillColor: Colors.cyan,
                                  filled: true,
                                  hoverColor: Colors.blueAccent,
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  labelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  suffix: IconButton(
                                      onPressed: _isVisible,
                                      icon: Icon(_obsecure
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                          width: 200,
                          child: Text(
                            '',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                          width: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              _textEditingController.text,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor: Colors.cyan),
                                focusNode: _focusNodeFetchButton,
                                onPressed: () {
                                  setState(() {});
                                },
                                child: const Text('Fetch')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor: Colors.cyan),
                                // autofocus: true,
                                focusNode: _focusNodeSetButton,
                                onPressed: () {
                                  setState(() {
                                    _textEditingController.text =
                                        'gulnaz32@gmail.com';
                                  });
                                },
                                child: const Text('Set')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor: Colors.cyan),
                                focusNode: _focusNodeClearButton,
                                onPressed: () {
                                  _focusNodeEmail.requestFocus();
                                  _textEditingController.clear();
                                },
                                child: const Text('Clear')),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.cyan),
                          onPressed: () {
                            setState(() {
                              _focusNodePassword.unfocus();
                              _focusNodeEmail.unfocus();
                            });
                          },
                          child: const Text('Unfocus'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
