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