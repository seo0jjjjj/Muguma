import { Box } from './Box.js';
class App {

	constructor() {
		this.canvas = document.createElement('canvas'); // canvas 태그를 만듬.
		document.body.appendChild(this.canvas); //body에 canvas태그를 삽입.
		this.ctx = this.canvas.getContext('2d'); // 'ctx를 사용하기위함'
		this.boxes = [];
		// 화면에 보여줄 이미지 숫자
		this.bufferSize = 7;
		this.img_path = [ //이미지를 담는배열
			'./../../images/1.jpg',
			'./../../images/2.jpg',
			'./../../images/3.jpg',
			'./../../images/4.jpg',
			'./../../images/5.jpg',
			'./../../images/6.jpg',
			'./../../images/7.jpg',
			'./../../images/8.jpg',
			'./../../images/9.jpg',
			'./../../images/10.jpg',
			'./../../images/11.jpg',
			'./../../images/12.jpg',
			'./../../images/13.jpg',
			'./../../images/14.jpg',

		]

		this.pixelRadio = window.devicePixelRatio > 1 ? 2 : 1;
		this.image_path_iterator = 0; // iterator of image path; 
		window.addEventListener('resize', this.resize.bind(this), false);
		this.resize();
		window.requestAnimationFrame(this.animate.bind(this));
		console.log("스테이지크기는" + this.stageHeight); //화면 크기 분석
		
		//박스 생성
		this.initBox(this.bufferSize);
		//이벤트리스너 추가
		this.canvas.addEventListener('click', (event)=> 
		this.clickHandler(event)
		);
	}
	//새로고침시 박스를 생성 (랜덤한 위치)
	initBox(bufferSize) {
		for (let i = 0; i < bufferSize; i++) {
			var x = Math.random() * this.stageWidth;
			var y = Math.random() * this.stageHeight * 0.8;
			var src = this.img_path[i];
			this.image_path_iterator++;
			var id = i+1; // 그림은 1부터 시작함.
			this.boxes.push(new Box(x, y, src, id));
		}
		

	}

	resize() {
		this.stageWidth = document.body.clientWidth;
		this.stageHeight = document.body.clientHeight;

		this.canvas.width = this.stageWidth * this.pixelRadio;
		this.canvas.height = this.stageHeight * this.pixelRadio;
		this.ctx.scale(this.pixelRadio, this.pixelRadio);

	}




	animate() {
		window.requestAnimationFrame(this.animate.bind(this));

		this.ctx.clearRect(0, 0, this.stageWidth, this.stageHeight);

		//애니메이션
		for (let i = 0; i < this.bufferSize; i++) {

			// 이미지가 화면밖으로 나가면,
			if (this.boxes[i].x < (-this.boxes[i].img_width)) {



				// 새로운 이미지 생성
				var id = this.image_path_iterator+1; //이미지 id는 1부터 시작하므로 1더해줌.
				var x = this.stageWidth + 500; //화면밖에 생성
				var y = Math.random() * this.stageHeight * 0.7;
				if (this.image_path_iterator >= this.img_path.length) { //마지막 이미지 까지 노출되면
					this.image_path_iterator = 0; // 첫번째 이미지를 가르킴.
				}
				var src = this.img_path[this.image_path_iterator++];

				//삭제 후 재 배열

				var box = new Box(x, y, src, id);
				this.boxes.splice(i, 1,box);
	
				//console.log("[새로운 박스 생성]"+box.speed );
			}
			else if (this.boxes[i].x > (-this.boxes[i].img_width)) {

				this.boxes[i].animate(this.ctx);
			}


		}
	}
//클릭시
	clickHandler(event) {
		let mosPosX = event.layerX;
		let mosPosY = event.layerY;
		let box;
		let selectedBox;

		
		
		//이미지 영역인지 확인
		for (let i = 0; i<this.bufferSize; i++) {
			box = this.boxes[i];
			if (mosPosX > box.x && mosPosX < box.x + box.img_width && mosPosY > box.y && mosPosY < box.y + box.img_height) {
				
			selectedBox = box;
			}
			
		}
		if(selectedBox!=""){
		console.log("클릭한 그림 id"+selectedBox.id);
		location.href="./../productPage/productInfo.jsp?pid=" + selectedBox.id;

		}
		
	}
}
window.onload = () => {
	new App();
	
}