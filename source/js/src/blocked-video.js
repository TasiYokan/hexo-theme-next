var ReplaceWithImg = function() {
    // The user can't access video from blocked source like vimeo youtube
    // console.log("Can't access vimeo")

    var videoFrames = document.getElementsByName("iframe-blocked");
    console.log("Blocked video(s) count: "+videoFrames.length);
    for (var i = videoFrames.length - 1; i >= 0; i--) {
        var videoFrame = videoFrames[i];

        // console.log("url " + videoFrame.getAttribute("src"));
        // var width = videoFrame.getAttribute("width");
        var altImgUrl = videoFrame.getAttribute("altImgUrl");
        var altImgTxt = videoFrame.getAttribute("alt");

        var altImg = document.createElement("IMG");
        // altImg.setAttribute("width", width);
        altImg.setAttribute("src", altImgUrl);
        altImg.setAttribute("alt", altImgTxt)

        videoFrame.parentNode.replaceChild(altImg, videoFrame);
        altImg.parentNode.setAttribute("style", "position: relative; margin-bottom: 20px; width: 100%; padding-top: 0%;");
    }
}

// fetch('http://vimeo.com', { mode: 'no-cors' })
//     .then(r => {
//         console.log('You are free');
//     })
//     .catch(e => {
//         console.log('You are blocked');
//         ReplaceWithImg();
//     });


function WebLocationCheck() {
    // Check browser's default language
    var language = navigator.language;
    console.log("Your browser language is ", language);
    if (language == 'zh-CN') {
        ReplaceWithImg();
    }
}

// window.onload = function () {
//     WebLocationCheck();
// }

WebLocationCheck();