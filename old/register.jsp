<%--
  Created by IntelliJ IDEA.
  eu.ensup.myresto.User: A
  Date: 28/06/2021
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>

<!-- Start Reservation -->
<div class="wrapper">
    <div class="main-container m5-custom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center mb-4">
                        <h2 class="titre-entente">Inscription</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-sm-12 col-xs-12 ">
                    <div class="contact-block">
                        <form id="contactForm" method="post" action="register">
                            <div class="row justify-content-center">
                                <div class="col-md-6">
                                    <h3 class="text-center">Entrez vos Informations</h3>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="login" name="login"
                                                   placeholder="Login" required data-error="Login ">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Prenom" id="firstname" class="form-control"
                                                   name="firstname" required data-error="Entrez votre prénom">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Nom de famille" id="lastname"
                                                   class="form-control" name="lastname" required data-error="Entrez votre nom">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Adresse" id="address" class="form-control"
                                                   name="address" required data-error="Entrez votre adresse ">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">

                                            <input type="password" placeholder="Mot de Passe" id="password[1]"
                                                   class="form-control" name="password[1]" required
                                                   data-error="Entrez votre mot de Passe">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="password" placeholder="Confirmation du mot de Passe"
                                                   id="password[2]" class="form-control" name="password[2]" required
                                                   data-error="Entrez votre vérififcation de mot de Passe">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
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
                            <div class="col-md-12">
                                <div class="submit-button text-center">
                                    <button class="btn btn-common" id="submit" formmethod="post" type="submit">Valider
                                    </button>
                                    <div id="msgSubmit" class="h3 text-center hidden"></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="push"></div>
</div>
<!-- End Reservation -->

<%@include file="footer.jsp" %>

