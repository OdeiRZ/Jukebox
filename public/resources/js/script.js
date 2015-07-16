$(document).ready(function(){
    $.get('resources/php/consulta.php', function(generosJson) {
        if( generosJson === '*error*') {
            $('#jukebox #seleccion').css('min-height','225px').append('<img src="resources/img/fuera_de_servicio.png" />');
        } else {
            $.each(JSON.parse(generosJson), function(i, item) {
                $('<a/>', {
                    text: item.genero, id: 'btn' + i, href: '#btn' + i, appendTo: '#botones',
                    click: function () {
                        new Audio("resources/mp3/radio-tune.mp3").play();
                        $.get('resources/php/consulta.php', { genero: item.genero }, function(albumesJson) {
                            $("#seleccion").html('');
                            var slc = $("<select />", {
                                change: function () {
                                    new Audio("resources/mp3/disco-tune.mp3").play();
                                    $("#jukebox").css({"border-bottom":"none", "padding-bottom":"10px"});
                                    $.get('resources/php/consulta.php', { album: this.value }, function(pistasJson) {
                                        var indice = $('#seleccion select')[0].selectedIndex -1;
                                        var albumes = JSON.parse(albumesJson);
                                        $("#cristal img:first").attr("src", 'resources/img/' + albumes[indice].portada + '.jpg').removeClass("rotar");
                                        $("#cristal span:first").text(albumes[indice].nombre + ' (' + albumes[indice].anio + ') - ' + albumes[indice].artista).circleType({radius: 190});
                                        var ul = $("<ul />").append($('<li/>', { text: 'Traklist' }));
                                        $.each(JSON.parse(pistasJson), function(i, item) {
                                            $('<li/>', {
                                                text: item.numero + '. ' + item.nombre, appendTo: ul,
                                                click: function () {
                                                    $("audio").remove();
                                                    $.ajax({url: "resources/mp3/" + item.nombre + ".mp3",
                                                        success: function(data, textStatus) {
                                                            $("<audio id='audio'></audio>").attr({ 'src': "resources/mp3/" + item.nombre + ".mp3", 'autoplay':'autoplay', 'controls': true }).prependTo("#jukebox");
                                                            $('#audio').bind('play',  function() { reproducirCancion(); });
                                                            $('#audio').bind('pause', function() { pararCancion(); });
                                                        }, error: function(jqXHR, textStatus, errorThrown) {
                                                            pararCancion();
                                                        }
                                                    });
                                                }
                                            });
                                        });
                                        $("#pistas").remove();
                                        $("body").append("<div id='pistas'></div>");
                                        $("#pistas").append(ul);
                                    });
                                }
                            });
                            $("<option />", {text: ' --> Selecciona un Álbum <-- ' }).attr('selected','selected').attr('disabled','disabled').appendTo(slc);
                            $.each(JSON.parse(albumesJson), function(i, item) {
                                $('<option/>', { text: item.nombre, value: item.id, appendTo: slc });
                            });
                            $("#seleccion").append(slc);
                        });
                    }
                });
            });
        }
    });
    function pararCancion() {
        $("#led").attr('src','resources/img/led-off.gif');
        $("#cristal img:first").removeClass("rotar");
    }
    function reproducirCancion() {
        $("#led").attr('src','resources/img/led-on.gif');
        $("#cristal img:first").addClass("rotar");
    }
});