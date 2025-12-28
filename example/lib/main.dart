import 'package:flutter/material.dart';
import 'package:relation_widgets/relation_widgets.dart';

void main(List<String> args) {
  bool isItSeller() {
    bool isUserSignedIn = true;
    bool isUserIsSeller = true;

    return isUserSignedIn && isUserIsSeller;
  }

  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Card(
                child: Column(
                  children: [
                    Text(
                      'Enemies widget',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /// this is what we call it enemies widget , they cannot live under the same sky aha i mean the same tree :) , only one of them will show when the other hides
                    /// here im making showFirstWidgetWhen as a return function to force user to put coditions in a organized way ( best way in presenter ),
                    /// also to improve readability and ignore lambdas
                    EnemiesWidget(
                      firstWidget: Text("Im a seller"),
                      secondWidget: Text("Im a buyer"),
                      showFirstWidgetWhen: isItSeller,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// If you have multiple conditions on widgets , this could help you for example for status or componenets variants
              ManyToOneWidget(
                conditionalChildren: [
                  ConditionalElement(
                    showWhen: () => true,
                    child: Text('Hello seller'),
                  ),
                  ConditionalElement(
                    showWhen: () => false,
                    child: Text('Hello buyer'),
                  ),

                  ConditionalElement(
                    showWhen: () => false,
                    child: Text('Hello delivery guy'),
                  ),
                ],
              ),

              /// a very useful widget for loading states with error handling
              LoadWidget(
                loadStatus: LoadStatus.loading,
                hasError: false,
                loadingWidget: Text('Loading...'),
                loadedWidget: Text('Loaded'),
                errorWidget: Text('Error'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
