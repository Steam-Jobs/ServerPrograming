<ajaxtest>
    <div class="window">
        <div class="window-header">
            <span onclick={ closeWindow }><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></span>
        </div>
        <div class="window-detail">
                <label>名前：
                <input type="text" name="name" size="15" onkeyup={ edit }/>
                <input type="password" name="pass" size="15" onkeyup={ edit }/>
                <button name="submit" onclick={ postID }>送信</button>
            <div id="result">{ text }</div>
        </div>

    </div>

    <script>
        var that = this

        var name,pass,text

        // テキスト編集時の処理
        edit(e){
            if(e.target.name === "name"){
                that.name = e.target.value
            }
            if(e.target.name === "pass"){
                that.pass = e.target.value
            }
        }

        // ajax
        var req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (req.readyState === 4) { // 通信の完了時
                if (req.status === 200) { // 通信の成功時
                    console.log("通信成功")
                    console.log(req.responseText)
                    that.text = req.responseText
                    that.update()
                }else{
                    console.log("はいヤバいエラー→"+req.responseText)
                }
            }else{
                console.log("通信中")
            }
        }

        // window(オーバーレイウィンドウ)を制御する変数
        var window
        this.on('mount',function () {
            // mixinからwindowを取得
            window = that.mixin("window")
        })

        closeWindow(){
            window.obs.trigger("hiddenWindow")
        }

        postID(){
            console.log("asyncSend")
            req.open('POST', 'http://150.95.149.0/api/sp/Login', true)
            req.setRequestHeader('content-type','application/x-www-form-urlencoded;charset=UTF-8')
            req.send('userID=' + that.name + '&pass=' + that.pass)
            console.log('userID=' + that.name + '&pass=' + that.pass)
            // レスポンスとしてjsonを受け取る
            text = req.responseText
        }


    </script>

    <style type="less">
        .window {
            width: 500px;
            margin:80px auto 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
        }
        .window-header{
        }
        .window-detail{
            text-align: center;
            padding-bottom: 20px;
        }
    </style>
</ajaxtest>