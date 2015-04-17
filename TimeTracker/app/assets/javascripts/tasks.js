$(document).ready(function() {

	$("#start_btn").on("click", function (e) {
		e.preventDefault();

		var request = $.ajax({ url: $(this).attr("href"), type: "get"});
			request.done(function(response){
			$(".cr_teshow").append(response);
			$("textarea").val("")
		});
	});

	$(".cr_teshow").on("submit", "form", function (e) {
		e.preventDefault();

		var link = $(this).attr("action");
		var data = $(this).serialize();

		$(".cr_teshow").bPopup().close()

		var request = $.ajax({url: link, data: data, type: "post", dataType: "JSON"});
			
			request.done(function(data) {
		var new_note = "<div class='note'>" +data.note+"</div>";
		var new_btn = "<td><a id='edit_btn'href='/tasks/"+data.task_id+"/timeentries/"+data.id+"/edit'>Edit</a></td>"

		$(".note1").first().empty();
		$(".note1").first().append(new_note);
		$("tr").eq(1).append(new_btn);

			})
	});
	
});


$(".cr_teshow").ready(function(){
	$("#start_btn").on("click", function (e) {
		e.preventDefault();
	$(".cr_teshow").bPopup({
										appentTo: 'body'
										, zIndex: 2
										, opacity: 0.6
										, modalClose: true
										, transition: 'slideIn'
		});
	});
});

// make same bpopup for edit a timeentry