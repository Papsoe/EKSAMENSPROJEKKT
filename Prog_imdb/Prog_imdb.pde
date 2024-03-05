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
  searchBar = new SearchBar(width/2, height/5, 200, 30);

  table = loadTable("Movie.csv", "header");
  DataTable dataTable = new DataTable(table);
  dataTable.display();
  
  // Gem data som en streng
  tableAsString = tableToString(table);
  
  // Udskriv tabellen som en streng
  println(tableAsString);

  movies = new ArrayList<Movie>();
  movies.add(new Movie("Inception"));
  movies.add(new Movie("The Dark Knight"));
  movies.add(new Movie("Interstellar"));
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
  text("Velkommen til din IMDb-lignende hjemmeside!", width/2, height/10);
}
void keyPressed() {
  searchBar.keyPressed();
}

void mousePressed() {
  searchBar.mousePressed();
}


void displaySearchResults() {
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
      text(searchResults.get(i).title, 300, 100 + i * 30);
    }
  } else if (!searchTerm.isEmpty()) {
    text("Ingen resultater", 300, 100);
  }
}
