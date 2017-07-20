<adduser>
    <div class="surface fadeUpLong">
        <div class="centerform">
            <h1>Shinchoku Torerou</h1>
            <form>
                <input type="text" ref="userid" maxlength="20" placeholder="userid" onKeyUp={ edit }>
                <i if={ chkstatus == "loading" } class="fa fa-refresh fa-spin fa-fw chkicon" aria-hidden="true"></i>
                <i if={ chkstatus == "ok" } class="fa fa-check fa-fw chkicon ok" aria-hidden="true"></i>
                <i if={ chkstatus == "ng" } class="fa fa-times fa-fw chkicon ng" aria-hidden="true"></i>
                <input type="password" ref="pass1" maxlength="20" placeholder="password"onKeyUp={ passedit }>
                <i if={ chkstatus2 == "ok" } class="fa fa-check fa-fw chkicon2 ok" aria-hidden="true"></i>
                <i if={ chkstatus2 == "ng" } class="fa fa-times fa-fw chkicon2 ng" aria-hidden="true"></i>
                <input type="password" ref="pass2" maxlength="20" placeholder="password (確認)" onKeyUp={ passedit }><br>
                <div if={ loading }><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></div>
                <div if={ text }><span>{text}</span></div>
                <div if={ text2 }><span>{text2}</span></div>
                <button type="button" class="wbtn" onclick={ adduser }>新規登録</button>
                <br>
                <a href="/login#">ユーザーをお持ちの方はログイン</a>
            </form>
        </div>
    </div>
    <script>
        var auth = riot.observable()
        var that = this
        var chkstatus = null
        auth.checkuser = function(userid) {
            $.post('http://150.95.149.0/api/sp/Check', "userid="+userid, function(res) {
                if(res === "true"){
                    that.chkstatus = "ok"
                    that.text=""
                }else{
                    that.chkstatus = "ng"
                    that.text="🙅ユーザーIDはすでに使われています🙅"
                }
                that.update()
            })
        }
        auth.adduser = function(params) {
            $.post('http://150.95.149.0/api/sp/Regist', params, function(res) {
                if(res === "true"){
                    document.cookie = 'userid='+params.userid
                    route("#adduserdata")
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
            if(!!this.refs.userid || !!this.refs.pass1 || pass1===pass2 || that.chkstatus =="ok" || that.chkstatus2 =="ok"){
                that.loading=true
                var params = {userID:this.refs.userid.value,pass:this.refs.pass1.value}
                that.parent.params = params
                route("adduserData")
            }
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
</adduser>