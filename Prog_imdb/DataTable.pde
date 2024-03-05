class DataTable {
  Table table;
  int rowCount;
  int colCount;
  int cellPadding = 10;
  int cellWidth = 100;
  int cellHeight = 20;

  DataTable(Table table) {
    this.table = table;
    rowCount = table.getRowCount();
    colCount = table.getColumnCount();
  }

  void display() {
    // Tegn tabellen
    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < colCount; j++) {
        String value = table.getString(i, j);
        float x = j * cellWidth + cellPadding;
        float y = i * cellHeight + cellPadding;
        fill(255);
        rect(x, y, cellWidth, cellHeight);
        fill(0);
        text(value, x + cellPadding, y + cellHeight - cellPadding);
      }
    }
  }
}

String tableToString(Table table) {
  String result = "";
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    for (int j = 0; j < table.getColumnCount(); j++) {
      if (j > 0) {
        result += ", ";
      }
      result += row.getString(j);
    }
    result += "\n";
  }
  return result;
}
