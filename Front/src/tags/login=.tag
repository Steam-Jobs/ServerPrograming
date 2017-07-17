// Login API
var auth = riot.observable()

auth.login = function(params) {
$.get('/api', params, function(json) {
auth.trigger('login', json)
})
}

<login>
    <form onsubmit="{ login }">
        <input ref="username" type="text" placeholder="username">
        <input ref="password" type="password" placeholder="password">
    </form>

    login() {
    opts.login({
    username: this.refs.username.value,
    password: this.refs.password.value
    })
    }

    // any tag on the system can listen to login event
    opts.on('login', function() {
    $(body).addClass('logged')
    })
</login>