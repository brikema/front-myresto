<%@ page import="java.util.*" %>
<%@ page import="java.util.List" %>
<%@ page import="eu.ensup.myresto.ProductService" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="eu.ensup.myresto.*" %><%--
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 29/06/2021
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="/header.jsp" %>
<div class="wrapper">
    <div class="main-container m5-custom">

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center mb-4">
                        <h2 class="titre-entente">Commandes</h2>

                    </div>
                </div>
            </div>

            <% if (request.getAttribute("error") != null) {%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="text_message mb-4">
                        <p class="titre-entente text-danger">${error}</p>

                    </div>
                </div>
            </div>
            <% } %>

            <%
                UserDto user = ((UserDto) session.getAttribute("user"));
                if (user.getRole().equals("ADMIN")) {
            %>
            <%--- Pour moi filtre pas fonctionnel ---%>
            <div class="container">

                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="text-center mb-4">
                            <form method="get" action="summary" class="form-inline justify-content-start text-lg">
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="new" name="status" value="NEW">
                                    <label class="form-check-label" for="new">New</label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input ml-2" id="send" name="status" value="SEND">
                                    <label class="form-check-label" for="send">Send</label>
                                </div>
                                <div class="form-check ml-2">
                                    <input type="radio" class="form-check-input" id="close" name="status" value="CLOSE">
                                    <label class="form-check-label" for="close">Close</label>
                                </div>
                                <input class="btn btn-common ml-2"
                                        type="submit" id="buttonFiltre"
                                        name="button"
                                        value="filtre"/>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
                <%
                    }
                %>

                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <%
                            int i = 1;
                            String status = new String("");
                            try {
                                status = request.getParameter("status");
                            } catch (Exception e) {
                            }
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                            List<OrderProductDto> orderProductDto = (List<OrderProductDto>) session.getAttribute("listOrders");
                            for (OrderProductDto o : orderProductDto) {
                                float price = 0.0f;

                                if ((status != null && status.equals(o.getStatus())) || status == null) {
                        %>


                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="mt-0 font-weight-bold mb-2">Commande n°<%= i%>
                                </h5>
                                <%
                                    if (user.getRole().equals("ADMIN")) {
                                %>
                                <h6 class="mt-0 font-weight-bold mb-2">Nom du client
                                    : <%= new UserService().getById(o.getIdUser()).getFirstName() + " " + new UserService().getById(o.getIdUser()).getLastName() %>
                                </h6>

                                <%
                                    }
                                %>

                                <h6 class="mt-0 font-weight-bold mb-2">Status : <%= o.getStatus()%>
                                </h6>

                                <h6 class="mt-0 font-weight-bold mb-2">Date de la commande
                                    : <%= o.getDateCreated().toLocalDate().format(formatter)%>
                                </h6>
                                <%
                                    List<ProductDto> productDtos = new ArrayList<ProductDto>();
                                    Map<Integer, Integer> productList = new HashMap<Integer, Integer>();
                                    for (Integer p : (List<Integer>) o.getIdProduct()) {
                                        ProductDto productDto = new ProductService().getOneProduct(p);
                                        int currId = productDto.getId();
                                        if (productList.get(currId) == null) {
                                            productList.put(currId, 1);
                                        } else {
                                            productList.put(productDto.getId(), productList.get(currId) + 1);
                                        }
                                        productDtos.add(productDto);
                                    }
                                    float total = 0;
                                    for (Map.Entry<Integer, Integer> entry : productList.entrySet()) {

                                        ProductDto productDto = new ProductDto();

                                        for (ProductDto productDto1 : productDtos) {
                                            if (productDto1.getId() == entry.getKey()) {
                                                productDto = productDto1;
                                            }
                                        }

                                        price += productDto.getPrice() * entry.getValue();
                                        total = total + price;
                                %>
                                <h5><%= entry.getValue() %>x - <%= productDto.getName()  %> | <%= productDto.getPrice() %> €
                                </h5>

                                <p class="font-italic text-muted  small"><%= productDto.getDescription() %>
                                </p>

                                <%
                                    }
                                %>
                                <h6 class="font-weight-bold my-2">Prix de la commande: <%= price%>€ </h6>
                                <%
                                    if (user.getRole().equals("ADMIN")) {
                                %>
                                <form action="updateOrder">
                                    <div class="form-group">
                                        <label for="status">Etat de la commande : </label>
                                        <select name="drop" id="status">
                                            <option value="" selected disabled> ----</option>
                                            <% for (OrderProductDto.Status e : OrderProductDto.Status.values()) { %>
                                            <option value="<%= e %>,<%= o.getId()%>"><%= e %>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="form-group text-center">
                                        <button href="updateOrder" class="btn btn-common "
                                                formmethod="POST" type="submit" id="button"
                                                name="button"
                                                value="">Modifier la commande
                                        </button>
                                    </div>
                                </form>

                                <% }%>
                            </div>

                        </div>

                        <%
                                    i++;
                                }
                            }
                        %>
                        <% if(orderProductDto.size() == 0){  %>
                        <div class="alert alert-light text-center m5-custom">
                            <h3 class="alert-heading"> Pas de commande enregistrée </h3>
                        </div>
                        <% } %>
                    </div>

                    <div class="col-lg-3"></div>
                </div>
                <div class="row col-md-12">
                    <% if (request.getAttribute("error") != null) {%>
                    <div class="text-message text-danger">
                        <p id="form_error_text">${error}</p>
                    </div>
                    <% request.removeAttribute("error");%>

                    <% } %>
                    <% if (request.getAttribute("info") != null) {%>
                    <div class="text-message text-success">
                        <p id="form_info_text">${info}</p>
                    </div>
                    <% request.removeAttribute("info");%>

                    <% } %>
                </div>
            </div>
        </div>

        <div class="push"></div>
    </div>


    <%@include file="/footer.jsp" %>

