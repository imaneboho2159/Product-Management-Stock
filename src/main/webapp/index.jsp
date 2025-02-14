<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste Des Produits</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">StockMaster</a>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="mb-4 text-center">Liste Des Produits</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nom du Produit</th>
                        <th>Description</th>
                        <th>Quantité</th>
                        <th>Prix Unitaire</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td>${product.quantity}</td>
                            <td>${product.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <h2 class="mt-5 mb-3 text-center">Ajouter un Produit</h2>
        <form action="products" method="post" class="border p-4 rounded shadow-sm bg-light">
            <div class="mb-3">
                <label for="name" class="form-label">Nom du Produit</label>
                <input type="text" name="name" class="form-control" placeholder="Nom du Produit" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <input type="text" name="description" class="form-control" placeholder="Description">
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantité</label>
                <input type="number" name="quantity" class="form-control" placeholder="Quantité" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Prix Unitaire</label>
                <input type="number" name="price" class="form-control" placeholder="Prix Unitaire" required step="0.01">
            </div>
            <button type="submit" class="btn btn-primary w-100">Ajouter</button>
        </form>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2025 StockMaster - Tous droits réservés.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
