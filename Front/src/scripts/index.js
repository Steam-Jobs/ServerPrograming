import '../tags/app.tag'
/*
var data = {
    data: {
        "userName": "username",
        "userID": "id",
        "gravatar": "d07edfba8c14b0c50d041c7a9ef31528",
        lists: [
            {
                "auto": false,
                "taskListColor": 0,
                "dispByColor": 0,
                "dispByDead": 0,
                "dispByProg": 0,
                "dispByStart": -1,
                "dispUnFinished": false,
                "hidByDead": false,
                "hidByFinished": false,
                "hidByList": null,
                "hidByStart": 0,
                "taskListName": "未分類",
                "sortRule": 0,
                "taskListID": 0,
                "tasks": [
                    {
                        "taskColor": 0,
                        "comment": "comment1",
                        "creationDate": "Jul 15, 2017 9:19:24 PM",
                        "deadlineDate": null,
                        "description": "test task1",
                        "taskName": "test1",
                        "priority": 2,
                        "progressDenominator": 30,
                        "progressNumerator": 10,
                        "startDate": "May 18, 2017 12:00:00 PM",
                        "taskID": 1,
                        "userID": "user"
                    },
                    {
                        "taskColor": 0,
                        "comment": "comment0",
                        "creationDate": "Jul 15, 2017 9:19:24 PM",
                        "deadlineDate": "May 18, 2017 12:00:00 PM",
                        "description": "test task0",
                        "taskName": "test0",
                        "priority": 2,
                        "progressDenominator": 30,
                        "progressNumerator": 10,
                        "startDate": "May 18, 2017 12:00:00 PM",
                        "taskID": 0,
                        "userID": "user"
                    }
                ]
            },{
                "auto": false,
                "taskListColor": 0,
                "dispByColor": 0,
                "dispByDead": 0,
                "dispByProg": 0,
                "dispByStart": 0,
                "dispUnFinished": false,
                "hidByDead": false,
                "hidByFinished": false,
                "hidByList": null,
                "hidByStart": 0,
                "taskListName": "終了",
                "sortRule": 0,
                "taskListID": 1,
                "tasks": []
            }
        ]

    }
};
*/
var data
// ajax用のオブジェクト
var OptsMixin = {
    obs: riot.observable(),
    req: new XMLHttpRequest(),


    init:function() {
        var that = this
        // トリガーが発火した時の処理
        this.obs.on('hiddenWindow', function () {
            that.current = ""
            that.update()
        })
        this.obs.on('ajax', function () {
            console.log("asyncSend")
            that.req.open('POST', 'http://150.95.149.0/api/sp/Home', true)
            that.req.setRequestHeader('content-type', 'application/x-www-form-urlencoded;charset=UTF-8')
            that.req.send('userID=id')
            console.log('userID=' + that.name + '&pass=' + that.pass)
            // レスポンスとしてjsonを受け取る
        })
        // リクエスト完了後の処理
        this.req.onreadystatechange = function () {
            if (that.req.readyState === 4) { // 通信の完了時
                if (that.req.status === 200) { // 通信の成功時
                    console.log("通信成功")
                    data = that.req.responseText
                    console.log(that.req.responseText)
                    console.log(riot)
                    riot.mixin(data)
                    //riot.mount('app')
                } else {
                    console.log("ヤバいエラー" + req.responseText)
                }
            } else {
                console.log("通信中")
            }
        }
    }
}

console.log(riot)
riot.mixin("asyncprog",OptsMixin)


//riot.mixin(data)
riot.mount('app')