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

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int k = 1;
  while (k <= 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    k++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(-999));     // -999 RWF  (might break: no comma after the minus)
  print(formatRwf(1000000));  // 1,000,000 RWF
  print(formatRwf(123456789)); // 123,456,789 RWF
  print(isValidPin('48 21')); // false (space is not a digit)
  print(isValidPin(''));      // false (empty, might break on pin[0])
  print(isValidPin('00000')); // false (same digit five times)
}
