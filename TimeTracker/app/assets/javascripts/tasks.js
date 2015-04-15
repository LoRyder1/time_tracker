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
		var new_note = "<div class='note1'>" +data.note+"</div>";
		// $(".note1").first().remove();
		// $(".note1").first().append(new_note);
		$(new_note).prependTo(".note")

		console.log(new_note);

			})
	});
	
});

