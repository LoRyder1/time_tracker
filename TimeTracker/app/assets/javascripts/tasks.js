$(document).ready(function() {

	$("#start_btn").on("click", function (e) {
		e.preventDefault();
		// console.log("hello")
		var request = $.ajax({ url: $(this).attr("href"), type: "get"});
			request.done(function(response){
			$(".cr_teshow").append(response);
		});
	});

	$(".cr_teshow").on("submit", "form", function (e) {
		e.preventDefault();
		// console.log("hello");

		var link = $(this).attr("action");
		var data = $(this).serialize();

		var request = $.ajax({url: link, data: data, type: "post", dataType: "JSON"});
			
			request.done(function(data) {
		var new_note = "<div class='note'>" +data.note+"</div>";
		var new_btn = "<td><a id='edit_btn'href='/tasks/"+data.task_id+"/timeentries/"+data.id+"/edit'>Edit</a></td>"
		
		$(".note1").first().empty();
		$(".note1").first().append(new_note);
		$("tr").eq(1).append(new_btn);
		// $(new_note).prependTo(".note")

		console.log(new_note);

			})
	});
	
});


