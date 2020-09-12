<main class="col-md markdown-body">

<h1 id="movies">Movies</h1>

<p>Write SQL queries to answer questions about a database of movies.</p>

<h2 id="getting-started">Getting Started</h2>

<p>Here’s how to download this problem into your own CS50 IDE. Log into <a href="https://ide.cs50.io/">CS50 IDE</a> and then, in a terminal window, execute each of the below.</p>

<ul>
  <li data-marker="*">Execute <code class="highlighter-rouge">cd</code> to ensure that you’re in <code class="highlighter-rouge">~/</code> (i.e., your home directory, aka <code class="highlighter-rouge">~</code>).</li>
  <li data-marker="*">If you haven’t already, execute <code class="highlighter-rouge">mkdir pset7</code> to make (i.e., create) a directory called <code class="highlighter-rouge">pset7</code> in your home directory.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">cd pset7</code> to change into (i.e., open) that directory.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">wget https://cdn.cs50.net/2019/fall/psets/7/movies/movies.zip</code> to download a (compressed) ZIP file with this problem’s distribution.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">unzip movies.zip</code> to uncompress that file.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">rm movies.zip</code> followed by <code class="highlighter-rouge">yes</code> or <code class="highlighter-rouge">y</code> to delete that ZIP file.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">ls</code>. You should see a directory called <code class="highlighter-rouge">movies</code>, which was inside of that ZIP file.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">cd movies</code> to change into that directory.</li>
  <li data-marker="*">Execute <code class="highlighter-rouge">ls</code>. You should see a <code class="highlighter-rouge">movies.db</code> file, and some empty <code class="highlighter-rouge">.sql</code> files as well.</li>
</ul>

<p>Alternatively, you’re welcome to download and unzip <a href="https://cdn.cs50.net/2019/fall/psets/7/movies/movies.zip">cdn.cs50.net/2019/fall/psets/7/movies/movies.zip</a> on your own computer and then open it in <a href="https://sqlitebrowser.org/dl/">DB Browser for SQLite</a>. But be sure to upload your <code class="highlighter-rouge">.sql</code> files to CS50 IDE ultimately so that you can submit them via <code class="highlighter-rouge">submit50</code>.</p>

<h2 id="understanding">Understanding</h2>

<p>Provided to you is a file called <code class="highlighter-rouge">movies.db</code>, a SQLite database that stores data from <a href="https://www.imdb.com/">IMDb</a> about movies, the people who directed and starred in them, and their ratings. In a terminal window, run <code class="highlighter-rouge">sqlite3 movies.db</code> so that you can begin executing queries on the database.</p>

<p>First, when <code class="highlighter-rouge">sqlite3</code> prompts you to provide a query, type <code class="highlighter-rouge">.schema</code> and press enter. This will output the <code class="highlighter-rouge">CREATE TABLE</code> statements that were used to generate each of the tables in the database. By examining those statements, you can identify the columns present in each table.</p>

<p>Notice that the <code class="highlighter-rouge">movies</code> table has an <code class="highlighter-rouge">id</code> column that uniquely identifies each movie, as well as columns for the <code class="highlighter-rouge">title</code> of a movie and the <code class="highlighter-rouge">year</code> in which the movie was released. The <code class="highlighter-rouge">people</code> table also has an <code class="highlighter-rouge">id</code> column, and also has columns for each person’s <code class="highlighter-rouge">name</code> and <code class="highlighter-rouge">birth</code> year.</p>

<p>Movie ratings, meanwhile, are stored in the <code class="highlighter-rouge">ratings</code> table. The first column in the table is <code class="highlighter-rouge">movie_id</code>: a foreign key that references the <code class="highlighter-rouge">id</code> of the <code class="highlighter-rouge">movies</code> table. The rest of the row contains data about the <code class="highlighter-rouge">rating</code> for each movie and the number of <code class="highlighter-rouge">votes</code> the movie has received on IMDb.</p>

<p>Finally, the <code class="highlighter-rouge">stars</code> and <code class="highlighter-rouge">directors</code> tables match people to the movies in which they acted or directed. (Only <a href="https://www.imdb.com/interfaces/">principal</a> stars and directors are included.) Each table has just two columns: <code class="highlighter-rouge">movie_id</code> and <code class="highlighter-rouge">person_id</code>, which reference a specific movie and person, respectively.</p>

<p>The challenge ahead of you is to write SQL queries to answer a variety of different questions by selecting data from one or more of these tables.</p>

<h2 id="specification">Specification</h2>

<p>For each of the following problems, you should write a single SQL query that outputs the results specified by each problem. Your response must take the form of a single SQL query, though you may nest other queries inside of your query. You <strong>should not</strong> assume anything about the <code class="highlighter-rouge">id</code>s of any particular movies or people: your queries should be accurate even if the <code class="highlighter-rouge">id</code> of any particular movie or person were different. Finally, each query should return only the data necessary to answer the question: if the problem only asks you to output the names of movies, for example, then your query should not also output the each movie’s release year.</p>

<p>You’re welcome to check your queries’ results against <a href="https://www.imdb.com/">IMDb</a> itself, but realize that ratings on the website might differ from those in <code class="highlighter-rouge">movies.db</code>, as more votes might have been cast since we downloaded the data!</p>

<ol>
  <li>In <code class="highlighter-rouge">1.sql</code>, write a SQL query to list the titles of all movies released in 2008.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the title of each movie.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">2.sql</code>, write a SQL query to determine the birth year of Emma Stone.
    <ul>
      <li data-marker="*">Your query should output a table with a single column and a single row (plus optional header) containing Emma Stone’s birth year.</li>
      <li data-marker="*">You may assume that there is only one person in the database with the name Emma Stone.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">3.sql</code>, write a SQL query to list the titles of all movies with a release date on or after 2018, in alphabetical order.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the title of each movie.</li>
      <li data-marker="*">Movies released in 2018 should be included, as should movies with release dates in the future.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">4.sql</code>, write a SQL query to determine the number of movies with an IMDb rating of 10.0.
    <ul>
      <li data-marker="*">Your query should output a table with a single column and a single row (plus optional header) containing the number of movies with a 10.0 rating.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">5.sql</code>, write a SQL query to list the titles and release years of all Harry Potter movies, in chronological order.
    <ul>
      <li data-marker="*">Your query should output a table with two columns, one for the title of each movie and one for the release year of each movie.</li>
      <li data-marker="*">You may assume that the title of all Harry Potter movies will begin with the words “Harry Potter”, and that if a movie title begins with the words “Harry Potter”, it is a Harry Potter movie.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">6.sql</code>, write a SQL query to determine the average rating of all movies released in 2012.
    <ul>
      <li data-marker="*">Your query should output a table with a single column and a single row (plus optional header) containing the average rating.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">7.sql</code>, write a SQL query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.
    <ul>
      <li data-marker="*">Your query should output a table with two columns, one for the title of each movie and one for the rating of each movie.</li>
      <li data-marker="*">Movies that do not have ratings should not be included in the result.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">8.sql</code>, write a SQL query to list the names of all people who starred in Toy Story.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the name of each person.</li>
      <li data-marker="*">You may assume that there is only one movie in the database with the title Toy Story.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">9.sql</code>, write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the name of each person.</li>
      <li data-marker="*">People with the same birth year may be listed in any order.</li>
      <li data-marker="*">No need to worry about people who have no birth year listed, so long as those who do have a birth year are listed in order.</li>
      <li data-marker="*">If a person appeared in more than one movie in 2004, they should only appear in your results once.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">10.sql</code>, write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the name of each person.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">11.sql</code>, write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the title of each movie.</li>
      <li data-marker="*">You may assume that there is only one person in the database with the name Chadwick Boseman.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">12.sql</code>, write a SQL query to list the titles of all movies in which both Johnny Depp and Helena Bonham Carter starred.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the title of each movie.</li>
      <li data-marker="*">You may assume that there is only one person in the database with the name Johnny Depp.</li>
      <li data-marker="*">You may assume that there is only one person in the database with the name Helena Bonham Carter.</li>
    </ul>
  </li>
  <li>In <code class="highlighter-rouge">13.sql</code>, write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred.
    <ul>
      <li data-marker="*">Your query should output a table with a single column for the name of each person.</li>
      <li data-marker="*">There may be multiple people named Kevin Bacon in the database. Be sure to only select the Kevin Bacon born in 1958.</li>
      <li data-marker="*">Kevin Bacon himself should not be included in the resulting list.</li>
    </ul>
  </li>
</ol>

<h2 id="usage">Usage</h2>

<p>To test your queries on CS50 IDE, you can query the database by running</p>

<div class="highlighter-rouge"><div class="highlight"><pre class="highlight"><code>$ cat filename.sql | sqlite3 movies.db
</code></pre></div></div>

<p>where <code class="highlighter-rouge">filename.sql</code> is the file containing your SQL query.</p>

<p>Or you can paste them into DB Browser for SQLite’s <strong>Execute SQL</strong> tab and click ▶.</p>

<h2 id="hints">Hints</h2>

<ul>
  <li data-marker="*">See <a href="https://www.w3schools.com/sql/sql_ref_keywords.asp">this SQL keywords reference</a> for some SQL syntax that may be helpful!</li>
</ul>

<h2 id="testing">Testing</h2>

<p>No <code class="highlighter-rouge">check50</code> for this problem! But be sure to test each query and ensure that the output is what you expect. You can run <code class="highlighter-rouge">sqlite3 movies.db</code> to run additional queries on the database to ensure that your result is correct.</p>

<p>If you’re using the <code class="highlighter-rouge">movies.db</code> database provided in this problem set’s distribution, you should find that</p>
<ul>
  <li data-marker="*">Executing <code class="highlighter-rouge">1.sql</code> results in a table with 1 column and 9,480 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">2.sql</code> results in a table with 1 column and 1 row.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">3.sql</code> results in a table with 1 column and 35,755 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">4.sql</code> results in a table with 1 column and 1 row.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">5.sql</code> results in a table with 2 columns and 10 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">6.sql</code> results in a table with 1 column and 1 row.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">7.sql</code> results in a table with 2 columns and 6,835 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">8.sql</code> results in a table with 1 column and 4 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">9.sql</code> results in a table with 1 column and 18,013 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">10.sql</code> results in a table with 1 column and 1,841 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">11.sql</code> results in a table with 1 column and 5 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">12.sql</code> results in a table with 1 column and 6 rows.</li>
  <li data-marker="*">Executing <code class="highlighter-rouge">13.sql</code> results in a table with 1 column and 176 rows.</li>
</ul>

<h2 id="how-to-submit">How to Submit</h2>

<p>Execute the below, logging in with your GitHub username and password when prompted. For security, you’ll see asterisks (<code class="highlighter-rouge">*</code>) instead of the actual characters in your password.</p>

<div class="highlighter-rouge"><div class="highlight"><pre class="highlight"><code>submit50 cs50/problems/2020/x/movies
</code></pre></div></div>

<h2 id="acknowledgements">Acknowledgements</h2>

<p>Information courtesy of
IMDb
(<a href="http://www.imdb.com">imdb.com</a>).
Used with permission.</p>

</main>
