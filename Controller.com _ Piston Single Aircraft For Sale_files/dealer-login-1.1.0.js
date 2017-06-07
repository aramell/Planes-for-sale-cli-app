; (function ($, window) {    
    //Set up the needed functions
    if (!jQuery.fn.infobox) {
        jQuery.fn.infobox = function (ibparent) {
            ibparent = (typeof ibparent === 'undefined' || ibparent == '' || $(ibparent).length == 0) ? undefined : ibparent;
            var $self = $(this);
            $self.center(ibparent);
            var infoboxResizeTimeout;
            var resizeInfoboxCenter = function () {
                clearTimeout(infoboxResizeTimeout);
                infoboxResizeTimeout = setTimeout(function () {
                    if ($self.hasClass('open'))
                        $self.center(ibparent);
                }, 100);
            };
            if (window.addEventListener) {
                window.addEventListener('resize', resizeInfoboxCenter);
            } else {
                window.attachEvent('onresize', resizeInfoboxCenter);
            }
            $('.infobox-trigger').click(function (e) {
                e.preventDefault();
                $('#' + $(this).attr('data-infobox-id')).addClass('open').center(ibparent);
                return false;
            });
            $('.close', $self).click(function (e) {
                e.preventDefault();
                $self.removeClass('open');
                return false;
            });
            return this;
        };
    }

    if (!jQuery.fn.center) {
        jQuery.fn.center = function (horizontalParent, verticalParent) {
            verticalParent = (typeof verticalParent === 'undefined') ? window : verticalParent;
            horizontalParent = (typeof horizontalParent === 'undefined') ? window : horizontalParent;
            var self = $(this);
            this.css("position", "absolute");

            //if the parent is the window, we need to adjust for scrolling
            var verticalAdjust = 0;
            var horizontalAdjust = 0;
            if (verticalParent == window)
                verticalAdjust = $(window).scrollTop();
            if (horizontalParent == window)
                horizontalAdjust = $(window).scrollLeft();
            this.css("top", Math.max(0, (($(verticalParent).height() - self.outerHeight()) / 2) + verticalAdjust) + "px");
            this.css("left", Math.max(0, (($(horizontalParent).width() - self.outerWidth()) / 2) + horizontalAdjust) + "px");

            return this;
        };
    }
   
    //Set up the communication 
    if (!window.DealerLogin) window.DealerLogin = {};
    if (!DealerLogin.options) DealerLogin.options = {
        allowed: [
            "dealers.dsdev.ext",
            "dsfs.dsdev.ext",
            "dealers.sandhillsdealerservices.com",
            "dsfs.sandhillsdealerservices.com",
            "dealers.sandhills.com",
            "dsfs.sandhills.com"
        ],
        debug: false,
        sitename: "",
        redirecturl: "", 
        dsdomain: "",
        csslocation: "//dev1media.sandhills.com/css/dealer-login-1.0.0.css"
    };

    DealerLogin.modalLoaded = false;
    DealerLogin.loadModal = function () {
        if (!DealerLogin.modalLoaded) {
            //Append the modal to the document
            if (!document.getElementById("dealer-login")) {
                $("body").append('<div id="dealer-login" class="infobox" style="max-width:320px;">' +
                    '<div class="infobox-content">' +
                        '<a class="close" href="#">Close</a>' +
                        '<iframe id="dealer-login-iframe" src="" style="width:100%;height:780px;border:0;" scrolling="no"></iframe>' +
                    '</div>' +
                '</div>');
                //Removes the iframe src on back button clicked to prevent a redirect back to the page you just came from.
                $("head").append('<script>document.getElementById("dealer-login-iframe").src = "";</script>')
            }

            $("#dealer-login").infobox(window["infobox_center_parent"]);

            //Set up the triggers for the modal
            $('.infobox-trigger[data-infobox-id="dealer-login"]').click(function () {
                var redirectUrl = DealerLogin.options.redirecturl;
                if (~redirectUrl.indexOf("?")) {
                    redirectUrl += "&";
                } else {
                    redirectUrl += "?";
                }
                redirectUrl += "sitename=" + DealerLogin.options.sitename;
                document.getElementById('dealer-login-iframe').src =
                    "https://!#dsdomain#!/ClaimsSignIn/ClaimsSignIn.aspx?RedirectUrl=!#redirecturl#!&framed=1&sitename=!#sitename#!"
                    .replace("!#dsdomain#!", DealerLogin.options.dsdomain)
                    .replace("!#redirecturl#!", encodeURIComponent(redirectUrl))
                    .replace("!#sitename#!", DealerLogin.options.sitename);
            });
            DealerLogin.modalLoaded = true;
        };       
    }

    DealerLogin.cssLoaded = false;
    DealerLogin.loadCss = function () {
        if (DealerLogin.options.csslocation && DealerLogin.options.csslocation.length > 0 && $('link[href="' + DealerLogin.options.csslocation + '"]').length == 0) {
            var cb = function () {
                if (!DealerLogin.cssLoaded) {
                    var $head = $("head");
                    var $headlinklast = $head.find("link[rel='stylesheet']:last");
                    var defaultStyles = '<link href="' + DealerLogin.options.csslocation + '" rel="stylesheet"/>';
                    if ($headlinklast.length) {
                        $headlinklast.after(defaultStyles);
                    } else {
                        $head.append(defaultStyles);
                    };
                    DealerLogin.cssLoaded = true;
                };
            };
            try {
                if (window.addEventListener) {
                    var raf = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
                    if (raf) raf(cb);
                    else window.addEventListener('load', cb);
                } else {
                    window.attachEvent("onload", cb);
                };
            } catch (e) { console.log('error caught: ' + e.message); };
        };
    };

    DealerLogin.closeModal = function (location) {
        $("#dealer-login").removeClass("open");
        window.open(location);
    };
   
    DealerLogin.onReceiveCommunication = function (querystr) {
        var params = parseQueryString(querystr);
        switch (params["action"]) {
            case "redirect":
                window.location.href = decodeURIComponent(params["location"]);
                break;
            case "closemodalandopenintab":
                DealerLogin.closeModal(decodeURIComponent(params["location"]));
                break;
            case "resize":
                $('#dealer-login-iframe').css('height', params["height"]);
                break;
        }
    }


    DealerLogin.CreateOnClickRedirect = function () {
           
            //Set up the triggers for the modal
            $('.infobox-trigger[data-infobox-id="dealer-login"]').click(function (e) {
                var redirectUrl = DealerLogin.options.redirecturl;
                if (~redirectUrl.indexOf("?")) {
                    redirectUrl += "&";
                } else {
                    redirectUrl += "?";
                }

                if (DealerLogin.options.sitename != "needalender.com")
                {
                    redirectUrl += "sitename=" + DealerLogin.options.sitename;
                    e.preventDefault();

                    var dateTimeISOString = new Date().toISOString();
                    window.open("https://!#dsdomain#!/ClaimsSignIn/ClaimsSignIn.aspx?RedirectUrl=!#redirecturl#!&framed=1&sitename=!#sitename#!&time=!#time#!"
                        .replace("!#dsdomain#!", DealerLogin.options.dsdomain)
                        .replace("!#redirecturl#!", encodeURIComponent(redirectUrl))
                        .replace("!#sitename#!", DealerLogin.options.sitename)
                        .replace("!#time#!", dateTimeISOString)
                        , "_newtab")
                }
                else
                {
                    e.preventDefault();

                    var dateTimeISOString = new Date().toISOString();
                    window.open("https://!#dsdomain#!/ClaimsSignIn/ClaimsSignIn.aspx?RedirectUrl=!#redirecturl#!&framed=1&time=!#time#!"
                        .replace("!#dsdomain#!", DealerLogin.options.dsdomain)
                        .replace("!#redirecturl#!", encodeURIComponent(redirectUrl))
                        .replace("!#time#!", dateTimeISOString)
                        , "_newtab")
                }
               
                    
            });        
    }



    //Set up the communication events
    if (window.addEventListener) {
        window.addEventListener("message", receiveMessage, false);
    } else if (window.attachEvent) {
        window.attachEvent("onmessage", receiveMessage);
    }

    function receiveMessage(event) {
        if (event && event.data) {
            //Security
            origin = event.origin;
            if (DealerLogin.options.allowed.indexOf(origin.replace(/^https?:\/\//, "")) == -1) return;          
            if (DealerLogin.options.debug && console && console.log) {
                console.log("event.data : " + event.data);
                console.log("event.origin : " + event.origin);
            }
            DealerLogin.onReceiveCommunication(event.data)
        }
    }

    function parseQueryString(str) {
        str = str.toLowerCase();
        var vars = [];
        var arr = str.split('&');
        var pair;
        for (var i = 0; i < arr.length; i++) {
            pair = arr[i].split('=');
            vars.push(pair[0]);
            vars[pair[0]] = unescape(pair[1]);
        }
        return vars;
    }
})(jQuery, window || {});