var ReplaceWithImg = function() {
    // The user can't access video from blocked source like vimeo youtube
    console.log("Can't access vimeo")

    var videoFrames = document.getElementsByName("iframe-blocked");
    console.log("length "+videoFrames.length);
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

// Due to Cross-Origin Resource Sharing (CORS) problem, we can't use XMLHttpRequest to detect connection
// var xhr = new XMLHttpRequest();
// xhr.timeout = 3000;
// xhr.responseType = "text";
// xhr.open('GET', 'Access-Control-Allow-Origin: https://vimeo.com', true);
// xhr.ontimeout = function (e) { 
//     console.log("vimeo timeout!")
//     ReplaceWithImg();
// };
// xhr.onerror = function (e) {
//     console.log("vimeo error!")
//     ReplaceWithImg();
// }
// xhr.send();


fetch('http://vimeo.com', { mode: 'no-cors' })
    .then(r => {
        console.log('You are free');
    })
    .catch(e => {
        console.log('You are blocked');
        ReplaceWithImg();
    });