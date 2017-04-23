import route from 'riot-route'

route('/', function(name) {
    console.log('The list of fruits')
})

route('/fruit', function(name) {
    console.log('The list of fruits')
})