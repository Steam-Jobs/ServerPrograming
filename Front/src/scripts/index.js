import '../tags/app.tag'
import '../scripts/router.js'

riot.mount('app', {
    columns: [{
            title: 'TODO1',
            items: [
                {title: 'Todo 1', date: new Date()},
                {title: 'Todo 2',comment: "コメント1"},
                {title: 'Todo 3',comment: "コメント2"}
            ]
        },
        {
            title: 'TODO2',
            items: [
                {title: 'Todo2 1', date: new Date()},
                {title: 'Todo2 2',comment: "コメント3"},
                {title: 'Todo2 3',comment: "コメント4"}
            ]
        }]
})