<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="public/css/style.css">
    <title>Login Page</title>
</head>
<body>
    <div class="container">
        <div class="logo" >
            <img src="public/img/logo.svg">
        </div>
        <div class="login-container">
            <form class="login" action="login" method="POST">

                <div class="form-header">Sign in</div>
                <div class="lr-swap">If you don't have an account yet <a href="register" class="lr-swap">create an account</a></div>
                <input name="email" type="text" placeholder="email@email.com">
                <input name="password" type="password" placeholder="password">
                <div class="messages">
                    <?php if(isset($messages)){
                        foreach ($messages as $message){
                            echo $message;
                        }
                    }
                    ?>
                </div>
                <button type="submit">Sign in</button>
            </form>
        </div>
        
    </div>
</body>