import '../tags/app.tag'
riot.mount('app', {
    columns: [{
        title: 'リスト1',
        items: [
            {id: 1, title: 'タスク 1', progress: 50, date: new Date()},
            {id: 2, title: 'タスク 2', progress: 25, comment: "コメント1"},
            {id: 3, title: 'タスク 3', progress: 10, comment: "コメント2"},
            {id: 4, title: 'タスク 3', progress: 10, comment: "コメント2"},
        ]
    },
        {
            title: 'リスト2',
            items: [
                {id: 5, title: 'タスク2 1', progress: 70, date: new Date()},
                {id: 6, title: 'タスク2 2', progress: 20, comment: "コメント3"},
                {id: 7, title: 'タスク2 3', progress: 5, comment: "コメント4"}
            ]
        },
        {
            title: 'リスト3',
            items: [
                {id: 8, title: 'タスク3 1', progress: 80, date: new Date()},
                {id: 9, title: 'タスク3 2', progress: 30, comment: "コメント3"},
                {id: 10, title: 'タスク3 3', progress: 15, comment: "コメント4"}
            ]
        }]
})