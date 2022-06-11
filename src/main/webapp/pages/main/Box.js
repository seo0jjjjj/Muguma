const PI2 = Math.PI*2;

export class Box{ // export? APP에서 imprt하려고


    constructor(x,y){
        
        
        this.index++;
        this.x = x; 
        this.y= y;  
        
        console.log(this.x,this.y);
        /*<!--this.img = new Image();
        this.img.src='./../../images/014.png'
        this.img.addEventListener('load',()=>{
			cosole.log("?");
        })*/
    }

   
    animate(ctx){
      //  ctx.save();
        ctx.font = 'bold 32px sans-serif';
        ctx.fillStyle = '#111';
        ctx.beginPath();
        //그리는거
        ctx.fillRect(this.x,this.y,100,100);
        
        //ctx.drawImage(this.img, this.x, this.y,300,300);
        
        

        ctx.fillStyle = '#fff';
        ctx.fillText(this.index,this.x+30,this.y+30);
        this.x+=1;
        ctx.closePath();
        //ctx.restore();
    }

    
    

}