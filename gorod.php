<?php 
require_once 'db.php';  // ��������

// ��������� SQL-������
$query = 'SELECT * FROM gorod';
$result = mysql_query($query) or die('������ �� ������: ' . mysql_error());
// ������� ���������� � html
$rows = mysql_num_rows($result);
?>
<table>
	<t
</table>
<?php
// ����������� ������ �� ����������
mysql_free_result($result);

// ��������� ����������
mysql_close($link);
?>