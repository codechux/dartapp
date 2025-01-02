import 'dart:io';
import 'package:dartapp/dartapp.dart';

void main() {
  final expenseTracker = ExpenseTracker();
  while (true) {
    print('\n--- Expense Tracker ---');
    print('1. Add Expense');
    print('2. View Expenses');
    print('3. Calculate Total Expense');
    print('4. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter description: ');
        String? description = stdin.readLineSync();
        stdout.write('Enter amount: ');
        String? amountInput = stdin.readLineSync();
        double? amount = double.tryParse(amountInput ?? '');

        if (description == null ||
            description.isEmpty ||
            amount == null ||
            amount <= 0) {
          print('Invalid input. Please try again.');
        } else {
          expenseTracker.addExpense(description, amount);
        }
        break;

      case '2':
        expenseTracker.viewExpenses();
        break;

      case '3':
        double totalExpense = expenseTracker.calculateTotalExpense();
        print('Total Expense: \$${totalExpense.toStringAsFixed(2)}');
        break;

      case '4':
        print('Exiting the application. Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
