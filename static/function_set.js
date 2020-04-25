horoscope_url = "http://localhost:8080/api/forcast"

$("#main-header").click(function(){
	$.getJSON(horoscope_url, function(data){
		paragraphs = data[prophesies]
		set_content_in_divs(paragraphs);
	})
});

function set_content_in_divs(paragraphs) {
	$.each(paragraphs,function(i,d){
		p = $("#p-"+ i)
		p.html("<p>" + d + "</p>")
	})
}