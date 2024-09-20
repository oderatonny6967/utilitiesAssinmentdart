import 'dart:io';  // For file handling
// For encoding/decoding text

// Function for String Manipulation
void stringManipulation(String input) {
  print("Original String: $input");

  // Concatenation
  String concatenated = input + " is manipulated";
  print("Concatenated: $concatenated");

  // Interpolation
  String interpolated = "Interpolated String: ${input.toUpperCase()}";
  print(interpolated);

  // Substring extraction
  if (input.length > 4) {
    String substring = input.substring(0, 4);
    print("Substring (first 4 chars): $substring");
  }

  // Case conversion
  String upperCase = input.toUpperCase();
  String lowerCase = input.toLowerCase();
  print("Uppercase: $upperCase");
  print("Lowercase: $lowerCase");

  // Reverse the string
  String reversed = input.split('').reversed.join('');
  print("Reversed String: $reversed");

  // String length
  print("String Length: ${input.length}");
}

// Function for Collection Manipulation (Lists, Sets, Maps)
void collectionExamples() {
  // List
  List<String> shoppingList = ["Milk", "Bread", "Eggs"];
  shoppingList.add("Cheese");
  print("\nShopping List:");
  shoppingList.forEach((item) => print(item));

  // Set (Unique values)
  Set<String> uniqueItems = {"Apple", "Banana", "Orange"};
  uniqueItems.add("Banana");  // Duplicate, will be ignored
  print("\nUnique Items Set:");
  uniqueItems.forEach((item) => print(item));

  // Map (Key-Value Pair)
  Map<String, int> itemPrices = {"Milk": 50, "Bread": 30, "Eggs": 70};
  itemPrices["Cheese"] = 90;  // Adding new key-value pair
  print("\nItem Prices Map:");
  itemPrices.forEach((item, price) => print("$item: \$$price"));
}

// Function for File Handling (reading from one file and writing to another)
Future<void> fileHandlingExample() async {
  String inputFilePath = "input.txt";
  String outputFilePath = "output.txt";

  try {
    // Reading from file
    String fileContent = await File(inputFilePath).readAsString();
    print("\nContent from $inputFilePath: $fileContent");

    // Writing to another file
    String newContent = "This is new data written to output.txt\n";
    await File(outputFilePath).writeAsString(newContent, mode: FileMode.write);
    print("New data written to $outputFilePath");
  } catch (e) {
    print("Error during file operations: $e");
  }
}

// Function for Date and Time Manipulation
void dateTimeExample() {
  DateTime now = DateTime.now();
  print("\nCurrent Date and Time: $now");

  // Formatting date
  print("Formatted Date: ${now.day}-${now.month}-${now.year}");

  // Adding/subtracting days
  DateTime tomorrow = now.add(Duration(days: 1));
  DateTime yesterday = now.subtract(Duration(days: 1));
  print("Tomorrow: $tomorrow");
  print("Yesterday: $yesterday");

  // Calculating the difference between two dates
  DateTime anotherDate = DateTime(2023, 9, 1);
  Duration difference = now.difference(anotherDate);
  print("Difference between now and $anotherDate: ${difference.inDays} days");
}

// Function to log data to a file with timestamp
Future<void> logEntry(String data) async {
  String logFilePath = "log.txt";
  DateTime now = DateTime.now();
  String logEntry = "[$now] $data\n";

  // Appending log entry to file
  await File(logFilePath).writeAsString(logEntry, mode: FileMode.append);
  print("Logged entry: $logEntry");
}

void main() async {
  // String Manipulation
  print("\n--- String Manipulation ---");
  stringManipulation("Dart Programming");

  // Collections (List, Set, Map)
  print("\n--- Collections (List, Set, Map) ---");
  collectionExamples();

  // File Handling
  print("\n--- File Handling ---");
  await fileHandlingExample();

  // Date and Time
  print("\n--- Date and Time ---");
  dateTimeExample();

  // Log Data to File
  print("\n--- Logging Data ---");
  await logEntry("User input 'Dart Programming' was manipulated and logged.");
}
