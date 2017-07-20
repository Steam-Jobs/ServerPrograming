<adduserData>
    <div class="surface fadeUpLong">
        <div class="centerform">
            <h1>Shinchoku Torerou</h1>
            <form>
                <label>Gravatarを利用している場合は、メールアドレスをもとにプロフィール画像を設定できます。</label>
                <div><input type="text" ref="mail" maxlength="64" placeholder="Mail"></div>
                <div><input type="text" ref="name" maxlength="20" placeholder="Username"></div>
                <div if={ loading }><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></div>
                <div if={ text }><span>{text}</span></div>
                <button type="button" class="wbtn" onclick={ adduser }>確定</button>
            </form>
        </div>
    </div>
    <script>
        var auth = riot.observable()
        var that = this
        var chkstatus = null
        auth.adduser = function(params) {
            $.post('http://150.95.149.0/api/sp/Regist', params, function(res) {
                if(res === "true"){
                    document.cookie = 'userid='+params.userID
                    route("/")
                }else{
                    that.text="🙅🙅🙅何らかのエラー🙅🙅🙅"
                }
                that.update()
            })
        }
        edit(e){
            that.chkstatus = "loading"
            that.update()
            auth.checkuser(e.target.value)
        }
        passedit(e){
            if(that.refs.pass1.value != that.refs.pass2.value){
                that.chkstatus2 = "ng"
                that.text2 = "パスワードが一致しません＞＜"
            }else{
                that.chkstatus2 = "ok"
                that.text2 = null
            }
        }
        adduser(){
            that.loading=true
            var params = {userID:opts.params.userID,pass:opts.params.pass}
            !!this.refs.name.value ? params["userName"]=this.refs.name.value : params["userName"] = "hogehoge"
            !!this.refs.mail.value ? params["mail"]=this.refs.mail.value : params["mail"] = ""
            auth.adduser(params)
        }
    </script>
    <style type="less">
        @import "../../styles/font-awesome/font-awesome.less";
        @import url('https://fonts.googleapis.com/css?family=Open+Sans:300');
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
        .chkicon{
            top:100px;
            right: 40px;
            position: absolute;
        }
        .chkicon2{
            top:190px;
            right: 40px;
            position: absolute;
        }
        .ok{
            color: #00bd00;
        }
        .ng{
            color: #ff0003;
        }
        }
    </style>
</adduserData>