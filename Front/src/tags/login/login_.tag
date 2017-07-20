<login>
    <video loop autoplay preload="none" ref="bgv">
        <source src="/img/baji.mp4" type="video/mp4">
    </video>
    <div class="page" onclick={ mute }>
        <img src="img/login.png">
    </div>
    <script>

        this.on('mount',function () {
            this.refs.bgv.volume = 0.5
        })
        mute(e){
            console.log(e.target.previousElementSibling.muted = !e.target.previousElementSibling.muted)
        }
    </script>
    <style type="less">
        body{
            background: none;
        }
        video{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            background-size: cover;
        }
        img{
            user-select: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -70%);
            max-width: 100%;
            max-height: 100%;
            width: auto;
            height: auto;
            z-index: -10;
            background-size: cover;
        }
        .page{
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            background-image: url("/img/bg_pattern.png");
            background-repeat: repeat;

        }
    </style>
</login>