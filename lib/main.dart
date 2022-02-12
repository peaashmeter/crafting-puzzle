import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minecraft/defeat.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

List<List<String>> recipes = [
  ['string', 'string', '', 'string', 'slimeball', '', '', '', 'string'],
  ['iron_ingot', 'iron_ingot', 'iron_ingot', '', 'stick', '', '', 'stick', ''],
  [
    'cobblestone',
    'cobblestone',
    'cobblestone',
    'cobblestone',
    '',
    'cobblestone',
    'cobblestone',
    'redstone_dust',
    'cobblestone'
  ],
  [
    '',
    'redstone_dust',
    '',
    'redstone_dust',
    'glowstone',
    'redstone_dust',
    '',
    'redstone_dust',
    ''
  ],
  [
    'planks',
    'planks',
    'planks',
    'cobblestone',
    'iron_ingot',
    'cobblestone',
    'cobblestone',
    'redstone_dust',
    'cobblestone'
  ],
  [
    'redstone_dust',
    'redstone_dust',
    'redstone_dust',
    'redstone_dust',
    'redstone_dust',
    'redstone_dust',
    'redstone_dust',
    'redstone_dust',
    'redstone_dust'
  ],
  [
    'glass',
    'glass',
    'glass',
    'nether_quartz',
    'nether_quartz',
    'nether_quartz',
    'slab',
    'slab',
    'slab'
  ],
  [
    'planks',
    'planks',
    'planks',
    'planks',
    'redstone_dust',
    'planks',
    'planks',
    'planks',
    'planks'
  ],
  [
    'cobblestone',
    'cobblestone',
    'cobblestone',
    'cobblestone',
    'bow',
    'cobblestone',
    'cobblestone',
    'redstone_dust',
    'cobblestone'
  ],
  [
    'gunpowder',
    'sand',
    'gunpowder',
    'sand',
    'gunpowder',
    'sand',
    'gunpowder',
    'sand',
    'gunpowder'
  ],
  [
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    'chest',
    'iron_ingot',
    '',
    'iron_ingot',
    ''
  ],
  [
    'planks',
    'planks',
    'planks',
    'planks',
    '',
    'planks',
    'planks',
    'planks',
    'planks'
  ],
  [
    'iron_ingot',
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    ''
  ],
  [
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    'stick',
    'iron_ingot',
    'iron_ingot',
    '',
    'iron_ingot'
  ],
  [
    'gold_ingot',
    '',
    'gold_ingot',
    'gold_ingot',
    'stick',
    'gold_ingot',
    'gold_ingot',
    'redstone_dust',
    'gold_ingot',
  ],
  [
    'milk_bucket',
    'milk_bucket',
    'milk_bucket',
    'sugar',
    'egg',
    'sugar',
    'wheat',
    'wheat',
    'wheat'
  ],
  [
    'gold_ingot',
    'gold_ingot',
    'gold_ingot',
    'gold_ingot',
    'apple',
    'gold_ingot',
    'gold_ingot',
    'gold_ingot',
    'gold_ingot'
  ],
  [
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget'
  ],
  ['iron_ingot', 'iron_ingot', '', '', 'stick', '', '', 'stick', ''],
  ['iron_ingot', 'iron_ingot', '', 'iron_ingot', 'stick', '', '', 'stick', ''],
  [
    '',
    'gold_ingot',
    '',
    'gold_ingot',
    'redstone_dust',
    'gold_ingot',
    '',
    'gold_ingot',
    ''
  ],
  [
    'glass',
    'glass',
    'glass',
    'glass',
    'pink_dye',
    'glass',
    'glass',
    'glass',
    'glass'
  ],
  ['planks', '', '', 'planks', 'planks', '', 'planks', 'planks', 'planks'],
  [
    'cobblestone',
    '',
    '',
    'cobblestone',
    'cobblestone',
    '',
    'cobblestone',
    'cobblestone',
    'cobblestone'
  ],
  [
    'planks',
    'planks',
    'planks',
    'book',
    'book',
    'book',
    'planks',
    'planks',
    'planks'
  ],
  [
    'bamboo',
    'string',
    'bamboo',
    'bamboo',
    '',
    'bamboo',
    'bamboo',
    '',
    'bamboo'
  ],
  [
    'stick',
    'stick',
    'stick',
    'stick',
    'leather',
    'stick',
    'stick',
    'stick',
    'stick'
  ],
  [
    'white_wool',
    'white_wool',
    'white_wool',
    'white_wool',
    'white_wool',
    'white_wool',
    '',
    'stick',
    ''
  ],
  ['', 'stick', '', 'stick', 'coal', 'stick', 'oak_log', 'oak_log', 'oak_log'],
  [
    'stick',
    'stick',
    'stick',
    '',
    'stick',
    '',
    'stick',
    'smooth_stone_slab',
    'stick'
  ],
  [
    'cobblestone',
    'cobblestone',
    'cobblestone',
    'cobblestone',
    '',
    'cobblestone',
    'cobblestone',
    'cobblestone',
    'cobblestone'
  ],
  [
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot'
  ],
  [
    'block_of_iron',
    'block_of_iron',
    'block_of_iron',
    '',
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot'
  ],
  [
    'stick',
    'stick',
    'stick',
    'stick',
    'white_wool',
    'stick',
    'stick',
    'stick',
    'stick'
  ],
  ['stick', '', 'stick', 'stick', 'stick', 'stick', 'stick', '', 'stick'],
  ['planks', 'planks', 'planks', 'planks', 'planks', 'planks', '', 'stick', ''],
  [
    'planks',
    'planks',
    'planks',
    'planks',
    'diamond',
    'planks',
    'planks',
    'planks',
    'planks'
  ],
  [
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'furnace',
    'iron_ingot',
    'smooth_stone',
    'smooth_stone',
    'smooth_stone'
  ],
  [
    '',
    'book',
    '',
    'diamond',
    'obsidian',
    'diamond',
    'obsidian',
    'obsidian',
    'obsidian'
  ],
  [
    'crying_obsidian',
    'crying_obsidian',
    'crying_obsidian',
    'glowstone',
    'glowstone',
    'glowstone',
    'crying_obsidian',
    'crying_obsidian',
    'crying_obsidian'
  ],
  ['flint', 'flint', '', 'planks', 'planks', '', 'planks', 'planks', ''],
  ['paper', 'paper', '', 'planks', 'planks', '', 'planks', 'planks', ''],
  ['', 'oak_log', '', 'oak_log', 'furnace', 'oak_log', '', 'oak_log', ''],
  [
    'iron_ingot',
    'iron_ingot',
    '',
    'planks',
    'planks',
    '',
    'planks',
    'planks',
    ''
  ],
  [
    'glass',
    'glass',
    'glass',
    'glass',
    'eye_of_ender',
    'glass',
    'glass',
    'ghast_tear',
    'glass'
  ],
  [
    'obsidian',
    'obsidian',
    'obsidian',
    'obsidian',
    'eye_of_ender',
    'obsidian',
    'obsidian',
    'obsidian',
    'obsidian'
  ],
  [
    '',
    'redstone_torch',
    '',
    'redstone_torch',
    'nether_quartz',
    'redstone_torch',
    'stone',
    'stone',
    'stone'
  ],
  [
    '',
    'redstone_dust',
    '',
    'redstone_dust',
    'hay_bale',
    'redstone_dust',
    '',
    'redstone_dust',
    ''
  ],
  [
    'cobblestone',
    'cobblestone',
    'cobblestone',
    'redstone_dust',
    'redstone_dust',
    'nether_quartz',
    'cobblestone',
    'cobblestone',
    'cobblestone'
  ],
  [
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'carrot',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget',
    'gold_nugget'
  ],
  [
    'beetroot',
    'beetroot',
    'beetroot',
    'beetroot',
    'beetroot',
    'beetroot',
    '',
    'bowl',
    ''
  ],
  [
    '',
    'cooked_rabbit',
    '',
    'carrot',
    'baked_potato',
    'red_mushroom',
    '',
    'bowl',
    ''
  ],
  [
    '',
    'iron_ingot',
    '',
    'iron_ingot',
    'redstone_dust',
    'iron_ingot',
    '',
    'iron_ingot',
    ''
  ],
  ['', '', 'stick', '', 'stick', 'string', 'stick', '', 'string'],
  [
    'planks',
    'iron_ingot',
    'planks',
    'planks',
    'planks',
    'planks',
    '',
    'planks',
    ''
  ],
  [
    'stick',
    'iron_ingot',
    'stick',
    'string',
    'tripwire_hook',
    'string',
    '',
    'stick',
    ''
  ],
  ['', 'stick', 'string', 'stick', '', 'string', '', 'stick', 'string'],
  [
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    '',
    'iron_ingot'
  ],
  [
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot'
  ],
  [
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    '',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot',
    'iron_ingot'
  ],
];

List<String> names = [
  'Lead',
  'Iron Pickaxe',
  'Dropper',
  'Redstone Lamp',
  'Piston',
  'Block of Redstone',
  'Daylight Detector',
  'Note Block',
  'Dispenser',
  'TNT',
  'Hopper',
  'Chest',
  'Iron Door',
  'Rail',
  'Powered Rail',
  'Cake',
  'Golden Apple',
  'Gold Ingot',
  'Iron Hoe',
  'Iron Axe',
  'Clock',
  'Pink Stained Glass',
  'Oak Stairs',
  'Cobblestone Stairs',
  'Bookshelf',
  'Scaffolding',
  'Item Frame',
  'Banner',
  'Campfire',
  'Armor Stand',
  'Furnace',
  'Block of Iron',
  'Anvil',
  'Painting',
  'Ladder',
  'Oak Sign',
  'Jukebox',
  'Blast Furnace',
  'Enchanting Table',
  'Respawn Anchor',
  'Fletching Table',
  'Cartography Table',
  'Smoker',
  'Smithing Table',
  'End Crystal',
  'Ender Chest',
  'Redstone Comparator',
  'Target',
  'Observer',
  'Golden Carrot',
  'Beetroot Soup',
  'Rabbit Stew',
  'Compass',
  'Fishing Rod',
  'Shield',
  'Crossbow',
  'Bow',
  'Iron Leggins',
  'Iron Chestplate',
  'Cauldron',
];

List<String> items = [];

List<String> craftingTableContains = List<String>.filled(9, '');

ValueNotifier<int> recipeChangeNotifier =
    ValueNotifier<int>(Random().nextInt(names.length));
// ValueNotifier<int>(names.indexOf('Bookshelf')); //length is for debug
ValueNotifier<int> healthNotifier = ValueNotifier<int>(3);
ValueNotifier<bool> answerNotifier = ValueNotifier<bool>(false);
ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);
ValueNotifier<int> streak = ValueNotifier<int>(0);

AudioPlayer audioPlayer = AudioPlayer();
AudioCache cache = AudioCache();

final Color mainColor = Color(0xff7986cb);
final Color lightColor = Color(0xffaab6fe);
final Color secondaryColor = Color(0xffffa000);
final Color secondaryLightColor = Color(0xffffd149);

InterstitialAd defeatAd;
bool isTestingAds = true;
const testAdId = 'ca-app-pub-3940256099942544/1033173712';
const adId = '';

void main() {
  recipes.forEach((l) => items.addAll(l));
  items = items.toSet().toList()..remove('');
  print(names.length);
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  loadAd();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
      title: 'Craft Puzzle',
      theme: ThemeData(appBarTheme: AppBarTheme(color: mainColor)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text('Crafting Puzzle'),
        ),
        body: GameWidget(),
      )));
}

void loadAd() {
  InterstitialAd.load(
      adUnitId: isTestingAds ? testAdId : adId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          defeatAd = ad;
          print('ad loaded');
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ));
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    setToDefault();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Crafting Puzzle'),
        ),
        body: GameWidget(),
      ),
    );
  }
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            secondaryLightColor,
            secondaryColor,
          ],
        ),
      ),
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
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        lightColor,
                        mainColor,
                      ],
                    ),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                alignment: Alignment.center,
                child: ValueListenableBuilder<int>(
                    valueListenable: recipeChangeNotifier,
                    builder: (BuildContext context, int value, Widget child) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 60,
                            child: Text(names[value],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                            flex: 30,
                            child: Container(
                              width: 64,
                              height: 64,
                              child: Image.asset(
                                  'assets/recipes/${names[value].toLowerCase().replaceAll(' ', '_')}.png'),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: ValueListenableBuilder(
                                valueListenable: scoreNotifier,
                                builder: (BuildContext context, int score,
                                    Widget child) {
                                  return Text('$score',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500));
                                }),
                          ),
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
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          lightColor,
                          mainColor,
                        ],
                      ),
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
              child: ValueListenableBuilder<bool>(
                  valueListenable: answerNotifier,
                  builder:
                      (BuildContext context, bool isShowing, Widget child) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: isShowing
                          ? CraftingTable(List<ValueNotifier<String>>.generate(
                              9,
                              (i) => ValueNotifier<String>(
                                  recipes[recipeChangeNotifier.value][i])))
                          : CraftingTable(List<ValueNotifier<String>>.generate(
                              9, (i) => ValueNotifier<String>(''))),
                    );
                  }),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, -3),
                        blurRadius: 2,
                        spreadRadius: 0.5)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      lightColor,
                      mainColor,
                    ],
                  ),
                ),
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
          tween: ColorTween(begin: mainColor, end: Colors.red)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50),
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.red, end: mainColor)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50)
    ]).animate(controller);
    acceptAnimation = TweenSequence<Color>([
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: mainColor, end: Colors.green)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 50),
      TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.green, end: mainColor)
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
        if (answerNotifier.value == false) {
          if (compareRecipesDeeply(
              craftingTableContains, recipes[recipeChangeNotifier.value])) {
            playSound('accept');
            streak.value++;
            scoreNotifier.value += streak.value ~/ 2 + 1;
            answerNotifier.value = true;
            _animation = acceptAnimation;
            controller.forward().then((value) {
              answerNotifier.value = false;
              changeRecipe();
              controller.reset();
            });
          } else {
            streak.value = 0;
            healthNotifier.value--;
            if (healthNotifier.value != 0) {
              playSound('decline');
              answerNotifier.value = true;

              _animation = declineAnimation;
              controller.forward().then((value) {
                answerNotifier.value = false;
                changeRecipe();
                controller.reset();
              });
            } else {
              gotoDefeatScreen();
              //setToDefault();
            }
          }
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

  void gotoDefeatScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DefeatScreen(scoreNotifier.value, defeatAd)));
    print('score: ${scoreNotifier.value}');
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
    return DragTarget(builder: (BuildContext context,
        List<Object> candidateData, List<dynamic> rejectedData) {
      return GestureDetector(
        onTap: () {
          if (widget._notifier.value != '') {
            widget._notifier.value = '';
            playSound('tap1');
          }
        },
        child: Draggable<String>(
          data: widget._notifier.value,
          onDragCompleted: () => widget._notifier.value = '',
          feedback: Container(
            width: 64,
            height: 64,
            child: widget._notifier.value != ''
                ? Image.asset('assets/items/${widget._notifier.value}.png')
                : Container(),
          ),
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
        ),
      );
    }, onAccept: (String itemId) {
      if (itemId != '') {
        widget._notifier.value = itemId;
        playSound('tap');
      }
    });
  }
}

bool compareRecipesDeeply(List<String> table, List<String> recipe) {
  List<List<String>> sameRecipes = []..add(List.from(recipe));

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
      print(sameRecipes);
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
  while (ingredients.length < 5) {
    var _items = List.from(items)
      ..removeWhere((element) => ingredients.contains(element));
    print('_items.length: ${_items.length}');
    ingredients.add(_items[Random().nextInt(_items.length)]);
  }
  ingredients.shuffle();
  print(ingredients);

  return List.generate(
    ingredients.length,
    (i) => Draggable<String>(
      data: ingredients[i],
      feedback: Container(
          height: 64,
          width: 64,
          child: Image.asset('assets/items/${ingredients[i]}.png')),
      child: Container(
          //color: Colors.pink,
          height: 64,
          width: 64,
          child: Image.asset('assets/items/${ingredients[i]}.png')),
    ),
  );
}

void setToDefault() {
  loadAd();
  craftingTableContains = List<String>.filled(9, '');
  recipeChangeNotifier = ValueNotifier<int>(Random().nextInt(names.length));
  healthNotifier = ValueNotifier<int>(3);
  scoreNotifier = ValueNotifier<int>(0);
}

void playSound(String sound) async {
  audioPlayer = await cache.play('sounds/$sound.wav',
      volume: sound == 'accept' ? 0.7 : 1);
}
