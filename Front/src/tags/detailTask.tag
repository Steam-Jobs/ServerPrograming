<detailTask>
    <div class="window">
        <div class="window-header">
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            { opts.task.title }
            { opts.task.progress }%
            { opts.task.comment }
        </div>

    </div>

    <script>
        console.log(this)
    </script>

    <style type="less">
        .window {
            width: 500px;
            height: 500px;
            margin:80px auto 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
        }
        .window-header{
            height: 100px;
        }
    </style>
</detailTask>