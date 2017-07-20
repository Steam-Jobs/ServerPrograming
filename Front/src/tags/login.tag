require('../tags/login/loginform.tag')
require('../tags/login/adduser.tag')
require('../tags/login/adduserData.tag')
<login>
    <loginform if={ current=="" }></loginform>
    <adduser if={ current=="adduser" }></adduser>
    <adduserData if={ current=="adduserData" } params={ params }></adduserData>

    <script>
        this.current=""
        var that = this

        route.base("/login#")

        route('adduserData', function(){
            that.current = "adduserData"
            that.update()
        })
        route('adduser', function(){
            that.current = "adduser"
            that.update()
        })
        route('', function(){
            that.current = ""
            that.update()
        })

        route.start()
    </script>
</login>