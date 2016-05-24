<?php
/* *************************************************************************************************
Карачинская Елизавета Анатольевна <elizavetakarachinskayaa@gmail.com>
24/05/2016 02:40:00
func - главная функция,хранит все функции.
расположен в каталоге 315\core\func
****************************************************************************************************/

?>
<?php
require_once 'core/config/db.php';  // Работает
// Функция выбора данных
function result(){
	// Выполняем SQL-запрос
	$query = 'SELECT ID FROM сategory_products';
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
function result1(){
	// Выполняем SQL-запрос
	$query = 'SELECT ID FROM category_citys';
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
	$query = "SELECT ID, name FROM сategory_products WHERE  url = '$category_url'";
	//$query->execute(array('url' => $category_url));
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table>\n";
		echo "\t<tr>\n";
	while ($rows = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t\t<td>".$rows["ID"]." ".$rows['name']."</td>\n";
	    
	}
	echo "\t</tr>\n";
	echo "</table>\n";
	// Освобождаем память от результата
	mysql_free_result($result);

}
function get_id_category1(){
	$category_url = $_GET["category"];
	// Выполняем SQL-запрос
	$query = "SELECT ID, name FROM category_citys WHERE  url = '$category_url'";
	//$query->execute(array('url' => $category_url));
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table>\n";
		echo "\t<tr>\n";
	while ($rows = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t\t<td>".$rows["ID"]." ".$rows['name']."</td>\n";
	    
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
	$query = "SELECT name, url FROM сategory_products;";
	//$query->execute(array('url' => $category_url));
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table class=\"link\">\n";
		echo "\t<tr>\n";
	while ($rows = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t\t<td><a href=?category=".$rows["url"].">".$rows['name']."</a></td>\n";
	    
	}
	echo "\t</tr>\n";
	echo "</table>\n";
	// Освобождаем память от результата
	mysql_free_result($result);

}
function view_link_category1(){
	/*
	* В эту функцию, мы не передаем значение
	* эта функция, только выводит список категорий в
	* виде ссылок <a href="$url_category">$name_category</a>
	* 1. Написать запрос на выборку name, url
	* 2. Вывести значения в шаблон на главную index.php
	*/
	$query = "SELECT name, url FROM category_citys;";
	//$query->execute(array('url' => $category_url));
	$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());

	// Выводим результаты в html
		echo "<table class=\"link\">\n";
		echo "\t<tr>\n";
	while ($rows = mysql_fetch_array($result, MYSQL_ASSOC)) {
	    echo "\t\t<td><a href=?category=".$rows["url"].">".$rows['name']."</a></td>\n";
	    
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
	$query = "SELECT  `сategory_products`.`name` ,  `products`.`ID_category` , `price` , `count` , `characteristic` FROM  `сategory_products` 
		 LEFT JOIN  `products` ON  `сategory_products`.`ID` =  `products`.`ID_category` 
		WHERE  `сategory_products`.`url` =  '$category_url'
		ORDER BY  `сategory_products`.`name`; ";
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
function view_product1(){
	/*
	* Функция вывода списка товаров по параметру
	* $category_url = $_GET["category"];
	*/
	$category_url = $_GET["category"];
	$query = "SELECT  `category_citys`.`name` ,  `city`.`address` , `telefon` , `driveway` , `characteristic`  FROM  `category_citys` 
		 LEFT JOIN  `city` ON  `category_citys`.`ID` =  `city`.`ID_city` 
		WHERE  `category_citys`.`url` =  '$category_url'
		ORDER BY  `category_citys`.`name`; ";
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