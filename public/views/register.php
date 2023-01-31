<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="public/css/style.css">
    <script type="text/javascript" src="./public/js/script.js" defer></script>
    <title>Register Page</title>
</head>
<body>
    <div class="container">
        <div class="logo" >
            <img src="public/img/logo.svg">
        </div>
        <div class="register-container">
            <form class="register" action="register" method="POST">
                <div class="messages">
                    <?php
                    if(isset($messages)){
                        foreach($messages as $message) {
                            echo $message;
                        }
                    }
                    ?>
                </div>
                <div class="form-header">Sign up</div>
                <div class="lr-swap">Already have an account? <a href="login" class="lr-swap">Sign in</a></div>
                <input name="email" type="text" placeholder="email@email.com">
                <input name="confirm-email" type="text" placeholder="Confirm email">
                <input name="password" type="password" placeholder="Password">
                <input name="confirm-password" type="password" placeholder="Confirm password">
                <button type="submit">Sign up</button>
            </form>
        </div>

    </div>
</body>