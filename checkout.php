<?php
session_start();
include 'admin/db_connect.php';

// Verificar se o carrinho está vazio
if (empty($_SESSION['cart'])) {
    header('Location: cart.php');
    exit();
}

// Verificar se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    header('Location: login.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizar Compra</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            background-color: rgb(67, 67, 67) !important;
            color: white;
            box-shadow: 0 4px 8px #007bff;
            padding: 1em;
            border-radius: 15px;
            width: 500px;

            input {
                background-color: rgb(41, 41, 41) !important;
                border: none;
                width: 220px;
                color: white !important;
            }
        }

        button {
            width: 100%;
            margin-top: 20px;
            border: none !important;
            background-color: #007bff !important;
        }
    </style>
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="container mt-4">
        <h2>Finalizar Compra</h2>
        <form action="finalizar_compra.php" method="post">
            <div class="d-flex w-100 justify-content-between mt-3">
                <div class="form-group">
                    <label for="nome">Nome Completo</label>
                    <input type="text" class="form-control" id="nome" name="nome" required>
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
            </div>

            <div class="d-flex w-100 justify-content-between">
                <div class="form-group">
                    <label for="cpf">CPF</label>
                    <input type="text" class="form-control" id="cpf" name="cpf" required>
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone</label>
                    <input type="text" class="form-control" id="telefone" name="telefone" required>
                </div>
            </div>

            <div class="d-flex w-100 justify-content-between">
                <div class="form-group">
                    <label for="endereco">Endereço</label>
                    <input type="text" class="form-control" id="endereco" name="endereco" required>
                </div>
                <div class="form-group">
                    <label for="numero">Número</label>
                    <input type="text" class="form-control" id="numero" name="numero" required>
                </div>
            </div>

            <div class="d-flex w-100 justify-content-between">
                <div class="form-group">
                    <label for="bairro">Bairro</label>
                    <input type="text" class="form-control" id="bairro" name="bairro" required>
                </div>
                <div class="form-group">
                    <label for="cidade">Cidade</label>
                    <input type="text" class="form-control" id="cidade" name="cidade" required>
                </div>
            </div>

            <div class="d-flex w-100 justify-content-between">
                <div class="form-group">
                    <label for="estado">Estado</label>
                    <input type="text" class="form-control" id="estado" name="estado" required>
                </div>
                <div class="form-group">
                    <label for="cep">CEP</label>
                    <input type="text" class="form-control" id="cep" name="cep" required>
                </div>
            </div>

            <button type="submit" class="btn btn-success">Finalizar Compra</button>
        </form>
    </div>
</body>

</html>