$(function () {
  var parseOptions = function (el, data_attr_name) {
    data_attr_name = data_attr_name || 'track';
    var opts = {}, ii, p, opts_arr,
      data_options = function (el) {
        return el.data(data_attr_name);
      };

    var cached_options = data_options(el);

    if (typeof cached_options === 'object') {
      return cached_options;
    }

    opts_arr = (cached_options || ':').split(';');
    ii = opts_arr.length;

    function isNumber (o) {
      return ! isNaN (o-0) && o !== null && o !== "" && o !== false && o !== true;
    }

    function trim (str) {
      if (typeof str === 'string') return $.trim(str);
      return str;
    }

    while (ii--) {
      p = opts_arr[ii].split(':');
      p = [p[0], p.slice(1).join(':')];

      if (/true/i.test(p[1])) p[1] = true;
      if (/false/i.test(p[1])) p[1] = false;
      if (isNumber(p[1])) {
        if (p[1].indexOf('.') === -1) {
          p[1] = parseInt(p[1], 10);
        } else {
          p[1] = parseFloat(p[1]);
        }
      }

      if (p.length === 2 && p[0].length > 0) {
        opts[trim(p[0])] = trim(p[1]);
      }
    }

    return opts;
  };

  /**
   * Loop through object and only keep keys that starts with a specific string.
   */
  function keepKeys(str, obj) {
    for (var key in obj) {
      if (obj.hasOwnProperty(key)) {
        if (key.substring(0, 2) !== str) {
          delete obj[key];
        }
      }
    }

    return obj;
  }

  /**
   * To track GA add the following properties to the data-track attribute:
   * ga_category (required)
   * ga_action (required)
   * ga_label
   * ga_value
   */
  function trackGoogleAnalytics(obj) {
    // Make sure GA is loaded
    if (window.ga) {
      // Set value to null unless it's a number.
      if (isNaN(obj.ga_value)) {
        obj.ga_value = null;
      }

      // Make sure both category and action is a string to send track event.
      if (typeof obj.ga_category === 'string' && typeof obj.ga_action === 'string') {
        ga("send", "event", obj.ga_category, obj.ga_action, obj.ga_label, obj.ga_value);
      }
    }
  }

  /**
   * To track Mixpanel add the following properties to the data-track attribute:
   * mp (required - this is the event name)
   * mp_x (all of these will be sent as properties)
   */
  function trackMixpanel(obj, name) {
    if (window.mixpanel) {
      var mp_name = false;

      if (typeof(obj.mp) === 'string') {
        var mp_name = obj.mp;
        delete obj.mp;
      }

      if (typeof(name)==='undefined' && mp_name == false) {
        console.log('no name');
        return false;
      }

      // Remove mp_ prefix from remaining properties. We don't want that in MP.
      for (var key in obj) {
        if (obj.hasOwnProperty(key)) {
          // Make sure we only keep mp_ properties
          if (key.substring(0, 3) !== 'mp_') {
            delete obj[key];
          } else {
            var new_key = key.substring(3);
            obj[new_key] = obj[key];
            delete obj[key];
          }
        }
      }

      mixpanel.track(mp_name, obj);
    }
  }

  /**
   * Get parameters from query string
   * Credits: http://stackoverflow.com/questions/4656843/jquery-get-querystring-from-url
   *
   * Example usage:
   * var search_query = getUrlVars()["query"];
   */
  function getUrlVars()
  {
      var vars = [], hash;
      var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
      for(var i = 0; i < hashes.length; i++)
      {
          hash = hashes[i].split('=');
          vars.push(hash[0]);
          vars[hash[0]] = safeTrackingValue(hash[1]);
      }
      return vars;
  }

  /**
   * Prevent XSS attacks
   */
  function safeTrackingValue(str) {
    $('<div class="safe-tracking-value" style="display:none;">').appendTo('body').text(str);
    var safe_str = $('.safe-tracking-value').html();
    $('.safe-tracking-value').remove();

    return safe_str;
  }

  /**
   * Track all elements with data-track attribute
   */
  $('[data-track]').on('click', function(e) {
    var el = $(this);
    var obj = parseOptions(el);

    trackGoogleAnalytics(obj);
    trackMixpanel(keepKeys('mp', obj));
  });
});
