<?php 
require_once 'db.php';  // Работает

// Выполняем SQL-запрос
$query = 'SELECT * FROM gorod';
$result = mysql_query($query) or die('Запрос не удался: ' . mysql_error());
// Выводим результаты в html
$rows = mysql_num_rows($result);
?>
<table>
	<t
</table>
<?php
// Освобождаем память от результата
mysql_free_result($result);

// Закрываем соединение
mysql_close($link);
?>