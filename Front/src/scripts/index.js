require('../scripts/router.js')
require('../tags/app.tag')

riot.mount('app', {
    columns: [{
            title: 'TODO1',
            items: [
                {title: 'Todo 1', date: new Date()},
                {title: 'Todo 2'},
                {title: 'Todo 3'}
            ]
        },
        {
            title: 'TODO2',
            items: [
                {title: 'Todo2 1', date: new Date()},
                {title: 'Todo2 2'},
                {title: 'Todo2 3'}
            ]
        }]
})