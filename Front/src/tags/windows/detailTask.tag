<detailTask>
    <div class="window">
        <div class="window-header">
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <div class="detail-l">
                <label>タスク名</label>
                <input ref="input" onkeyup={ edit } value={ opts.task.taskName }>
                <label>進捗</label>
                <input ref="input" onkeyup={ edit } value={ opts.task.progressNumerator }>%
                <label>タスクコメント</label>
                <input ref="input" onkeyup={ edit } value={ opts.task.comment }>
                <label>タスク詳細</label>
                <textarea ref="input" onkeyup={ edit } value=""></textarea>
            </div>
            <div class="detail-r">
                <label>タスク名</label>
                <input ref="input" onkeyup={ edit } value={ opts.task.taskName }>
                <button>更新</button>
                <button>削除</button>
            </div>
        </div>

    </div>

    <script>
        edit(e)
        {
            // this.text = e.target.value
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
            height: 2em;
            float: right;
        }
        .window-detail{
            label{
                height: 2.5em;
                line-height: 2.5em;
                display: block;
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
                height:6em;
                width:90%;
                padding: .5em .6em;
                border: 1px solid #ccc;
                box-shadow: inset 0 1px 3px #ddd;
                border-radius: 4px;
                font: inherit;
                display: block;
                max-width:  90%;
                max-height: 14em;
            }
            .detail-l{
                float:left;
                width:60%;
            }
            .detail-r{
                float:left;
                width:40%;
            }
        }
    </style>
</detailTask>