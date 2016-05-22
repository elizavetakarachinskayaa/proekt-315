<?php
require_once 'config/db.php';  // Работает
// Функция выбора данных
function result(){
	// Выполняем SQL-запрос
	$query = 'SELECT ID FROM kategorii_gorodov';
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table>\n";
	while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t<tr>\n";
	    foreach ($line as $col_value) {
	        echo "\t\t<td>$col_value</td>\n";
	    }
	    echo "\t</tr>\n";
	}
	echo "</table>\n";
	// Освобождаем память от результата
	mysql_free_result($result);

	
}
function get_request(){
	$url = $_GET["url"];
	return $url;
}
function get_id_category(){
	$category_url = $_GET["category"];
	// Выполняем SQL-запрос
	$query = "SELECT ID, gorod FROM kategorii_gorodov WHERE  url = '$category_url'";
	//$query->execute(array('url' => $category_url));
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table>\n";
		echo "\t<tr>\n";
	while ($rows = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t\t<td>".$rows["ID"]." ".$rows['gorod']."</td>\n";
	    
	}
	echo "\t</tr>\n";
	echo "</table>\n";
	// Освобождаем память от результата
	mysql_free_result($result);

}
function view_link_category(){
	/*
	* В эту функцию, мы не передаем значение
	* эта функция, только выводит список категорий в
	* виде ссылок <a href="$url_category">$name_category</a>
	* 1. Написать запрос на выборку name, url
	* 2. Вывести значения в шаблон на главную index.php
	*/
	$query = "SELECT gorod, url FROM kategorii_gorodov;";
	//$query->execute(array('url' => $category_url));
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table class=\"link\">\n";
		echo "\t<tr>\n";
	while ($rows = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t\t<td><a href=?category=".$rows["url"].">".$rows['gorod']."</a></td>\n";
	    
	}
	echo "\t</tr>\n";
	echo "</table>\n";
	// Освобождаем память от результата
	mysql_free_result($result);

}
function view_product(){
	/*
	* Функция вывода списка товаров по параметру
	* $category_url = $_GET["category"];
	*/
	$category_url = $_GET["category"];
	$query = "SELECT  `kategorii_gorodov`.`gorod` ,  `gorod`.`adres` , `telefon` , `proezd` , `opisanie`  FROM  `kategorii_gorodov` 
		 LEFT JOIN  `gorod` ON  `kategorii_gorodov`.`ID` =  `gorod`.`ID goroda` 
		WHERE  `kategorii_gorodov`.`url` =  '$category_url'
		ORDER BY  `kategorii_gorodov`.`gorod`; ";
		$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table>\n";
	while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t<tr>\n";
	    foreach ($line as $col_value) {
	        echo "\t\t<td>$col_value</td>\n";
	    }
	    echo "\t</tr>\n";
	}
	echo "</table>\n";
	// Освобождаем память от результата
	mysql_free_result($result);
}

?>