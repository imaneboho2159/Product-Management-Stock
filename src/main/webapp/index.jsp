<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Stock Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        h1 {
            color: #343a40;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .table {
            margin-top: 20px;
        }
        .table thead {
            background-color: #007bff;
            color: #fff;
        }
        .btn-sm {
            margin: 2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ajouter Des Produits</h1>
        <form action="insert" method="post">
            <div class="form-group">
                <label for="nome">Nom du produit</label>
                <input type="text" class="form-control" id="nome" name="name" placeholder="Entrez le nom du produit" required>
            </div>
            <div class="form-group">
                <label for="desc">Description</label>
                <input type="text" class="form-control" name="description" id="desc" placeholder="Entrez la description" required>
            </div>
            <div class="form-group">
                <label for="stock">Quantité en stock</label>
                <input type="number" class="form-control" id="stock" name="quantity" placeholder="Entrez la quantité" required>
            </div>
            <div class="form-group">
                <label for="prix">Prix unitaire</label>
                <input type="number" class="form-control" id="prix" name="price" placeholder="Entrez le prix unitaire" required>
            </div>
            <div class="form-group">
                <label for="inputCat">Catégorie du produit</label>
                <select id="inputCat" name="category" class="form-control" required>
                    <option value="" disabled selected>Choisissez...</option>
                    <option>Electronique</option>
                    <option>Vetements</option>
                    <option>Alimentation</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>

        <h1 class="mt-5">Liste Des Produits</h1>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nom du produit</th>
                    <th scope="col">Description</th>
                    <th scope="col">Quantité</th>
                    <th scope="col">Prix</th>
                    <th scope="col">Catégorie</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="produit" items="${list}">
                    <tr>
                        <td><c:out value="${produit.id}" /></td>
                        <td><c:out value="${produit.name}" /></td>
                        <td><c:out value="${produit.description}" /></td>
                        <td><c:out value="${produit.quantity}" /></td>
                        <td><c:out value="${produit.price}" /></td>
                        <td><c:out value="${produit.category}" /></td>
                        <td>
                            <button class="btn btn-danger btn-sm">Supprimer</button>
                            <button class="btn btn-info btn-sm">Modifier</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>