$(document).on('change', '#question_qType', function(){	
	if ($("#question_qType").val().length > 0)
		$("#ansContainer").show();
	else
		$("#ansContainer").hide();
})