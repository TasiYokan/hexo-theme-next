hexo.extend.tag.register('qiniu', function(args){
    var slug = args.shift();
    if (!slug) return;

    var src = "http://osg7voxw6.bkt.clouddn.com/" + slug;
    var alt = args.length ? args.shift() : '';
    var title = args.length ? args.shift() : '';

    return ' <img src="' + src + '" alt="' + alt + '" title="' + title + '">';
});