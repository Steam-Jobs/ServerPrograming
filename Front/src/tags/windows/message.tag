<message>
    <div class="window">
        <div class="window-header">
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <p>{ opts.message }</p>
        </div>

    </div>

    <script>
        console.log(this)
    </script>

    <style type="less">
        .window {
            width: 500px;
            margin:80px auto 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
        }
        .window-header{
        }
        .window-detail{
            text-align: center;
            padding-bottom: 20px;
        }
    </style>
</message>