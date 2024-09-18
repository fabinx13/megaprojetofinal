<?php
// Inclua o arquivo de conexão com o banco de dados
include 'db_connect.php';

// Consultar produto específico se o ID for passado via GET
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "SELECT * FROM produtos WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Produto não encontrado.";
        exit();
    }
} else {
    echo "ID do produto não especificado.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produto</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
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
        }

        .btn-success {
            width: 100%;
            margin-top: 20px;
            background-color: #007bff !important;
            border: none;
        }
    </style>
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <img src="uploads/<?php echo htmlspecialchars($row['imagem'] ?? 'imagem_padrao.jpg'); ?>"
                    class="img-fluid" alt="<?php echo htmlspecialchars($row['nome']); ?>">
            </div>
            <div class="col-md-6">
                <h2><?php echo htmlspecialchars($row['nome']); ?></h2>
                <p><?php echo htmlspecialchars($row['descricao']); ?></p>
                <h3>R$ <?php echo number_format($row['preco'], 2, ',', '.'); ?></h3>
                <a href="adicionar_carrinho.php?id=<?php echo htmlspecialchars($row['id']); ?>"
                    class="btn btn-success">Adicionar ao Carrinho</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>