import '../tags/app.tag'
import '../scripts/router.js'

riot.mount('app', {
    columns: [{
            title: 'リスト1',
            items: [
                {title: 'タスク 1',progress:50 , date: new Date()},
                {title: 'タスク 2',progress:25 ,comment: "コメント1"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"},
                {title: 'タスク 3',progress:10 ,comment: "コメント2"}
            ]
        },
        {
            title: 'リスト2',
            items: [
                {title: 'タスク2 1',progress:70, date: new Date()},
                {title: 'タスク2 2',progress:20,comment: "コメント3"},
                {title: 'タスク2 3',progress:5,comment: "コメント4"}
            ]
        }]
})