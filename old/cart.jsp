<%@ page import="eu.ensup.myresto.Product" %>
<%@ page import="java.util.Set" %>
<%@ page import="eu.ensup.myresto.ProductDto" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: cherif
  Date: 29/06/2021
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="header.jsp" %>

<div class="wrapper">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center mb-4">
                        <h2 class="titre-entente">Détail de votre panier</h2>

                    </div>
                </div>
            </div>
            <%
                Map<Integer, Integer> productIds = (Map<Integer, Integer>) session.getAttribute("order");
                if (productIds != null && !productIds.isEmpty()) {

            %>

            <div class="row d-flex justify-content-center align-items-center h-100 m5-custom bg-white">
                <div class="col">

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" class="h5"><strong>Panier</strong></th>
                                <th scope="col" class="text-center">Description</th>
                                <th scope="col" class="text-center">Produit</th>
                                <th scope="col" class="text-center">Quantité</th>
                                <th scope="col" class="text-center">Prix</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                for (ProductDto p : (Set<ProductDto>) session.getAttribute("productSet")) {
                            %>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="assets/images/<%= p.getPicture()%>" class="img-fluid rounded-3"
                                             style="width: 120px; height: 120px" alt="<%= p.getName()%>">
                                    </div>
                                </th>
                                <td class="align-middle text-center">
                                    <p class="mb-0" style="font-weight: 500;"><%= p.getDescription()%>
                                    </p>
                                </td>
                                <td class="align-middle text-center">
                                    <p class="mb-0" style="font-weight: 500;"><%= p.getName()%>
                                    </p>
                                </td>
                                <td class="align-middle">
                                    <div class="d-flex flex-row justify-content-center">
                                        <a class="btn btn-orange btn-link px-2"
                                           href="removeproductcart?id=<%=p.getId()%>">
                                            <i class="fa fa-minus"></i>
                                        </a>

                                        <span class="btn text-orange px-2"><%= productIds.get(p.getId()) %></span>

                                        <a href="addproductcart?id=<%=p.getId()%>" class="btn btn-orange btn-link px-2">
                                            <i class="fa fa-plus"></i>
                                        </a>
                                    </div>
                                </td>
                                <td class="align-middle text-center">
                                    <p class="mb-0" style="font-weight: 500;"><%=p.getPrice() %> €</p>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                        <div class="card-body p-4">

                            <div class="row">
                                <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">

                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-6">
                                    <div class="row">
                                        <div class="col-12 col-xl-6">

                                        </div>
                                        <div class="col-12 col-xl-6">
                                            <div class="form-outline mb-4 mb-xl-5">

                                            </div>

                                            <div class="form-outline mb-4 mb-xl-5">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">

                                    <div class="d-flex justify-content-between text-lg" style="font-weight: 500;">
                                        <p class="mb-2"><strong>Total</strong></p>
                                        <p class="mb-2">${totalPrice} €</p>
                                    </div>

                                    <hr class="my-4">


                                    <div class="d-flex justify-content-center mb-3 text-lg">
                                        <a class="text-danger" href="removeordercart"><i class="fa fa-trash mr-2"></i>Supprimer
                                            le panier</a>
                                    </div>


                                    <a href="ordercart" class="btn btn-common btn-block btn-lg">
                                        <div class="d-flex justify-content-between">
                                            <span>Commander ${totalPrice} €</span>
                                        </div>
                                    </a>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12">
                        <% if (request.getAttribute("error") != null) {%>
                        <div class="text-message text-danger">
                            <p >${error}</p>
                        </div>
                        <% request.removeAttribute("error");%>

                        <% } %>
                        <% if (request.getAttribute("info") != null) {%>
                        <div class="text-message text-success">
                            <p >${info}</p>
                        </div>
                        <% request.removeAttribute("info");%>

                        <% } %>
                    </div>
                    <% } else { %>
                    <div class="alert alert-light text-center m5-custom">
                        <h3 class="alert-heading"> Aucun éléments dans le panier </h3>
                        <a href="menu" class="alert-link">Ajouter un produit</a>
                    </div>

                    <div class="col-md-12">
                        <% if (request.getAttribute("error") != null) {%>
                        <div class="titre-entente text-danger">
                            <p id="form_error_text">${error}</p>
                        </div>
                        <% request.removeAttribute("error");%>

                        <% } %>
                        <% if (request.getAttribute("info") != null) {%>
                        <div class="titre-entente text-success">
                            <p id="form_info_text">${info}</p>
                        </div>
                        <% request.removeAttribute("info");%>

                        <% } %>
                    </div>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
    <div class="push"></div>

</div>


<!-- End Panier -->
<%@include file="footer.jsp" %>
