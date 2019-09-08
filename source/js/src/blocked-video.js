var vinmeoIcon = new Image();
vinmeoIcon.onerror = function () {
    // The user can't access video from blocked source like vimeo youtube
    console.log("can't access vimeo")

    var videoFrame = document.getElementById("iframe-blocked");
    // var width = videoFrame.getAttribute("width");
    var altImgUrl = videoFrame.getAttribute("altImgUrl");
    var altImgTxt = videoFrame.getAttribute("alt");

    var altImg = document.createElement("IMG");
    // altImg.setAttribute("width", width);
    altImg.setAttribute("src", altImgUrl);
    altImg.setAttribute("alt", altImgTxt)

    videoFrame.parentNode.replaceChild(altImg, videoFrame);
    altImg.parentNode.setAttribute("style", "position: relative; margin-bottom: 20px; width: 100%; padding-top: 0%;");
};
vinmeoIcon.src = "http://vimeo.com/favicon.ico";