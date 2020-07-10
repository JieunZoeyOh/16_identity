$(document).ready(function() {
	var check = 0;
	$("#updateform").submit(function() {

		if (check == 0) {
			value = $('#filevalue').text();
			html = "<input type='text' value='" + value + "' name='check'>";
			$(this).append(html);
		}
	});

	$("#image").change(function() {
		check++;
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	});
});