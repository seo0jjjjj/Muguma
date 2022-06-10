import {Box} from './Box.js';
class App{
    
    constructor(){
        this.canvas = document.createElement('canvas'); // canvas 태그를 만듬.
        document.body.appendChild(this.canvas); //body에 canvas태그를 삽입.
        this.ctx = this.canvas.getContext('2d'); // 'ctx를 사용하기위함'
        this.boxes = [];
        this.pixelRadio = window.devicePixelRatio > 1 ? 2 : 1 ;

        window.addEventListener('resize',this.resize.bind(this), false);
        this.resize();
        window.requestAnimationFrame(this.animate.bind(this));
    
        this.canvas.addEventListener('click',this.clickHandler);
        
        this.createBox(3);
        
    }

    createBox(num){
        
        for(let i=0; i<num; i++){
        this.boxes.push(new Box(-100,Math.random()*this.stageHeight,this.ctx));
    }
    }


    resize(){
        this.stageWidth = document.body.clientWidth;
        this.stageHeight = document.body.clientHeight;

        this.canvas.width = this.stageWidth * this.pixelRadio;
        this.canvas.height = this. stageHeight * this.pixelRadio;
        this.ctx.scale(this.pixelRadio, this.pixelRadio);

    }

    clickHandler(event) {
        console.log(event);
    }
    

    animate(){
        window.requestAnimationFrame(this.animate.bind(this));

        this.ctx.clearRect(0,0,this.stageWidth,this.stageHeight);
        for(let i=0; i<3; i++){
        this.boxes[i].animate(this.ctx);
    }
    }
}

window.onload = () =>{
    new App();
}