import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  print('''
    ********************
    HESAP MAKİNESİ
    ********************
    (+) Toplama
    (-) Çıkarma
    (*) Çarpma
    (/) Bölme
    ********************''');
  Calculator.runCalc();
}

class Calculator {
// Instance kısmı.
  var num1;
  var num2;

// Constructor yapısı.
  Calculator(var number1, var number2) {
    this.num1 = number1;
    this.num2 = number2;
  }

// Dört işlem metodları.
  double add(double number1, double number2) {
    return number1 + number2;
  }

  double subtract(double number1, double number2) {
    return number1 - number2;
  }

  double multiply(double number1, double number2) {
    return number1 * number2;
  }

  double divide(double number1, double number2) {
    return number1 / number2;
  }

// İşlem sıfırlayıp ana menüye dönme.
  static void backToMenu() {
    print("\nYeni bir işlem başlatılıyor...\n");
    runCalc();
  }

  // Asıl 'hesap makinesi' işlemleri.
  static void runCalc() {
    print(r"('0' yazılması durumunda çıkış yapılacaktır.)");
    print("İlk sayıyı giriniz: ");
    var input1 = stdin.readLineSync();
    if (input1 != null) {
      // İstenilen dışı bir girdi alındığında programın verebileceği hata yakalandı.
      try {
        double.parse(input1);
      } on Exception {
        print("\nLütfen geçerli bir sayı giriniz.");
        backToMenu();
      }

      if (double.parse(input1) == 0) {
        print("Hesap makinesinden çıkılıyor.");
        exit(0);
      }

      print("İkinci sayıyı giriniz: ");
      var input2 = stdin.readLineSync();
      if (input2 != null) {
        try {
          double.parse(input2);
        } on Exception {
          print("\nLütfen geçerli bir sayı giriniz.");
          backToMenu();
        }

        print("Yapmak istediğiniz işlemi giriniz: ");
        var operation = stdin.readLineSync();
        double firstnum = double.parse(input1);
        double secondnum = double.parse(input2);

        Calculator calc = new Calculator(firstnum, secondnum);

        switch (operation) {
          case "+":
            print(
                "${calc.num1} + ${calc.num2} = ${calc.add(firstnum, secondnum)}");
            backToMenu();
            break;
          case "-":
            print(
                "${calc.num1} - ${calc.num2} = ${calc.subtract(firstnum, secondnum)}");
            backToMenu();
            break;
          case "*":
            print(
                "${calc.num1} * ${calc.num2} = ${calc.multiply(firstnum, secondnum)}");
            backToMenu();
            break;
          case "/":
            if (secondnum == 0) {
              print("Herhangi bir sayı '0'a bölünmez.");
              backToMenu();
            } else {
              print(
                  "${calc.num1} / ${calc.num2} = ${calc.divide(firstnum, secondnum)}");
              backToMenu();
            }
            break;
          default:
            print("Geçersiz giriş.");
            backToMenu();
            break;
        }
      }
    }
  }
}
