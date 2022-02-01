<%--
  Created by IntelliJ IDEA.
  eu.ensup.myresto.User: A
  Date: 28/06/2021
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<div class="wrapper">

    <div class="main-container m5-custom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center mb-4">
                        <h2 class="titre-entente">S'authentifier</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-sm-12 col-xs-12 ">
                    <div class="contact-block">
                        <form id="contactForm" method="post" action="login">
                            <div class="row justify-content-center">
                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" placeholder="Login" id="login" class="form-control"
                                                   name="login" required data-error="Entrer votre login">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="password" placeholder="Mot de Passe" id="password"
                                                   class="form-control" name="password" required
                                                   data-error="Entrer votre mot de Passe">
                                            <div class="help-block with-errors"></div>
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
                                </div>
                                <div class="col-md-12">
                                    <div class="submit-button text-center">
                                        <button class="btn btn-common" id="submitd" formmethod="post" type="submit">Se
                                            Connecter
                                        </button>

                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>
                        </form>
                        <div class="col-md-12">
                            <div class="submit-button text-center">

                                <a href="register">
                                    <button class="btn " id="submit" type="submit">Créer un compte</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="push"></div>
</div>
<%@include file="footer.jsp" %>
