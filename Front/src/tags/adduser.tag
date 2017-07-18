<adduser>
    <div class="surface">
        <div class="centerform">
            <h1>Shinchoku Torelou</h1>
            <form>
                <input type="text" ref="id" maxlength="20" placeholder="id">
                <input type="password" ref="pass" maxlength="20" placeholder="password">
                <input type="password" ref="pass" maxlength="20" placeholder="password (確認)"><br>
                <button class="wbtn">新規登録</button>
            </form>
        </div>
    </div>
    <style type="less">
        @import url('https://fonts.googleapis.com/css?family=Open+Sans:300');
        .surface{
            width: 100%;
            height: 100%;
            position: relative;
        }
        .centerform{
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin: auto;
            text-align: center;
            width: 400px;
            height: 350px;
            font-size: 20px;
            input{
                margin-bottom:10px;
            }

    h1{
                font-family: 'Open Sans', sans-serif;
            }
        }
    </style>
</adduser>