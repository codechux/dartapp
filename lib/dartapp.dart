class Expense {
  String description;
  double amount;

  Expense(this.description, this.amount);

  @override
  String toString() {
    return 'Description: $description, Amount: \$${amount.toStringAsFixed(2)}';
  }
}

class ExpenseTracker {
  List<Expense> expenses = [];

  void addExpense(String description, double amount) {
    expenses.add(Expense(description, amount));
    print('Expense added successfully!');
  }

  void viewExpenses() {
    if (expenses.isEmpty) {
      print('No expenses to display.');
      return;
    }
    print('\n--- Expenses ---');
    for (int i = 0; i < expenses.length; i++) {
      print('${i + 1}. ${expenses[i]}');
    }
  }

  double calculateTotalExpense() {
    return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }
}
