import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

Map locales = {
  'en_US': {
    'kilos': 'Enter your weight in kilograms.',
    'fill': 'Fill in all the fields to get your daily calorie requirement.',
    'woman': "Woman",
    'man': 'Man',
    'enterage' : 'Press to enter your age',
    'age' : 'Your age is ',
    'size': 'Your height is ',
    'little': 'Little',
    'moderate': 'Moderate',
    'high': 'High',
    'sport': 'What is your sport activity',
    'calculate': 'Calculate',
    'error': 'Error',
    'notfill': 'The fields are not all filled',
    'ok': 'OK',
    'your': 'Your calorie requirement',
    'needbase': 'Your basic need is to ',
    'needsport': 'Your need with sports activity is ',
    'title': 'Calorie calculator'
  },

  'fr_FR': {'kilos': 'Entrez votre poids en kilos.',
    'fill': 'Remplissez tous les champs pour obtenir votre besoin journalier en calories.',
    'woman': "Femme",
    'man': 'Homme',
    'enterage' : 'Appuyez pour entrer votre âge',
    'age' : 'Votre age est de ',
    'size': 'Votre taille est de ',
    'little': 'Faible',
    'moderate': 'Modérée',
    'high': 'Forte',
    'sport': 'Quelle est votre activité sportive',
    'calculate': 'Calculer',
    'error': 'Erreur',
    'notfill': 'Les champs ne sont pas tous remplis',
    'ok': 'OK',
    'your': 'Votre besoin en calories',
    'needbase': 'Votre beoin de base est de ',
    'needsport': 'Votre besoin avec activité sportive est de ',
    'title': 'Calculateur calories'
  },

  'es_ES': {'kilos': 'Ingrese su peso en kilogramos.',
    'fill': 'Complete todos los campos para obtener su requerimiento diario de calorías.',
    'woman': "Mujer",
    'man': 'Hombre',
    'enterage' : 'Presione para ingresar su edad',
    'age' : 'Tu edad es ',
    'size': 'Tu altura es ',
    'little': 'Bajo',
    'moderate': 'Moderada',
    'high': 'Alta',
    'sport': 'Cual es tu actividad deportiva ',
    'calculate': 'Calcular',
    'error': 'Culpa',
    'notfill': 'Los campos no están todos llenos',
    'ok': 'OK',
    'your': 'Tu requerimiento calórico',
    'needbase': 'Tu necesidad básica es ',
    'needsport': 'Tu necesidad con la actividad deportiva es ',
    'title': 'Calculadora de calorías'
  },

  'ar_DZ': {'kilos': 'أدخل وزنك بالكيلوجرام.',
    'fill': 'املأ جميع الحقول للحصول على متطلباتك اليومية من السعرات الحرارية.',
    'woman': "زوجة",
    'man': 'رجل',
    'enterage' : 'اضغط لإدخال عمرك',
    'age' : 'عمرك هو ',
    'size': 'طولك ',
    'little': 'منخفض',
    'moderate': 'معتدل',
    'high': 'عالي',
    'sport': 'ما هو نشاطك الرياضي ',
    'calculate': 'احسب',
    'error': 'خطأ',
    'notfill': 'لم يتم ملء جميع الحقول',
    'ok': 'OK',
    'your': 'متطلبات السعرات الحرارية الخاصة بك',
    'needbase': 'حاجتك الأساسية هي ',
    'needsport': 'حاجتك مع النشاط الرياضي هي ',
    'title': 'حاسبة السعرات الحرارية'
  },

  'pt_BR': {'kilos': 'Insira seu peso em quilogramas.',
    'fill': 'Preencha todos os campos para obter sua necessidade diária de calorias.',
    'woman': "Esposa",
    'man': 'Homem',
    'enterage' : 'Pressione para inserir sua idade',
    'age' : 'Sua idade é ',
    'size': 'Sua altura é ',
    'little': 'Baixo',
    'moderate': 'Moderada',
    'high': 'Alta',
    'sport': 'Qual é a sua atividade esportiva ',
    'calculate': 'Calcular',
    'error': 'Culpa',
    'notfill': 'Os campos não estão todos preenchidos',
    'ok': 'OK',
    'your': 'Sua necessidade de calorias',
    'needbase': 'Sua necessidade básica é ',
    'needsport': 'Sua necessidade com a atividade esportiva é ',
    'title': 'Calculadora de calorias'
  },
};

String i18n(String slug) {
  String locale = 'ar_DZ';
  String trad = locales[locale][slug];

  return trad;
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '${i18n('title')}'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // Variables

  int caloriesBase;
  int calorieAvecActivite;
  int radioSelectionnee;
  double poids;
  bool gender = false;
  double age;
  double taille = 157.0;


  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: new Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: setColor(),
          ),
          body: new SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Spin(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  padding(),
                  texteAvecStyle("${i18n('fill')}"),
                  padding(),
                  new Card(
                    elevation: 20.0,
                    child: new Column(
                      children: <Widget>[
                        padding(),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            texteAvecStyle("${i18n('woman')}", color: Colors.pink),
                            new Switch(
                                inactiveTrackColor: Colors.pink,
                                inactiveThumbColor: Colors.pink,
                                activeTrackColor: Colors.blue,
                                value: gender,
                                onChanged: (bool b) {
                                  setState(() {
                                    gender = b;
                                  });
                                }
                            ),
                            texteAvecStyle("${i18n('man')}", color: Colors.blue),
                          ],
                        ),
                        padding(),
                        new RaisedButton(
                            color: setColor(),
                            child: texteAvecStyle((age == null) ? '${i18n('enterage')}' : '${i18n('age')} : ${age.toInt()}',
                              color: Colors.white,
                            ),
                            onPressed: (() => montrerPicker())
                        ),
                        padding(),
                        texteAvecStyle('${i18n('size')} : ${taille.toInt()} cm', color: setColor()),
                        padding(),
                        new Slider(
                          value: taille,
                          activeColor: setColor(),
                          onChanged: (double d) {
                            setState(() {
                              taille = d;
                            });
                          },
                          max: 215.0,
                          min: 100.0,
                        ),
                        padding(),
                        new TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (String string) {
                            setState(() {
                              poids = double.tryParse(string);
                            });
                          },
                          decoration: new InputDecoration(
                              labelText: "${i18n('kilos')}"
                          ),
                        ),
                        padding(),
                        texteAvecStyle('${(i18n('sport'))} : ', color: setColor()),
                        padding(),
                        rowRadio(),
                        padding(),
                      ],
                    ),
                  ),
                  padding(),
                  new RaisedButton(
                    onPressed: calculerNombreDeCalories,
                    color: setColor(),
                    child: texteAvecStyle('${i18n('calculate')}',color: Colors.white),
                  ),
                ],
              ),
            )
          ),
        ),
    );


  }

  Padding padding() {
    return new Padding(
        padding: EdgeInsets.only(top: 20),
    );
  }

  Future<Null> montrerPicker() async {
    DateTime choix = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1976),
        lastDate: new DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    builder: (BuildContext context, Widget child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light().copyWith(
                  primary: setColor(),
                ),
              ),
            child: child,
          );
    },
    );
    if (choix != null) {
      var difference = new DateTime.now().difference(choix);
      var jours = difference.inDays;
      var ans = (jours / 365.25);
      setState(() {
        age = ans;
      });
    }
  }

  Color setColor() {
    if (gender == true) {
      return Colors.blue;
    } else {
      return Colors.pink;
    }
  }

  Text texteAvecStyle(String data, {color: Colors.black, fontSize: 15.0}) {
    return new Text(
      data,
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
  
  Row rowRadio() {
    Map mapActivite = {
      0: '${i18n('little')}',
      1: '${i18n('moderate')}',
      2: '${i18n('high')}',
    };
    List<Widget> l = [];
    mapActivite.forEach((key, value) { 
      Column colonne = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Radio(
            activeColor: setColor(),
              value: key,
              groupValue: radioSelectionnee,
              onChanged: (Object i) {
              setState(() {
                radioSelectionnee = i;
              });
              }
          ),
          texteAvecStyle(value, color: setColor())
        ],
      );
      l.add(colonne);
    });
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: l,
    );
  }
  
  void calculerNombreDeCalories() {
    if (age != null && poids != null && radioSelectionnee != null) {
      if (gender){
        caloriesBase = (66.4730 + (13.7516 * poids) + (5.0033 * taille) - (6.7550 * age)).toInt();
      } else {
        caloriesBase = (655.0955 + (9.5634 * poids) + (1.8496 * taille) - (4.6756 * age)).toInt();
      }
      switch(radioSelectionnee) {
        case 0:
          calorieAvecActivite = (caloriesBase * 1.2).toInt();
          break;
        case 1:
          calorieAvecActivite = (caloriesBase * 1.5).toInt();
          break;
        case 2:
          calorieAvecActivite = (caloriesBase * 1.8).toInt();
          break;
        default:
          calorieAvecActivite = caloriesBase;
          break;
      }

      setState(() {
        dialogue();
      });
    } else {
      alerte();
    }
  }

  Future<Null> dialogue() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return SimpleDialog(
          title: texteAvecStyle('${i18n('your')}', color: setColor()),
          contentPadding: EdgeInsets.all(15.0),
          children: <Widget>[
            padding(),
            texteAvecStyle('${i18n('needbase')} : $caloriesBase cal'),
            padding(),
            texteAvecStyle('${i18n('needsport')} : $calorieAvecActivite cal'),
            new RaisedButton(
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              child: texteAvecStyle('${i18n('ok')}', color: Colors.white),
              color: setColor(),
            ),
          ],
        );
      }
    );
  }

  Future<Null> alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return new AlertDialog(
            title: texteAvecStyle('${i18n('error')}', fontSize: 20.0),
            content: texteAvecStyle('${i18n('notfill')}'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: texteAvecStyle('${i18n('ok')}', color: Colors.red))
            ],
          );
        }
    );
  }
}
