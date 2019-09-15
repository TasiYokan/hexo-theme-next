hexo.extend.tag.register('qiniu', function(args){
    var slug = args.shift();
    if (!slug) return;

    var src = "http://osg7voxw6.bkt.clouddn.com/" + slug;
    var title = args.length ? args.shift() : '';
    var alt = args.length ? args.shift() : '';

    return ' <img src="' + src + '" alt="' + alt + '" title="' + title + '">';
});

hexo.extend.tag.register('tencent', function (args) {
    var slug = args.shift();
    if (!slug) return;

    var src = "https://imgs-1259535704.cos.ap-guangzhou.myqcloud.com/blog/" + slug;
    var title = args.length ? args.shift() : '';
    var alt = args.length ? args.shift() : '';

    return ' <img src="' + src + '" alt="' + alt + '" title="' + title + '">';
});

hexo.extend.tag.register('external', function (args) {
    var slug = args.shift();
    if (!slug) return;

    var src = slug;
    var title = args.length ? args.shift() : '';
    var alt = args.length ? args.shift() : '';

    return ' <img src="' + src + '" alt="' + alt + '" title="' + title + '">';
});

hexo.extend.tag.register('video', function (args) {
    var slug = args.shift();
    if (!slug) return;

    var src = "/videos/" + slug;
    var title = args.length ? args.shift() : '';
    var alt = args.length ? args.shift() : '';

    // return ' <iframe width=500 src="' + src + '" alt="' + alt + '" title="' + title + '" frameborder=0 allowfullscreen></iframe>';
    return '<video width="100%" height="400" src="' + src + '" controls="controls"> The`<video>` tag is not supported by your browser. </video >'
});


hexo.extend.tag.register('local_test', function (args) {
    var slug = args.shift();
    if (!slug) return;

    var src = "/local_image_root/" + slug;
    var title = args.length ? args.shift() : '';
    var alt = args.length ? args.shift() : '';

    return ' <img src="' + src + '" alt="' + alt + '" title="' + title + '">';
});

hexo.extend.tag.register('placeholder', function (args) {
    return ;
});