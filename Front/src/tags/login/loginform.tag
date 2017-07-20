
<loginform>
    <div class="surface fadeUpLong">
        <div class="centerform">
            <h1>Shinchoku Torerou</h1>
            <form onsubmit="{ login }">
                <input ref="userid" type="text" placeholder="userid">
                <input ref="password" type="password" placeholder="password">
                <div if={ loading }><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></div>
                <div if={ text }><span>{text}</span></div>
                <br>
                <button type="button" onclick={ login }>ログイン</button>
                <br>
                <a href="/login#adduser">または新規登録</a>
            </form>
        </div>
    </div>
    <script>
        // Login API
        var auth = riot.observable()
        var text
        var that = this

        var loading = false
        auth.login = function(params) {
            $.post('http://150.95.149.0/api/sp/Login', params, function(res) {
                that.loading = false
                if((res === "true")){
                    document.cookie = 'userid='+that.refs.userid.value
                    location.href = "/"
                }else{
                    that.text = "IDまたはパスワードが違います"
                    that.update()
                }
            })
        }

        login(){
            that.loading = true
            that.update()
            that.text = null
            auth.login("userID="+this.refs.userid.value+"&pass="+this.refs.password.value)
        }



    </script>
    <style type="less">
        @import "../../styles/font-awesome/font-awesome.less";
        .surface{
            width: 100%;
            height: 100%;
            position: relative;
        }
        .centerform{
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            width: 400px;
            height: 400px;
            text-align: center;
            input{
                font-size: 20px;
                margin-bottom:10px;
            }
            button{
                margin-bottom:10px;
            }
            h1{
                font-size:36px;
                font-family: 'Open Sans', sans-serif;
            }
            span{
                width:100%;
                margin-bottom:10px;
                color: #ff0003;
            }
            div{
                color: #026aa7;
            }
        }
    </style>
</loginform>