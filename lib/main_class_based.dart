import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Flutter公式のサンプル「Building layouts」は、Functional Widgetsというあまり実践的ではない書き方をしているため
// 実務でよく利用するClass Widgetsでの実装に書き換えたサンプルです。
// 研修では公式ドキュメントに倣ってFunctional Widgetsで書きましたが、
// 本ファイルのClass Widgetsを使った書き方の方が一般的かつ読みやすいのでおすすめです。
// ref. https://future-architect.github.io/articles/20220316a/
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Column(
          children: [
            // 作成したClass Widgetを呼び出しています。
            // Functional Widgetと書きぶりが異なっているので注意してください。
            // 比較してみても、Class Widgetを使った方が見やすいですね。
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),
      ),
    );
  }
}

/// Step2: Implement the title row
///
/// [TitleSection]というWidgetをクラスで作成しなおしました。
class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

/// Step3: Implement the button row
///
/// [ButtonSection]というWidgetをクラスで作成しなおしました。
/// [ButtonColumn]というWidgetを縦に並べて実装しています。
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonColumn(color: color, icon: Icons.call, label: 'CALL'),
        ButtonColumn(color: color, icon: Icons.near_me, label: 'ROUTE'),
        ButtonColumn(color: color, icon: Icons.share, label: 'SHARE'),
      ],
    );
  }
}

/// Step3: Implement the button row
///
/// [ButtonColumn]というWidgetをクラスで作成しなおしました。
/// フィールドには色、アイコン、テキストを持たせて呼び出し側から自由に変更できるようにしています。
class ButtonColumn extends StatelessWidget {
  const ButtonColumn({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

/// Step4: Implement the text section
///
/// [TextSection]というWidgetをクラスで作成しなおしました。
class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}
