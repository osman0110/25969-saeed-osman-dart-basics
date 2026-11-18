// Student: Osman Albager Mohamed Saeed
// Reg no:  25969
const String regNo = '25969';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by O.A.M.S
  String lower = text.toLowerCase();
  int total = 0;
  for (int i = 0; i < lower.length; i++) {
    if ('aeiou'.contains(lower[i])) {
      total++;
    }
  }
  return total;
}

String initials(String fullName) {
  // by O.A.M.S
  List<String> parts = fullName.split(' ');
  String result = '';
  for (String part in parts) {
    if (part.isNotEmpty) {
      result += part[0].toUpperCase() + '.';
    }
  }
  return result;
}

void drawTriangle(int height) {
  // by O.A.M.S
  for (int row = 1; row <= height; row++) {
    String symbol = row % 2 == 1 ? '*' : '#';
    print(' ' * (height - row) + symbol * row);
  }
}

int momoFee(int amount) {
  // by O.A.M.S
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by O.A.M.S
  if (phone.length != 10) return 'INVALID';
  String masked = phone.substring(0, 3);
  int i = 3;
  while (i < phone.length - 2) {
    masked += '*';
    i++;
  }
  masked += phone.substring(phone.length - 2);
  return masked;
}

void main() {
  // by O.A.M.S
  print('Reg no: $regNo | D = $d | T = $t');

  String myName = 'Osman Albager Mohamed Saeed';
  print('$myName has ${countVowels(myName)} vowels');

  print(initials(myName));
  print(initials(' ana  uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}
