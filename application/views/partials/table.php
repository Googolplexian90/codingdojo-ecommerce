<table class="table table-striped">
	<thead>
		<tr>
		<?php foreach($thead as $data)
		{
			echo "<th>{$data}</th>";
		} ?>
		</tr>
	</thead>
	<tbody>
		<?php foreach($tbody as $row)
		{
			echo "<tr>";
			foreach($row as $data)
			{
				echo "<td>{$data}</td>";
			}
			echo "</tr>";
		} ?>
	</tbody>
</table>