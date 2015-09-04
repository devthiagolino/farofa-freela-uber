function SpriteAnimation(canvas, interval, random, images, focusLoad, hover) {
	this.interval = interval;
	this.random = random;
	this.images = images;
	this.canvas = canvas;
	this.ctx = canvas.getContext('2d');
	this.loadedImages = [];
	this.loadedCount = 0;
	this.currentImage = 0;
	this.lastUpdate = 0;
	this.accum = 0;
	this.focusLoad = focusLoad ? true : false;
	this.hover = hover ? true : false;
	this.isHovering = false;
	
	this.canvas.onmouseover = function(){
		if(this.hover) {
			this.isHovering = true;
			this.currentImage = 0;
		}
	}.bind(this);
	
	this.canvas.onmouseout = function(){
		if(this.hover) {
			this.isHovering = false;
			this.currentImage = 0;
		}
	}.bind(this);
	
	if(!focusLoad) {
		var i = 0;
		var img = new Image();
		img.onload = (function(n, g){
			return function() {
				this.loadedCount++;
				this.loadedImages[n] = g;
				if(this.loadedCount == this.images.length) {
					this.onLoadComplete();
				}
				if(this.loadedCount == 1) {
				    this.onFirstLoadComplete(n);
				}
			}.bind(this);
		}.bind(this))(i, img);
		img.src = this.images[i];
		
		setTimeout(this.loadImages.bind(this),0);
	}
	else {
		this.loadImages();
	}
}
SpriteAnimation.prototype.loadImages = function() { 
	var c = true;
	for(var i in this.images) {
		if(c && !this.focusLoad) { c = false; continue; }
		var img = new Image();
		img.onload = (function(n, g){
			return function() {
				this.loadedCount++;
				this.loadedImages[n] = g;
				if(this.loadedCount == this.images.length) {
					this.onLoadComplete();
				}
				if(this.loadedCount == 1) {
				    this.onFirstLoadComplete(n);
				}
			}.bind(this);
		}.bind(this))(i, img);
		img.src = this.images[i];
	}
};
SpriteAnimation.prototype.onLoadComplete = function() {
	this.lastUpdate = Date.now();
	this.draw();
	this.canvas.style.backgroundImage = null;
};
SpriteAnimation.prototype.onFirstLoadComplete = function(n) {
    this.canvas.style.backgroundImage = "url("+this.loadedImages[n].src+")";
    this.canvas.style.backgroundSize = "100% 100%";
};
SpriteAnimation.prototype.draw = function() {
	
	var now = Date.now();
    var dt = now - this.lastUpdate;
    this.lastUpdate = now;
	
	this.accum += dt;
	
	this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
	
	var currentImage = this.loadedImages[this.currentImage];
	//this.ctx.drawImage(currentImage,0,0,currentImage.width,currentImage.height);
	
	this.ctx.drawImage(currentImage,0,0,this.canvas.width,this.canvas.height);
	
	if(this.accum > this.interval) {
		if(this.hover && !this.isHovering) {
			
		}
		else {
			this.accum = 0;
			if(!this.random) {
				this.currentImage++;
				if(this.currentImage == this.loadedImages.length) {
					if(this.hover) {
						this.currentImage--;
					}
					else {
						this.currentImage = 0;
					}
				}
			}
			else {
			    var rnd = this.lastRnd;
			    while(rnd == this.lastRnd) {
			        rnd = Math.floor(Math.random()*this.loadedImages.length);
			    }
			    
				this.currentImage = rnd;
				this.lastRnd = rnd;
			}
		}
	}
	
	requestAnimationFrame(this.draw.bind(this));
};
