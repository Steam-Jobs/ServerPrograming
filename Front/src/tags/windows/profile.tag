<profile>
    <div class="window">
        <div class="window-header">
            <label class="edit-title">プロフィール</label>
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <div class="items">
                <label class="split">基本設定</label>
                <span class="checkbox"><label>ユーザーネーム<input type="text" class="numinput" ref="username" value=""></label></span>
            </div>
            <button class="wbtn" onclick={ updateUser } >更新</button>

    </div>

    <script>
        var app = this.parent.parent
        var that=this

        this.on('mount',function () {
            this.refs.username.value = app.data.userName
        })

        editText(e){
            e.target.hidden = true
            e.target.nextElementSibling.hidden=false
            e.target.nextElementSibling.focus()
        }
        editedText(e){
            opts.list.taskListName = e.target.value
            e.target.hidden = true
            e.target.previousElementSibling.hidden=false
        }
        updateUser(){
            app.data.userName = this.refs.username.value
            app.dataPush()
            route("/")
        }
    </script>

    <style type="less">
        .window {
            width: 300px;
            height: 600px;
            margin:80px auto 0;
            padding:0 10px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
        }
        .window-header{
            width:100%;
            margin-top: 5px;
            height: 2em;
            float: right;
            margin-bottom:5px;
            font-weight:bold;
            .edit-title{
                width:75%;
                overflow: hidden;
                height:1em;
                line-height: 1em;
                padding:.5em 0;
                float:left;
                resize:none;
            }
            a{
                float:right;
            }
        }
        .window-detail{
            float: left;
            label{
                float:left;
                width:100%;
                height: 2.5em;
                line-height: 2.5em;
            }
            select{
                width:100%;
                float: left;
            }
            .checkbox{
                width:100%;
                float: left;
                height: 2em;
                line-height: 2em;
                label{
                    width:auto;
                }
                .chkbox{
                    float:left;
                    width:auto;
                    margin:.75em .5em 0;
                }
            }
            .split{
                height: auto;
                line-height: 1.5em;
                border-bottom:#174d7a solid 1px;
                padding:0;
                margin-bottom:1em;
            }
            .items{
                float: left;
                margin-bottom:1em;
            }
            .wbtn{
                float:right;
                margin-left: 10px;
                background-color: rgba(2, 106, 167,1);
                border-radius: 3px;
                color: #e8e8e8;
                padding: 10px 20px;
                &:hover{
                     background-color: rgba(2, 106, 167,.6);
                 }
            }
        }
    </style>
</profile>