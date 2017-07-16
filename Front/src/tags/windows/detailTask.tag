<detailTask>
    <div class="window">
        <div class="window-header">
            <label class="edit-title" onclick={ editText }>{ opts.task ? opts.task.taskName:"タスク名を入力" }</label>
            <input class="edit-title" onblur={ editedText } value={ opts.task.taskName } hidden>
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <div class="detail-l">
                <label class="split">タスクコメント</label>
                <textarea ref="input" onkeyup={ edit }>{ opts.task.comment }</textarea>
                <label class="split">タスク詳細</label>
                <textarea ref="input" class="comment" onkeyup={ edit }>{ opts.task.description }</textarea>
            </div>
            <div class="detail-r">
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.auto }/><label onclick={ labelClicked }>進捗度</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.auto }/><label onclick={ labelClicked }>開始日時</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.auto }/><label onclick={ labelClicked }>締め切り日時</label></span>
                <button class="wbtn" hidden={ !opts.task }>削除</button>
                <button class="wbtn">{ opts.task ? "更新":"作成" }</button>
            </div>
        </div>
    </div>
    <script>
        var that=this;
        labelClicked(e)
        {
            e.target.parentNode.firstElementChild.value = !e.target.parentNode.firstElementChild.value
        }
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
    </script>

    <style type="less">
        .window {
            width: 500px;
            height: 500px;
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
            label:hover{
                border-radius:3px;
                background: #cccccc;
            }
            a{
                float: right;
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
            input{
                width:90%;
                padding: .5em .6em;
                border: 1px solid #ccc;
                box-shadow: inset 0 1px 3px #ddd;
                border-radius: 4px;
                font: inherit;
                display: block;
            }
            textarea{
                height:4em;
                width:90%;
                display: block;
                max-width:  90%;
                max-height: 14em;
            }
            .comment{
                height:8em;
            }
            .split{
                height: auto;
                line-height: 1.5em;
                border-bottom:#174d7a solid 1px;
                padding:0;
                margin-bottom:1em;
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
                select{
                    margin-top:.5em;
                }
                .numinput{
                    height: 1.5em;
                    width:3.5em;
                    float:none;
                    padding:0;
                    padding-left: .5em;
                }
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
            .detail-l{
                float:left;
                width:58%;
                padding-right:2%;
            }
            .detail-r{
                float:left;
                width:40%;
            }
        }
    </style>
</detailTask>