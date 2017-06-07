; (function ($) {
    $('.canada').hover(function() {
        $('.map-container').css("background-position", "center -510px");
    });
    $('.us').hover(function() {
        $('.map-container').css("background-position", "center -1020px");
    });
    $('.central-america').hover(function() {
        $('.map-container').css("background-position", "center -1530px");
    });
    $('.south-america').hover(function() {
        $('.map-container').css("background-position", "center -2040px");
    });
    $('.europe').hover(function() {
        $('.map-container').css("background-position", "center -2550px");
    });
    $('.africa').hover(function() {
        $('.map-container').css("background-position", "center -3060px");
    });
    $('.asia-pacific').hover(function() {
        $('.map-container').css("background-position", "center -3570px");
    });
    $('.map-container area').mouseout(function () {
        $('.map-container').css("background-position", "center top");
    });

    $(".map-region-accordion").accordion({
        collapsible: true,
        active: "false",
        header: "li.map-region",
        icons: false,
        heightStyle: "content"
    });
})(jQuery);

$(window).resize(function () {
    if ($(window).width() > 785) {
        $("#main").show();
    } else {
        if ($(".language-map-mobile").is(":visible")) {
            $("#main").hide();
        }
    }
});

function showMap() {
    $(".language-map").toggle();
    $(".language-map-mobile").toggle();
    //$(".overlay").fadeIn(200);
    $(".language-map-overlay").toggle();
    if ($(window).width() <= 785) {
        $("#main").toggle();
    }
}

function CloseMap(bRedirectCookieSet) {
    $(".language-map").hide();
    $(".language-map-mobile").hide();
    //$(".overlay").hide();
    $(".language-map-overlay").hide();

    if (bRedirectCookieSet === undefined || bRedirectCookieSet == false)
    {
        SetCloseMapCookie();
    }
}

function SetCloseMapCookie() {
    if (document.cookie.indexOf('KeepUserOnSite') == -1) {
            var name = "KeepUserOnSite";
            var value = "True";
            document.cookie = name + "=" + value + "; path=/";
        }
}

function ShowLinkOptions(RegionName, bLowerPubs) {
    if (bLowerPubs == 'False'){
        $(".map-country-list").hide();
    }
    $('.map-country-list.' + RegionName.toLowerCase()).fadeIn(300);
}

function CloseSelection(RegionName) {
    $('.map-country-list.' + RegionName.toLowerCase()).fadeOut(300);
}

function SetCookieAndRedirect(TLD, dotComDomain, SendTo) {

    var redirect = '';
    var toValue = '';
    var currentPage = String(document.location);
    var bFromExternalTPSites;
    var sitePattern = /machinerytrader|tractorhouse|truckpaper/i;
    var pagePattern = /\/map/i;

    if (SendTo != '') {
        toValue = '&to=' + escape(SendTo);
    }

    bFromExternalTPSites = (sitePattern.test(currentPage)) && (!pagePattern.test(currentPage));
    redirect = 'http://' + dotComDomain + "/map/SetLocalePreference.aspx?tld=" + TLD + toValue;

    //If user control is loaded in MAT, TH or TRK, when a language is selected the page will open in a new tab/window
    //If the user control is loaded in MRBK, the page will be loaded within the same window

    FlagUserSelectedTLDCookie();

    if (bFromExternalTPSites == true) {
        window.open(redirect, '_blank');
        CloseMap(true);
    } else {
        window.location = redirect;
    }
}

function SetLowerPubsPreferredTLDCookieAndRedirect(TLD, SiteAndPath) {

    var redirect = '';

    if (SiteAndPath.indexOf('to=') > -1) {
        //check to a to qs variable. If its there then we know its going through passport and needs encoding and the cookie needs set.
        var splitPath = SiteAndPath.split('to=')

        redirect = splitPath[0] + 'to=' + encodeURIComponent(splitPath[1]);

        LowerPubUserSelectedTLDCookie(TLD);
    } else {
        redirect = SiteAndPath;
    }
    
      

    window.location.replace(redirect);

}

function FlagUserSelectedTLDCookie() {
    //TODO: This is temporary because we're redirecting to MBK at this point, when we are doing this on the actual pub site, this is no longer necessary
    var name = "UserSelectedTLD";
    var value = "True";
    var days = 365;
    var d = new Date();
    d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = name + "=" + value + "; " + expires + "; path=/";
}


function LowerPubUserSelectedTLDCookie(TLD) {
    
    var name = "LowerPubPreferredTLD";
    var value = TLD;
    var days = 365;
    var d = new Date();
    d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = name + "=" + value + "; " + expires + "; path=/";

}