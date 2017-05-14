import route from 'riot-route'
route.base("/");

route('/',function(name){
    console.log('あ')
})

route.start()