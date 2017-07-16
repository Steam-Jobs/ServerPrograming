<detailList>
    <div class="window">
        <div class="window-header">
            <label class="edit-title" onclick={ editText }>{ opts.list.listName }</label>
            <textarea class="edit-title" onblur={ editedText } hidden>{ opts.list.listName }</textarea>
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <label class="split">ソート</label>
            <div class="items">
                <span class="checkbox">
                <select ref="input" value="0">
                    <option value="0">ソートしない</option>
                    <option value="1">優先度昇順</option>
                    <option value="2">優先度降順</option>
                    <option value="3">締め切り日時近い順</option>
                    <option value="4">締め切り日時遠い順</option>
                    <option value="5">開始切り日時近い順</option>
                    <option value="6">開始切り日時遠い順</option>
                    <option value="7">作成日時昇順</option>
                    <option value="8">作成日時降順</option>
                    <option value="9">進捗度昇順</option>
                    <option value="10">進捗度降順</option>
                </select>
                </span>
                <span class="checkbox"><input type="checkbox" value=""/><label onclick={ labelClicked }>リストの自動化</label></span>
            </div>
            <div class="items">
                <label class="split">表示関連</label>
                <span class="checkbox"><input type="checkbox" value={ x }/><label>開始日時が***日以内</label></span>
                <span class="checkbox"><input type="checkbox" value={ x }/><label>締め切り日時が***日以内</label></span>
                <span class="checkbox"><input type="checkbox" value={ x }/><label>締め切り後満了していない</label></span>
            </div>
                <label class="split">非表示</label>
            <div class="items">
                <span class="checkbox"><input type="checkbox" value={ x }/><label>進捗が満了</label></span>
                <span class="checkbox"><input type="checkbox" value={ x }/><label>締め切り日時を超過</label></span>
                <span class="checkbox"><input type="checkbox" value={ x }/><label>締切がなく開始日を超過</label></span>
            </div>
                <label class="split">次のリストにあるものを表示</label>
                <select ref="input" size="2" value={ opts.list.listName } multiple>
                    <option value="1">リスト1</option>
                    <option value="2">リスト2</option>
                    <option value="3">リスト3</option>
                </select>
                <label>リストカラー</label>
                <button class="wbtn">削除</button>
                <button class="wbtn">更新</button>
        </div>

    </div>

    <script>
        var x = true;
        var that=this;
        labelClicked(e)
        {
            console.log(e)
            e.target.parentNode.firstElementChild.value = !e.target.parentNode.firstElementChild.value
        }
        editText(e){
            console.log(e)
            e.target.hidden = true
            e.target.nextElementSibling.hidden=false
            e.target.nextElementSibling.focus()
        }
        editedText(e){
            console.log(e)
            e.target.hidden = true
            e.target.previousElementSibling.hidden=false
            that.update()
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
                    float:left;
                    width:auto;
                }
                input{
                    float:left;
                    width:auto;
                    margin:.75em .5em 0;
                }
                select{
                    margin-top:.5em;
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
            }
            button{
                float: left;
                border: none;
                outline: none;
                appearance: none;
                color: #e8e8e8;
                padding: 10px 20px;
                &:hover{
                     background-color: rgba(2, 106, 167,.6);
                }
            }
        }
    </style>
</detailList>