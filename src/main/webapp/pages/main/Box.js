const PI2 = Math.PI*2;

export class Box{ // export? APP에서 imprt하려고


    constructor(x,y,src,id){
       
        this.x = x; 
        this.y= y;  
        this.src= src;  
        this.speed= 1+Math.random()*5;
        this.id= id;  
        this.canDraw = false;

        this.img = new Image();
        this.img.src=src;
        this.img.addEventListener('load',()=>{
				this.img_width = this.img.width/5;
				this.img_height = this.img.height/5;	
				this.canDraw = true;	
        })
        
    }

   
    animate(ctx){
      //  ctx.save();
        if(this.canDraw){
	
        this.x= this.x-this.speed*0.5 ;	
    
        ctx.font = 'bold 32px sans-serif';
        ctx.fillStyle = '#111';
        ctx.beginPath();
        
        //그리는거
         ctx.fillStyle = '#fff';
        
        //그림자 설정
        ctx.shadowColor = "gray";
        ctx.shadowOffsetX = 8; 
        ctx.shadowOffsetY = 8; 
        ctx.shadowBlur = 15;

		//액자
        ctx.fillRect(this.x-5,this.y-5,this.img_width+10,this.img_height+10); // 이미지보다 살짝 큰 액자
        
        //그림자 제거
       	ctx.shadowColor = "";
        ctx.shadowOffsetX = 0; 
        ctx.shadowOffsetY = 0; 
        ctx.shadowBlur = 0;
        
        //그림그리기
        ctx.drawImage(this.img, this.x, this.y,this.img_width,this.img_height); // 이미지
        //ctx.fillText(this.id,this.x+(this.img_width/2),this.y+30); // 같이 다니는 설명
        

       
        
        
		
        ctx.closePath();
        //ctx.restore();
        }
    }

    
    

}