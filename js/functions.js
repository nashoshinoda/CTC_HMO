$(document).ready(function(){
    // Este evento es para los elementos de clase ESTADO:
    $('.estado').on('click', function (e) {
    	e.preventDefault();
        
        var estado   = $(this).attr('id');
        var base_url = $('#base_url').val();
        var image    = "<img src='" + base_url + "images/" + estado + ".gif' />";
        
        $('#area_res').show('slow').html(image);
        
        $.ajax({
           url:     'home/showdata',
           type:    'POST',
           data:    {
               colonia:$(this).attr('colonia')
                    },
           success: function(message){
               $('#data').show();
               $('#TableData').html(message);
           }
        });
    });
    //Evento para traer toda la información de la consulta
    
});