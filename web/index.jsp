<%@page import="com.bolsos.modelo.Carrito"%>
<%@page import="com.bolsos.modelo.Producto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>       
        <link rel="icon" href="img/logorack.png">
        <title>Zenda Bags</title>
    </head>
</head>
<body>

    <div class="container">
        <nav class="navbar navbar-expand-lg d-flex align-items-center">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>         
            <div class="nav-item dropdown">
                <a class="logo d-flex align-items-center" href="#" data-toggle="dropdown"><img src="img/logo.png" width="120" height="50"></a>
                
            </div>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=home"><i class="fas fa-home" style="color: #AB7E55"></i> Inicio<span class="sr-only">(current)</span></a>
                    </li>   
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=carrito"><i class="fas fa-cart-plus" style="color: #AB7E55">(<label style="color:darkorange">${cont}</label>)</i> Carrito</a>
                    </li>   
                    
                    <li class="nav-item">
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                        <c:if test="${clientelogueado.idrol==1}">
                            <a class="nav-link "  href="./Controlador?accion=Productos"><i class="fa fa-box" style="color: #AB7E55"></i> Productos</a>                                                                         
                        </c:if>
                    </c:if>
                    </li>
                </ul>   
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <form action="Controlador" class="form-inline my-2 my-lg-0">
                        <input placeholder="Buscar" class="form-control search-form mr-sm" name="txtBuscar">
                        <button class="btn bnt-search my-2 my-sm-0 ml-2 text-white" type="submit" name="accion" value="BuscarProducto"><i class="fas fa-search"></i> Buscar</button>
                    </form>  

                </ul>
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">
                        <a style="cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fas fa-user-tie"></i> Iniciar Sesion</a> 
                        </c:if>                                              
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                        <a style="color: #AB7E55; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fas fa-user-tie"></i> ${clientelogueado.nombres}</a>  
                        </c:if>    
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">
                            <a class="dropdown-item" href="#"><img src="img/default.png" width="60" height="60"/></a>                        
                            <a class="dropdown-item" onclick="CargarModalLogueo()">Iniciar Sesion</a> 
                        </c:if>                                              
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                            <a class="dropdown-item" href="#"><img src="${clientelogueado.foto}" width="60" height="60"/></a>                       
                            <a class="dropdown-item" onclick="CargarModalLogueo()">${clientelogueado.email}</a>  
                        </c:if>                      
                        <div class="dropdown-divider"></div>
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                            <a class="dropdown-item" href="./Controlador?accion=MisCompras">Mis Compras</a> 
                        </c:if>  
                        <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">                            
                            <a class="dropdown-item" onclick="CargarModalLogueo()">Mis Compras</a> 
                        </c:if>   
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>
    </div>
    <header class="header ">
        <img src="img/bg.jpg" />
    </header>

    <section class="service-area container">
        <div class="service1 d-flex ">
            <img src="img/v1.png" >
            <div>
                <h3>Entrega gratuita</h3>
                <p>Pedidos superiores a $100</p>
            </div>
        </div>

        <div class="service1 d-flex ">
            <img src="img/v2.png" >
            <div>
                <h3>Mejor soporte</h3>
                <p>Horario: 8 a.m. - 11 p.m</p>
            </div>

        </div>

        <div class="service1 d-flex ">
            <img src="img/v3.png" >
            <div>
                <h3>Gana $100 por compra</h3>
                <p>Entra ahora</p>
            </div>
        </div>

        <div class="service1 d-flex ">
            <img src="img/v4.png" >
            <div>
                <h3>Garantía de devolución </h3>
                <p>En 30 días</p>
            </div>
        </div>


    </section>

    <div class="container mt-4">
        <div class="d-flex" >    
            <div  class="podruc2">
                <c:forEach var="p" items="${productos}">
                    <div class="widpro"><!--Solo va cambiar aqui puedes configurar de acuerdo al gusto-->
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <div><i class="fab fa-product-hunt"></i> ${p.getNombres()} </div>
                                    <!--<div class="col-lg-4"><i class="fas fa-box-open"></i> ${p.getStock()}</div>-->
                                </div>
                                <div class="card-body">
                                    <label class="btn price-btn text-white"><i class="">$ ${p.getPrecio()}</i></label>
                                    <c:if test="${p.getEstado()=='20'}">
                                        <img src="img/20.png" height="60" width="70"> 
                                    </c:if>                                                         
                                    <c:if test="${p.getEstado()=='30'}">
                                        <img src="img/30.png" height="60" width="70"> 
                                    </c:if>                                                         
                                    <c:if test="${p.getEstado()=='40'}">
                                        <img src="img/40.png" height="60" width="70"> 
                                    </c:if>                                                         
                                    <c:if test="${p.getEstado()=='50'}">
                                        <img src="img/50.png" height="60" width="70"> 
                                    </c:if>                                                         
                                    <c:if test="${p.getEstado()=='60'}">
                                        <img src="img/60.png" height="60" width="70"> 
                                    </c:if>                                                         
                                    <c:if test="${p.getEstado()=='70'}">
                                        <img src="img/70.png" height="60" width="70"> 
                                    </c:if>                                                         
                                </div>
                                <div class="text-center">                             
                                    <img src="${p.getImagen()}" style="height: 150px;width:90%; padding: 10px">
                                </div>
                                <br>
                                <div class="card-footer">
                                    <div class="col-sm-14">
                                        <label>${p.getDescripcion()}</label>
                                    </div>
                                    <div class=" col-sm-13 text-center">                                         
                                        <div class="modal fade" id="modalStock" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-sm" >
                                                <div class="modal-title">                                                   
                                                    <div class="modal-body">
                                                        <img src="img/agotadogeco.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${p.getStock()==0}"> 
                                            <button data-toggle="modal" data-target="#modalStock" class="btn btn2 ">Agregar</button>
                                            <button data-toggle="modal" data-target="#modalStock" class="btn btn-4">Comprar</button>
                                        </c:if>
                                        <c:if test="${p.getStock()!=0}"> 
                                            <c:if test="${clientelogueado.id==null||clientelogueado.id==0}"> 
                                                <button id="tte" data-toggle="modal" onclick="CargarModalLogueo1()" data-target="#myModalLogueo1" class="btn btn2">Agregar<i class="fas fa-cart-plus"></i></button>
                                                <button data-toggle="modal" onclick="CargarModalLogueo1()" data-target="#myModalLogueo1" class="btn btn-4">Comprar</button>
                                            </c:if>
                                            <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                                                <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2">Agregar<i class="fas fa-cart-plus"></i></a>
                                                <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-4">Comprar</a>
                                            </c:if>
                                        </c:if> 
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>                    
                </c:forEach>  
            </div>


        </div>
    </div>                   

    <!-- Modal1 Iniciar Session o Registrarse -->
    <div class="modal fade" id="myModalLogueo1" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="container col-lg-9">                   
                <div class="modal-content" id="contenido1">                   
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Iniciar Session o Registrarse -->
    <div class="modal fade" id="myModalLogueo" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="container col-lg-9">                   
                <div class="modal-content" id="contenido">                   
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/funcionregistro.js" type="text/javascript">

    </script>
    <script src="js/funciones.js" type="text/javascript"></script>
    <script  type="text/javascript">
        function CargarModalLogueo() {
            $("#myModalLogueo").modal('show');
            $("#contenido").load("Controlador?accion=IniciarSession");
        }


    </script>
    <script  type="text/javascript">

        function CargarModalLogueo1() {
            $("#myModalLogueo1").modal('show');
            $("#contenido1").load("Controlador?accion=IniciarSession");
        }
    </script>
  


</body>
</html>
