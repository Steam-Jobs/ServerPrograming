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
                <button name="submit" onclick={ postJSON }>JSONテストデータを送信</button>
            <div id="result">{ text }</div>
        </div>

    </div>

    <script>
        var that = this

        var name,pass,text

        var data = {data:{"userName":"JSONTEST","userID":"userID","gravatar":"d07edfba8c14b0c50d041c7a9ef31528",lists:[{"auto":false,"taskListColor":0,"dispByColor":0,"dispByDead":0,"dispByProg":0, "dispByStart": -1,"dispUnFinished": false,"hidByDead": false,"hidByFinished": false,"hidByList": null,"hidByStart": 0,"taskListName": "未分類","sortRule": 0,"taskListID": 0,"tasks": [{"taskColor": 0,"comment": "comment1","creationDate": "Jul 15, 2017 9:19:24 PM","deadlineDate": null,"description": "test task1","taskName": "test1","priority": 2,"progressDenominator": 30,"progressNumerator": 10,"startDate": "May 18, 2017 12:00:00 PM","taskID": 1,"userID": "user"},{"taskColor": 0,"comment": "comment0","creationDate": "Jul 15, 2017 9:19:24 PM",  "deadlineDate": "May 18, 2017 12:00:00 PM","description": "test task0","taskName": "test0","priority": 2,"progressDenominator": 30,"progressNumerator": 10,"startDate": "May 18, 2017 12:00:00 PM","taskID": 0,"userID": "user"}]},{"auto": false,"taskListColor": 0,"dispByColor": 0,"dispByDead": 0,"dispByProg": 0,"dispByStart": 0,"dispUnFinished": false,"hidByDead": false,"hidByFinished": false,"hidByList": null,"hidByStart": 0,"taskListName": "終了","sortRule": 0,"taskListID": 1,"tasks": []}    ]            }        };

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
                    console.log("エラー｜→"+req.status)
                }
            }else{
                console.log("送信中")
            }
        }

        // window(オーバーレイウィンドウ)を制御する変数
        var window
        this.on('mount',function () {
            // mixinからwindowを取得
            window = that.mixin("window")
        })

        closeWindow(){
            route('/')
        }

        postID(){
            console.log("asyncSend")
            req.open('POST', 'http://150.95.149.0/api/sp/Login', true)
            req.setRequestHeader('content-type','application/x-www-form-urlencoded;charset=UTF-8')
            req.send('userID=' + that.name + '&pass=' + that.pass)
            // レスポンスとしてjsonを受け取る
            text = req.responseText
        }
        postJSON(){
            console.log("asyncSend(JSON)")
            req.open('POST', 'http://150.95.149.0/api/sp/Update', true)
            req.setRequestHeader('content-type','application/json;charset=UTF-8')
            data={"data":{"userID":"id","userName":"name","gravatar":null,"lists":[{"taskListID":0,"taskListName":"未分類","tasks":[],"taskIDList":[],"sortRule":0,"taskListColor":0,"auto":false,"dispByStart":0,"dispByDead":0,"dispUnFinished":false,"dispByProg":0,"dispByColor":0,"hidByFinished":false,"hidByDead":false,"hidByStart":0,"hidByList":null},{"taskListID":1,"taskListName":"終了","tasks":[],"taskIDList":[],"sortRule":0,"taskListColor":0,"auto":false,"dispByStart":0,"dispByDead":0,"dispUnFinished":false,"dispByProg":0,"dispByColor":0,"hidByFinished":false,"hidByDead":false,"hidByStart":0,"hidByList":null}]}}
            req.send(JSON.stringify(data))
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