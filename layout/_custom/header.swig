<script type="text/javascript">
    // Wait for the page to load first
    var _prevOnload = window.onload;
    var swithlang = function ()  {
        // var switchLang = document.getElementById("menu").getElementsByClassName("menu-item-switch_lang")[0].childNodes[0];
        var href = window.location.href;
        var menu = document.getElementById("menu");
        var switchLang = menu.getElementsByClassName("menu-item-lang")[0].getElementsByTagName("a")[0];

        var indexOfEn = href.toLowerCase().indexOf('/en/');
        if (indexOfEn !== -1) {
            // console.log("switch to cn from "+ switchLang.href );
            switchLang.href = href.replace('/en/', '/');
        }
        else {
            // console.log("switch to en from " + switchLang.href );
            switchLang.href = href.replace(/(^http[s]?:\/\/[a-z0-9.]*[:?0-9]*\/)(.*)/i, '$1en/$2');
        }
        // console.log("href now is " + switchLang.href);
    }

    // Switch directly as the load may take a while
    // swithlang();

    window.onmousedown = function() {
        swithlang();
    }
</script>

