// Student: Osman Albager Mohamed Saeed
// Reg no:  25969
const String regNo = '25969';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by O.A.M.S
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by O.A.M.S
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  if (negative) result = '-' + result;
  return '$result RWF';
}

bool isValidPin(String pin) {
  // by O.A.M.S
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) return false;
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  return !allSame;
}

int sendMoney(int balance, int amount) {
  // by O.A.M.S
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by O.A.M.S
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be between 100 and 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime bought: ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by O.A.M.S
  print('Reg no: $regNo | D = $d | T = $t');

  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(1000));
  print(formatRwf(1250000));
  print(formatRwf(-5000));

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));
}
