 //To display images randomly
var myImage = document.getElementById("rotatingImage");

var imageArray = ["/images/tot5.jpg","/images/moms.jpg","/images/tot4.jpg","/images/tot6.jpg","/images/tots.jpg"];
var imageIndex = 0;

function changeImage() {
	myImage.setAttribute("src",imageArray[imageIndex]);
	imageIndex++;
	if (imageIndex >= imageArray.length) {
		imageIndex = 0;
	}
}

// setInterval is also in milliseconds
  setInterval(changeImage,2000);