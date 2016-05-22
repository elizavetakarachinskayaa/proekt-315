<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>магазинчик</title>
	<link rel="stylesheet" type="text/css" href="static/css/style.css">
	 <style>
   a { 
    text-decoration: none; /* Отменяем подчеркивание у ссылки */
   } 
  </style>
</head>
<body>
<?php 
require_once 'func1.php';
?>
 	<img src="image/1.png" align="left" />
	<h4 align="right"> Горячая линия (495)926-80-82 </h4>
 	<h1><a href="index.php" style="color:Crimson">Магазин &laquo;Женские штучки&raquo;</a></h1>
 	<h2> <a href="kategorii_tovarov.php" style="color:IndianRed" > Категории товаров </a></h2>
	<h3> <a href="kategorii_gorodov.php">Информация о компании </a></h3> 
	
 	
	
	<p class="name_catalog">
 		Наши адреса
 	</p>
 	<?php echo view_link_category(); ?>
 	
 	

 	<?php 
  // Подключение файла функций
//echo result();
//echo 'Get url: '.get_request();

echo get_id_category();
echo view_product();
?>
<p> <a href="index.php"> На главную </a></p>
</body>
</html>