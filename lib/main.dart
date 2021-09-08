import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<List<String>> recipes = [
  ['string', 'string', '', 'string', 'slimeball', '', '', '', 'string'],
  ['iron_ingot', 'iron_ingot', 'iron_ingot', '', 'stick', '', '', 'stick', '']
];

List<String> names = ['Lead', 'Iron Pickaxe'];
List<String> recipePictureIDs = ['lead', 'iron_pickaxe'];

List<String> craftingTableContains = List<String>.filled(9, '');

int currentRecipeId = 0;
ValueNotifier<int> recipeChangeNotifier = ValueNotifier<int>(0);
ValueNotifier<int> healthNotifier = ValueNotifier<int>(3);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
      title: 'Craft Puzzle',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crafting Puzzle'),
        ),
        body: GameWidget(),
      )));
}

class GameWidget extends StatefulWidget {
  const GameWidget({
    Key key,
  }) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  var craftingTableFill = List<ValueNotifier<String>>.generate(
      9, (i) => ValueNotifier<String>(i.toString()));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 3),
                          blurRadius: 2,
                          spreadRadius: 0.5)
                    ],
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                alignment: Alignment.center,
                child: ValueListenableBuilder<int>(
                    valueListenable: recipeChangeNotifier,
                    builder: (BuildContext context, int value, Widget child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(names[value]),
                          Container(
                            width: 64,
                            child: Image.asset(
                                'assets/recipes/${recipePictureIDs[value]}.png'),
                          )
                        ],
                      );
                    }),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 3),
                            blurRadius: 2,
                            spreadRadius: 0.5)
                      ],
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  alignment: Alignment.center,
                  child: HealthPanel(),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: AcceptButton(),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 7,
              child: ValueListenableBuilder<int>(
                  valueListenable: recipeChangeNotifier,
                  builder: (BuildContext context, int value, Widget child) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: CraftingTable(List<ValueNotifier<String>>.generate(
                          9, (i) => ValueNotifier<String>(''))),
                    );
                  }),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: ValueListenableBuilder<int>(
                    valueListenable: recipeChangeNotifier,
                    builder: (BuildContext context, int value, Widget child) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: makeStuffList(recipes[value]));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthPanel extends StatelessWidget {
  HealthPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: healthNotifier,
        builder: (BuildContext context, int value, Widget child) {
          print(value);
          List<HealthHeart> hearts = List<HealthHeart>.generate(
              3, (i) => i + 1 > value ? HealthHeart(false) : HealthHeart(true));
          print(hearts.last.isFull);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: hearts,
          );
        });
  }
}

class HealthHeart extends StatelessWidget {
  final bool isFull;
  const HealthHeart(this.isFull);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      child: (isFull
          ? Image.asset(
              'assets/ui/heart.png',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            )
          : Image.asset(
              'assets/ui/heart_empty.png',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            )),
    );
  }
}

class AcceptButton extends StatefulWidget {
  const AcceptButton({
    Key key,
  }) : super(key: key);

  @override
  _AcceptButtonState createState() => _AcceptButtonState();
}

class _AcceptButtonState extends State<AcceptButton>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation acceptAnimation;
  Animation declineAnimation;
  Animation _animation;

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    declineAnimation = TweenSequence<Color>([
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.blue, end: Colors.red)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50),
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.red, end: Colors.blue)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50)
    ]).animate(controller);
    acceptAnimation = TweenSequence<Color>([
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.blue, end: Colors.green)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50),
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.green, end: Colors.blue)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50)
    ]).animate(controller);
    _animation = acceptAnimation
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (compareRecipesDeeply(
            craftingTableContains, recipes[recipeChangeNotifier.value])) {
          changeRecipe();
          _animation = acceptAnimation;
          controller.forward().then((value) => controller.reset());
        } else {
          healthNotifier.value--;
          changeRecipe();
          _animation = declineAnimation;
          controller.forward().then((value) => controller.reset());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: _animation.value,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 0.5)
          ],
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              Icons.done_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void changeRecipe() {
    var l = List.generate(recipes.length, (i) => i)
        .where((e) => e != recipeChangeNotifier.value)
        .toList();
    recipeChangeNotifier.value = l[Random().nextInt(l.length)];
  }
}

class CraftingTable extends StatelessWidget {
  final List<ValueNotifier<String>> craftingSlotNotifierList;

  CraftingTable(this.craftingSlotNotifierList);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 3),
              blurRadius: 2,
              spreadRadius: 0.5)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(
                  3,
                  (i) => Expanded(
                      flex: 1,
                      child: ValueListenableBuilder(
                          valueListenable: craftingSlotNotifierList[i],
                          builder: (BuildContext context, String value,
                              Widget child) {
                            craftingTableContains[i] = value;
                            return AspectRatio(
                              aspectRatio: 1,
                              child: FractionallySizedBox(
                                  widthFactor: 0.9,
                                  heightFactor: 0.9,
                                  child: CraftingSlot(
                                      i, craftingSlotNotifierList[i])),
                            );
                          })))),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
                      3,
                      (i) => Expanded(
                          flex: 1,
                          child: ValueListenableBuilder(
                              valueListenable: craftingSlotNotifierList[i + 3],
                              builder: (BuildContext context, String value,
                                  Widget child) {
                                craftingTableContains[i + 3] = value;
                                return AspectRatio(
                                  aspectRatio: 1,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.9,
                                    heightFactor: 0.9,
                                    child: CraftingSlot(
                                        i + 3, craftingSlotNotifierList[i + 3]),
                                  ),
                                );
                              }))))),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
                      3,
                      (i) => Expanded(
                          flex: 1,
                          child: ValueListenableBuilder(
                              valueListenable: craftingSlotNotifierList[i + 6],
                              builder: (BuildContext context, String value,
                                  Widget child) {
                                craftingTableContains[i + 6] = value;
                                return AspectRatio(
                                  aspectRatio: 1,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.9,
                                    heightFactor: 0.9,
                                    child: CraftingSlot(
                                        i + 6, craftingSlotNotifierList[i + 6]),
                                  ),
                                );
                              })))))
        ],
      ),
    );
  }
}

class CraftingSlot extends StatefulWidget {
  final int id;
  final ValueNotifier<String> _notifier;

  CraftingSlot(this.id, this._notifier);
  @override
  _CraftingSlotState createState() => _CraftingSlotState();
}

class _CraftingSlotState extends State<CraftingSlot> {
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (BuildContext context, List<Object> candidateData,
          List<dynamic> rejectedData) {
        return GestureDetector(
          onTap: () => widget._notifier.value = '',
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-1, -1),
                  )
                ],
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ValueListenableBuilder<String>(
                valueListenable: widget._notifier,
                builder: (BuildContext context, String value, Widget child) {
                  return value != ''
                      ? Image.asset('assets/items/$value.png')
                      : Container();
                }),
          ),
        );
      },
      onAccept: (String itemId) => widget._notifier.value = itemId,
    );
  }
}

bool compareRecipesDeeply(List<String> table, List<String> recipe) {
  Set<List<String>> sameRecipes = {recipe};
  //Check if recipe is symmetrical about the vertical axis
  for (var i = 0; i < 7; i += 3) {
    if (recipe[i] != recipe[i + 2]) {
      var _recipe = recipe;
      for (var j = 0; j < 7; j += 3) {
        var a = _recipe[j];
        _recipe[j] = _recipe[j + 2];
        _recipe[j + 2] = a;
      }
      sameRecipes.add(_recipe);
      break;
    }
  }

  for (var l in sameRecipes) {
    if (listEquals(l, table)) {
      return true;
    }
  }
  return false;
}

List<Widget> makeStuffList(List<String> recipe) {
  var ingredients = recipe.toSet().where((e) => e != '').toList();

  return List.generate(
    ingredients.length,
    (i) => Draggable<String>(
      data: ingredients[i],
      feedback: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      child: Container(
          //color: Colors.pink,
          height: 64,
          width: 64,
          child: Image.asset('assets/items/${ingredients[i]}.png')),
    ),
  );
}
