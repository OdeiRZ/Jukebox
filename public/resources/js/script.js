$(document).ready(function(){
    $.get('recursos/php/consulta.php', function(generosJson) {
        $.each(JSON.parse(generosJson), function(i, item) {
            $('<a/>', {
                text: item.genero, id: 'btn' + i, href: '#btn' + i, appendTo: '#botones',
                click: function () {
                    new Audio("recursos/mp3/radio-tune.mp3").play();
                    $.get('recursos/php/consulta.php', { genero: item.genero }, function(albumesJson) {
                        $("#seleccion").html('');
                        var slc = $("<select />", {
                            change: function () {
                                new Audio("recursos/mp3/disco-tune.mp3").play();
                                $("#jukebox").css({"border-bottom":"none", "padding-bottom":"10px"});
                                $.get('recursos/php/consulta.php', { album: this.value }, function(pistasJson) {
                                    var indice = $('#seleccion select')[0].selectedIndex -1;
                                    var albumes = JSON.parse(albumesJson);
                                    $("#cristal img:first").attr("src", 'recursos/img/' + albumes[indice].portada + '.jpg');
                                    $("#cristal span:first").text(albumes[indice].nombre + ' (' + albumes[indice].anio + ') - ' + albumes[indice].artista).circleType({radius: 190});
                                    var ul = $("<ul />").append($('<li/>', { text: 'Traklist' }));
                                    $.each(JSON.parse(pistasJson), function(i, item) {
                                        $('<li/>', {
                                            text: item.numero + '. ' + item.nombre, appendTo: ul,
                                            click: function () {
                                                $("#led").attr('src','recursos/img/led-on.gif');
                                                $("audio").remove();
                                                $("<audio></audio>").attr({         //si no encuentra el mp3 o no lo reproduce se cambia la imagen
                                                        'src': "recursos/mp3/" + item.nombre + ".mp3", 'autoplay':'autoplay', 'controls': true
                                                    }).prependTo("#jukebox").on({ error: function(){ $("#led").attr('src','recursos/img/led-off.gif'); }
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
    });
});