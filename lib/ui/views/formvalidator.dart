import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learncard/core/shared/size_helper.dart';
import 'package:learncard/core/shared/constants.dart' as constants;

class FormValidator extends StatefulWidget {
  FormValidator({Key? key}) : super(key: key);

  @override
  _FormValidatorState createState() => _FormValidatorState();
}

class _FormValidatorState extends State<FormValidator> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            style: constants.inputTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.accessibility,
                                color: Color(0xFF6D4C41),
                                size: getScreenHeight(context) * 0.05,
                              ),
                              labelText: "name",
                              labelStyle: constants.labelTextStyle,
                              hintText: "select hint",
                              hintStyle: constants.hintTextStyle,
                              errorStyle: constants.errorTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                gapPadding: 4,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.brown,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                            valueTransformer: (text) => num.tryParse(text!),
                            validator: FormBuilderValidators.min(context, 5),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FormBuilderDropdown(
                            name: "gender",
                            style: constants.inputTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.accessibility,
                                color: Color(0xFF6D4C41),
                                size: getScreenHeight(context) * 0.05,
                              ),
                              labelText: "gender",
                              labelStyle: constants.labelTextStyle,
                              hintText: "select gender",
                              hintStyle: constants.hintTextStyle,
                              errorStyle: constants.errorTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                gapPadding: 4,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.brown,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: FormBuilderValidators.required(context),
                            items: ['Male', 'Techno Functional', 'Other']
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
