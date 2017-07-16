import '../tags/app.tag'
var data = {
    data: {
        "userName": "st4ndard",
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
riot.mixin(data)
riot.mount('app')