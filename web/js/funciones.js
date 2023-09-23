$(document).ready(function () {
    $("tr #deleteItem").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#item2').val();
        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una una Vez Eliminado, Debera Agregar de Nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idp);
                swal(" ¡Oh! ¡Registro Borrado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Controlador?accion=carrito";
                    }
                });
            }
        });
    });
    function eliminar(idp) {
        var url = "Controlador?accion=deleteProducto&id=" + idp;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }

});
$("div #agregarCarrito").click(function () {
        var id=$(this).parent().find("#arca").val();
         agregarcarrito(id);
    });
    
    function agregarcarrito(id) {
        var url = "Controlador?accion=AgregarCarrito";
        $.ajax({
            type: 'POST',
            url: url,
            data: "id="+id,
            success: function (data, textStatus, jqXHR) {
              
            }
        });
    } 
$("div #agregarlistcar").click(function () {
        var id=$(this).parent().find("#listcarr").val();
           console.log("hol");
         listarCategoria(id);
    });
    function listarCategoria(id) {
    var url = "Controlador?accion=ListarCategoria&idCat=" + id;
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    } 


$('#myModalLogueo').on('hidden.bs.modal', function () {
 location.reload();
})

$('#myModalLogueo1').on('hidden.bs.modal', function () {
 location.reload();
})