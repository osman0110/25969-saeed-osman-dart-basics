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

void main() {
  // by O.A.M.S
  print('Reg no: $regNo | D = $d | T = $t');

  String myName = 'Osman Albager Mohamed Saeed';
  print('$myName has ${countVowels(myName)} vowels');
}
