import 'dart:io';
import 'dart:math';
import 'package:dartapp/dartapp.dart';

void main() {
  final expenseTracker = ExpenseTracker();
  while (true) {
    print('\n--- Expense Tracker ---');
    print('1. Add Expense');
    print('2. View Expenses');
    print('3. Calculate Total Expense');
    print('4. Edit Expense');
    print('5. Delete Expense');
    print('6. Exit');
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
        print('Total Expense: \$₦{totalExpense.toStringAsFixed(2)}');
        break;

      case '4':
        expenseTracker.viewExpenses();
        stdout.write("Enter the number of the expense to edit: ");
        String? indexInput = stdin.readLineSync();
        int? index = int.tryParse(indexInput ?? "") ?? -1;

        if (index <= 0 || index > expenseTracker.expenses.length) {
          print("invalid number. Abeg Nau😂");
        } else {
          stdout.write("Enter new Description: ");
          String? newDescription = stdin.readLineSync();
          stdout.write("Enter new Amount: ");
          String? newInputAmount = stdin.readLineSync();
          double? newAmount = double.tryParse(newInputAmount ?? "");

          if (newDescription == null ||
              newDescription.isEmpty ||
              newAmount == null ||
              newAmount <= 0) {
            print("invalid input. Abeg Nau🥲");
          } else {
            expenseTracker.editExpenses(index - 1, newDescription, newAmount);
          }
        }
        break;
      case '5':
        expenseTracker.viewExpenses();
        stdout.write("Enter the number of the expense to delete: ");
        String? indexInput = stdin.readLineSync();
        int? index = int.tryParse(indexInput ?? "") ?? -1;

        if (index <= 0 || index > expenseTracker.expenses.length) {
          print("invalid number. Abeg Nau😂");
        } else {
          expenseTracker.deleteExpense(index - 1);
          print("expenses deleted successfully");
        }
        break;
      case '6':
        print('Exiting the application. Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
