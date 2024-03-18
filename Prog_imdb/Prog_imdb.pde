// Dette er en Processing-fil (.pde), der også understøtter Java-kode.
//hej
import java.util.regex.Pattern;
import java.util.regex.Matcher;
SearchBar searchBar;
ArrayList<Movie> movies;
ArrayList<Movie> searchResults;
import com.reades.mapthing.*;
import net.divbyzero.gpx.*;
import net.divbyzero.gpx.parser.*;

import processing.data.Table;
import processing.data.TableRow;

Table table;
String tableAsString = "";

void setup() {
  // Initialiseringskode, kaldes én gang ved start
  size(800, 600);

  searchBar = new SearchBar(width/2.8, height/4, 200, 30);

  movies = new ArrayList<Movie>();

  table = loadTable("IMDB.csv", "header");
  DataTable dataTable = new DataTable(table);
  dataTable.display();

  // Gem data som en streng
  tableAsString = tableToString(table);

  // Udskriv tabellen som en streng
  println(tableAsString);

  for (int i=0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    movies.add(new Movie(row.getString("Name")));
  }
}


void draw() {
  // Kode til at tegne, opdateres kontinuerligt
  background(255); // Hvid baggrund
  searchBar.display();
  displaySearchResults();
  fill(0); // Sort tekstfarve
  textSize(20);
  textAlign(CENTER);

  // Viser en besked på skærmen
  text("Søg film", width/2, height/10);
}
void keyPressed() {
  searchBar.keyPressed();
}

void mousePressed() {
  searchBar.mousePressed();
}


/*void displaySearchResults() {
  // Hent søgeordet fra søgebjælken
  String searchTerm = searchBar.getSearchTerm().toLowerCase();

  // Filtrer film baseret på søgeordet og søgebjælken
  searchResults = new ArrayList<Movie>();

  if (!searchTerm.isEmpty()) {
    for (Movie movie : movies) {
      // Tjek om filmens titel indeholder det indtastede søgeord
      if (movie.title.toLowerCase().contains(searchTerm)) {
        searchResults.add(movie);
      }
    }
  }

  // Vis søgeresultater
  fill(0);
  textAlign(LEFT, TOP);
  textSize(16);

  if (!searchTerm.isEmpty() && !searchResults.isEmpty()) {
    for (int i = 0; i < searchResults.size(); i++) {
      text(searchResults.get(i).title, 300, 200 + i * 30);
    }
  } else if (!searchTerm.isEmpty()) {
    text("Ingen resultater", 300, 200);
  }
}*/

void displaySearchResults() {
  String searchTerm = searchBar.getSearchTerm().toLowerCase();

  searchResults = new ArrayList<Movie>();

  if (!searchTerm.isEmpty()) {
    for (int i = 0; i < movies.size(); i++) {
      Movie movie = movies.get(i);
      if (movie.title.toLowerCase().contains(searchTerm)) {
        searchResults.add(movie);
      }
    }
  }

  if (!searchResults.isEmpty()) {
    float buttonX = 300;
    float buttonY = 200;
    float buttonWidth = 200;
    float buttonHeight = 30;
    
    for (int i = 0; i < searchResults.size(); i++) {
      Movie movie = searchResults.get(i);
      ButtonBase button = new ButtonBase(buttonX, buttonY + i * (buttonHeight + 10), buttonWidth, buttonHeight, movie.title);
      button.display();
      
      if (button.isClicked()) {
        // Skift til hvid skærm
        background(255);
      }
    }
  } else if (!searchTerm.isEmpty()) {
    text("Ingen resultater", 300, 200);
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
