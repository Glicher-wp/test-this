<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Гороскоп на сегодня"</title>
         <link
                rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
                integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
                crossorigin="anonymous"
        />

        <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
    </head>
    <body>
                <div class="container">
                <h1 id="main-header">Что день {{date}} готовит</h1>

                % if special_date:
                <h2>Сегодня особенный день</h2>
                % end

                <div class="row">
                    <div class="col-4" id="p-0">
                    </div>
                    <div class="col-4" id="p-1">
                    </div>
                    <div class="col-4" id="p-2">
                    </div>
                    <div class="col-4" id="p-3">
                    </div>
                    <div class="col-4" id="p-4">
                    </div>
                    <div class="col-4" id="p-5">
                    </div>

            <p>О <a href='about.html'>реализации</a></p>
                </div>
    </body>
    <script language="javascript">
        console.log({{ x }});
    </script>
    <script language="javascript">
        horoscope_url = "http://localhost:8080/api/forcast"

$("#main-header").click(function(){
    $.getJSON(horoscope_url, function(data){
        paragraphs = data["prophesies"]
        set_content_in_divs(paragraphs);
    })
});

function set_content_in_divs(paragraphs) {
    $.each(paragraphs,function(i,d){
        p = $("#p-"+ i)
        p.html("<p>" + d + "</p>")
    })
}
    </script>
</html>