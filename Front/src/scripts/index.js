import '../tags/app.tag'
var data = {
    data: {
        userID: '1',
        userName: 'ゆーざーの名前',
        gravatar:'d07edfba8c14b0c50d041c7a9ef31528',
        lists: [
            {
                listID: '1',
                listName: 'リスト1',
                listColor: '#114514',
                tasks: [
                    {taskID: 1, taskName: 'タスク 1', progressDenominator: 100, progressNumerator: 50, comment: "コメント1", priority: 0, taskColor:0},
                    {taskID: 2, taskName: 'タスク 2', progressDenominator: 100, progressNumerator: 25, comment: "コメント1", priority: 0, taskColor:0},
                    {taskID: 3, taskName: 'タスク 3', progressDenominator: 100, progressNumerator: 10, comment: "コメント2", priority: 0, taskColor:0},
                    {taskID: 4, taskName: 'タスク 3', progressDenominator: 100, progressNumerator: 10, comment: "コメント2", priority: 0, taskColor:0},
                ]
            },
            {
                listID: '2',
                listName: 'リスト2',
                listColor: '#114514',
                tasks: [
                    {taskID: 1, taskName: 'タスク 1', progressDenominator: 100, progressNumerator: 50, comment: "コメント1", priority: 0, taskColor:0},
                    {taskID: 2, taskName: 'タスク 2', progressDenominator: 100, progressNumerator: 25, comment: "コメント1", priority: 0, taskColor:0},
                    {taskID: 3, taskName: 'タスク 3', progressDenominator: 100, progressNumerator: 10, comment: "コメント2", priority: 0, taskColor:0},
                    {taskID: 4, taskName: 'タスク 3', progressDenominator: 100, progressNumerator: 10, comment: "コメント2", priority: 0, taskColor:0},
                ]
            },
            {
                listID: '3',
                listName: 'リスト3',
                listColor: '#114514',
                tasks: [
                    {taskID: 1, taskName: 'タスク 1', progressDenominator: 100, progressNumerator: 50, comment: "コメント1", priority: 0, taskColor:0},
                    {taskID: 2, taskName: 'タスク 2', progressDenominator: 100, progressNumerator: 25, comment: "コメント1", priority: 0, taskColor:0},
                    {taskID: 3, taskName: 'タスク 3', progressDenominator: 100, progressNumerator: 10, comment: "コメント2", priority: 0, taskColor:0},
                    {taskID: 4, taskName: 'タスク 3', progressDenominator: 100, progressNumerator: 10, comment: "コメント2", priority: 0, taskColor:0},
                ]
            },
        ]

    }
};
riot.mixin(data)
riot.mount('app')