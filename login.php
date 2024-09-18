<?php
session_start();

include 'db_connect.php';

// Verificar se o usuário já está logado
if (isset($_SESSION['usuario_id'])) {
    header('Location: index.php'); // Redirecionar para a página inicial se já estiver logado
    exit();
}

// Processar o login se o formulário for enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // Consultar o banco de dados para verificar as credenciais do usuário
    $sql = "SELECT * FROM usuarios WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $usuario = $result->fetch_assoc();

        // Verificar se a senha está correta
        if (password_verify($senha, $usuario['senha'])) {
            // Definir o ID do usuário na sessão para marcá-lo como logado
            $_SESSION['usuario_id'] = $usuario['id'];
            $_SESSION['user_name'] = $usuario['nome'];

            // Redirecionar para a página original se o parâmetro 'redirect' estiver presente
            if (isset($_GET['redirect'])) {
                header('Location: ' . $_GET['redirect']);
            } else {
                header('Location: index.php'); // Redirecionar para a página inicial se não houver redirecionamento específico
            }
            exit();
        } else {
            $erro = "Senha incorreta. Tente novamente.";
        }
    } else {
        $erro = "Usuário não encontrado. Verifique o email e tente novamente.";
    }

    $stmt->close();
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>


    <?php include 'header.php'; ?>
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
                color: white !important;
            }

            button{
                width: 100%;
                margin-top: 20px
            }
        }
    </style>
    <div class="container mt-4">
        <h2 class="mb-3">Login</h2>
        <?php if (isset($erro)): ?>
            <div class="alert alert-danger"><?php echo $erro; ?></div>
        <?php endif; ?>


        <form
            action="login.php<?php echo isset($_GET['redirect']) ? '?redirect=' . urlencode($_GET['redirect']) : ''; ?>"
            method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">Email:</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Email"
                    required>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Senha:</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="senha"
                    placeholder="senha" required">
            </div>

            <button type="submit" class="btn btn-primary">Entrar</button>
        </form>




</body>

</html>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>