function B(b){var a={};a.selector=b;a.element=document.querySelector(a.selector);a.show=function(){a.element.style.display="block"};a.hide=function(){a.element.style.display="none"};a.addClass=function(c){a.element.classList.add(c)};a.removeClass=function(c){a.element.classList.remove(c)};a.height=function(){return a.element.offsetHeight};a.width=function(){return a.element.offsetWidth};a.text=function(){return a.element.innerText};a.html=function(){return a.element.innerHTML};a.val=function(){return a.element.value};
a.attr=function(c,b){if(!b)return a.element.getAttribute(c);a.element.setAttribute(c,b);return a};a.on=function(c,b){a.element["on"+c]=b;return a};a.RENDER=function(c){a.element.innerHTML+=c};return a}
var json2html={transform:function(b,a,c){var e={events:[],html:""},d={events:!1},d=json2html._extend(d,c);if(void 0!==a||void 0!==b)b="string"===typeof b?JSON.parse(b):b,e=json2html._transform(b,a,d);return d.events?e:e.html},_extend:function(b,a){var c={},e;for(e in b)c[e]=b[e];for(e in a)c[e]=a[e];return c},_append:function(b,a){var c={html:"",event:[]};"undefined"!==typeof b&&"undefined"!==typeof a&&(c.html=b.html+a.html,c.events=b.events.concat(a.events));return c},_isArray:function(b){return"[object Array]"===
Object.prototype.toString.call(b)},_transform:function(b,a,c){var e={events:[],html:""};if(json2html._isArray(b))for(var d=b.length,k=0;k<d;++k)e=json2html._append(e,json2html._apply(b[k],a,k,c));else"object"===typeof b&&(e=json2html._append(e,json2html._apply(b,a,void 0,c)));return e},_apply:function(b,a,c,e){var d={events:[],html:""};if(json2html._isArray(a))for(var k=a.length,g=0;g<k;++g)d=json2html._append(d,json2html._apply(b,a[g],c,e));else if("object"===typeof a){var h="<>";void 0===a[h]&&
(h="tag");if(void 0!==a[h]){h=json2html._getValue(b,a,h,c);d.html+="<"+h;var l={events:[],html:""};for(g in a)switch(g){case "tag":case "<>":break;case "children":case "html":var f=a[g];if(json2html._isArray(f))l=json2html._append(l,json2html._apply(b,f,c,e));else if("function"===typeof f)switch(f=f.call(b,b,c),typeof f){case "object":void 0!==f.html&&void 0!==f.events&&(l=json2html._append(l,f));break;case "function":case "undefined":break;default:l.html+=f}else k=json2html._getValue(b,a,g,c);break;
default:f=!1;if(2<g.length&&"on"==g.substring(0,2).toLowerCase()){if(e.events){var f={action:a[g],obj:b,data:e.eventData,index:c},m=json2html._guid();d.events[d.events.length]={id:m,type:g.substring(2),data:f};d.html+=" json2html-event-id-"+g.substring(2)+"='"+m+"'"}f=!0}f||(f=json2html._getValue(b,a,g,c),void 0!==f&&(f="string"===typeof f?'"'+f.replace(/"/g,"&quot;")+'"':f,d.html+=" "+g+"="+f))}d.html+=">";k&&(d.html+=k);d=json2html._append(d,l);d.html+="</"+h+">"}}return d},_guid:function(){var b=
function(){return(65536*(1+Math.random())|0).toString(16).substring(1)};return b()+b()+"-"+b()+b()+"-"+b()+b()},_getValue:function(b,a,c,e){var d="";a=a[c];c=typeof a;return"function"===c?a.call(b,b,e):d="string"===c?(new json2html._tokenizer([/\$\{([^\}\{]+)\}/],function(a,c,d){return c?a.replace(d,function(a,c){for(var d=c.split("."),e=b,g="",k=d.length,h=0;h<k&&!(0<d[h].length&&(e=e[d[h]],null===e||void 0===e));++h);null!==e&&void 0!==e&&(g=e);return g}):a})).parse(a).join(""):a},_tokenizer:function(b,
a){if(!(this instanceof json2html._tokenizer))return new json2html._tokenizer(b,a);this.tokenizers=b.splice?b:[b];a&&(this.doBuild=a);this.parse=function(a){this.src=a;this.ended=!1;this.tokens=[];do this.next();while(!this.ended);return this.tokens};this.build=function(a,b){a&&this.tokens.push(this.doBuild?this.doBuild(a,b,this.tkn):a)};this.next=function(){var a=this,b;a.findMin();b=a.src.slice(0,a.min);a.build(b,!1);a.src=a.src.slice(a.min).replace(a.tkn,function(b){a.build(b,!0);return""});a.src||
(a.ended=!0)};this.findMin=function(){var a=0,b,d;this.min=-1;for(this.tkn="";void 0!==(b=this.tokenizers[a++]);)d=this.src[b.test?"search":"indexOf"](b),-1!=d&&(-1==this.min||d<this.min)&&(this.tkn=b,this.min=d);-1==this.min&&(this.min=this.src.length)}}};

/*
show()
hide()
addClass()
removeClass()
width()
height()
val()
text()
html()
attr()
on()
RENDER()

 B(".b").on("dblclick", function() {
    alert("It works");
  });

B(".x").RENDER(
  "<h2>Test heading</h2>"
);


*/

/*
UNCOMPILED CODE 

 function B(selector) {
    var self = {};
    self.selector = selector;
    self.element = document.querySelector(self.selector);

    //HIDE and SHOW functions
    self.show = function() {
      self.element.style.display = "block";
    }

    self.hide = function() {
      self.element.style.display = "none";
    }

    //ADDCLASS and REMOVECLASS
    self.addClass = function(className) {
      self.element.classList.add(className);
    }

    self.removeClass = function(className) {
      self.element.classList.remove(className)
    }

    //WIDTH and HEIGHT functions
    self.height = function() {
      return self.element.offsetHeight;
    }
    

    self.width = function() {
      return self.element.offsetWidth;
    }

    //text function - RETURNS!! ONLY text value
    self.text = function() {
      return self.element.innerText;
    }

    //html function - RETURNS!! html value
    self.html = function() {
      return self.element.innerHTML;
    }

self.val = function(){
 return self.element.value;
}
    //ATTR function
    self.attr = function(name, value) {
      if (!value) return self.element.getAttribute(name)
      self.element.setAttribute(name, value);
      return self;
    }

    //ON function
    self.on = function(type, callback) {
      self.element["on" + type] = callback;
      return self;
    }
    
    //RENDER function
    self.RENDER = function(html){
     self.element.innerHTML += html; 
     
    }
    return self;

  }
  
  


  /* ---------------------------------------- Public Methods ------------------------------------------------ */
  var Bjson = {
  'transform': function(json, transform, _options) {

    //create the default output
    var out = {
      'events': [],
      'html': ''
    };

    //default options (by default we don't allow events)
    var options = {
      'events': false
    };

    //extend the options
    options = Bjson._extend(options, _options);

    //Make sure we have a transform & json object
    if (transform !== undefined || json !== undefined) {

      //Normalize strings to JSON objects if necessary
      var obj = typeof json === 'string' ? JSON.parse(json) : json;

      //Transform the object (using the options)
      out = Bjson._transform(obj, transform, options);
    }

    //determine if we need the events
    // otherwise return just the html string
    if (options.events) return (out);
    else return (out.html);
  },

  /* ---------------------------------------- Private Methods ------------------------------------------------ */

  //Extend options
  '_extend': function(obj1, obj2) {
    var obj3 = {};
    for (var attrname in obj1) {
      obj3[attrname] = obj1[attrname];
    }
    for (var attrname in obj2) {
      obj3[attrname] = obj2[attrname];
    }
    return obj3;
  },

  //Append results
  '_append': function(obj1, obj2) {
    var out = {
      'html': '',
      'event': []
    };
    if (typeof obj1 !== 'undefined' && typeof obj2 !== 'undefined') {
      out.html = obj1.html + obj2.html;

      out.events = obj1.events.concat(obj2.events);
    }

    return (out);
  },

  //isArray (fix for IE prior to 9)
  '_isArray': function(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
  },

  //Transform object
  '_transform': function(json, transform, options) {

    var elements = {
      'events': [],
      'html': ''
    };

    //Determine the type of this object
    if (Bjson._isArray(json)) {

      //Itterrate through the array and add it to the elements array
      var len = json.length;
      for (var j = 0; j < len; ++j) {
        //Apply the transform to this object and append it to the results
        elements = Bjson._append(elements, Bjson._apply(json[j], transform, j, options));
      }

    } else if (typeof json === 'object') {

      //Apply the transform to this object and append it to the results
      elements = Bjson._append(elements, Bjson._apply(json, transform, undefined, options));
    }

    //Return the resulting elements
    return (elements);
  },

  //Apply the transform at the second level
  '_apply': function(obj, transform, index, options) {

    var element = {
      'events': [],
      'html': ''
    };

    //Itterate through the transform and create html as needed
    if (Bjson._isArray(transform)) {

      var t_len = transform.length;
      for (var t = 0; t < t_len; ++t) {
        //transform the object and append it to the output
        element = Bjson._append(element, Bjson._apply(obj, transform[t], index, options));
      }

    } else if (typeof transform === 'object') {

      var _element = '<>';

      //Add legacy support for tag
      if (transform[_element] === undefined) _element = 'tag';

      //Check to see if we have a valid element name
      if (transform[_element] !== undefined) {

        //Get the element name (this can be tokenized)
        var name = Bjson._getValue(obj, transform, _element, index);

        //Create a new element
        element.html += '<' + name;

        //Create a new object for the children
        var children = {
          'events': [],
          'html': ''
        };

        //innerHTML
        var html;

        //Look into the properties of this transform
        for (var key in transform) {

          switch (key) {

            //LEGACY support for tag
            case 'tag':
            case '<>':
              //Do nothing as we have already created the element
              break;

              //LEGACY support for children
            case 'children':
            case 'html':

              //Get the transform value associated with this key
              // added as key could be children or html
              var _transform = transform[key];

              //Determine what kind of object this is
              // array & function => children
              // other => html
              if (Bjson._isArray(_transform)) {

                //Apply the transform to the children
                children = Bjson._append(children, Bjson._apply(obj, _transform, index, options));
              } else if (typeof _transform === 'function') {

                //Get the result from the function
                var temp = _transform.call(obj, obj, index);

                //Determine what type of object was returned
                switch (typeof temp) {

                  //Only returned by Bjson.transform or $.Bjson calls
                  case 'object':
                    //make sure this object is a valid Bjson response object
                    // we ignore all other objects (since we don't know how to represent them in html)
                    if (temp.html !== undefined && temp.events !== undefined) children = Bjson._append(children, temp);
                    break;

                    //Not supported
                  case 'function':
                  case 'undefined':
                    break;

                    //Append to html
                    // string, number, boolean
                  default:
                    children.html += temp;
                    break;
                }
              } else {

                //Create the html attribute for this element
                html = Bjson._getValue(obj, transform, key, index);
              }
              break;

            default:
              //Add the property as a attribute if it's not a key one
              var isEvent = false;

              //Check if the first two characters are 'on' then this is an event
              if (key.length > 2)
                if (key.substring(0, 2).toLowerCase() == 'on') {

                  //Determine if we should add events
                  if (options.events) {

                    //if so then setup the event data
                    var data = {
                      'action': transform[key],
                      'obj': obj,
                      'data': options.eventData,
                      'index': index
                    };

                    //create a new id for this event
                    var id = Bjson._guid();

                    //append the new event to this elements events
                    element.events[element.events.length] = {
                      'id': id,
                      'type': key.substring(2),
                      'data': data
                    };

                    //Insert temporary event property (Bjson-event-id) into the element
                    element.html += " Bjson-event-id-" + key.substring(2) + "='" + id + "'";
                  }
                  //this is an event
                  isEvent = true;
                }

                //If this wasn't an event AND we actually have a value then add it as a property
              if (!isEvent) {
                //Get the value
                var val = Bjson._getValue(obj, transform, key, index);

                //Make sure we have a value
                if (val !== undefined) {
                  var out;

                  //Determine the output type of this value (wrap with quotes)
                  if (typeof val === 'string') out = '"' + val.replace(/"/g, '&quot;') + '"';
                  else out = val;

                  //create the name value pair
                  element.html += ' ' + key + '=' + out;
                }
              }
              break;
          }
        }

        //close the opening element
        element.html += '>';

        //add the innerHTML (if we have any)
        if (html) element.html += html;

        //add the children (if we have any)
        element = Bjson._append(element, children);

        //add the closing element
        element.html += '</' + name + '>';
      }
    }

    //Return the output object
    return (element);
  },

  //Get a new GUID (used by events)
  '_guid': function() {
    var S4 = function() {
      return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4() + "-" + S4() + S4() + "-" + S4() + S4());
  },

  //Get the html value of the object
  '_getValue': function(obj, transform, key, index) {

    var out = '';

    var val = transform[key];
    var type = typeof val;

    if (type === 'function') {
      return (val.call(obj, obj, index));
    } else if (type === 'string') {
      var _tokenizer = new Bjson._tokenizer([
        /\$\{([^\}\{]+)\}/
      ], function(src, real, re) {
        return real ? src.replace(re, function(all, name) {

          //Split the string into it's seperate components
          var components = name.split('.');

          //Set the object we use to query for this name to be the original object
          var useObj = obj;

          //Output value
          var outVal = '';

          //Parse the object components
          var c_len = components.length;
          for (var i = 0; i < c_len; ++i) {

            if (components[i].length > 0) {

              var newObj = useObj[components[i]];
              useObj = newObj;
              if (useObj === null || useObj === undefined) break;
            }
          }

          //As long as we have an object to use then set the out
          if (useObj !== null && useObj !== undefined) outVal = useObj;

          return (outVal);
        }) : src;
      });

      out = _tokenizer.parse(val).join('');
    } else {
      out = val;
    }

    return (out);
  },

  //Tokenizer
  '_tokenizer': function(tokenizers, doBuild) {

    if (!(this instanceof Bjson._tokenizer))
      return new Bjson._tokenizer(tokenizers, doBuild);

    this.tokenizers = tokenizers.splice ? tokenizers : [tokenizers];
    if (doBuild)
      this.doBuild = doBuild;

    this.parse = function(src) {
      this.src = src;
      this.ended = false;
      this.tokens = [];
      do {
        this.next();
      } while (!this.ended);
      return this.tokens;
    };

    this.build = function(src, real) {
      if (src)
        this.tokens.push(!this.doBuild ? src :
          this.doBuild(src, real, this.tkn)
        );
    };

    this.next = function() {
      var self = this,
        plain;

      self.findMin();
      plain = self.src.slice(0, self.min);

      self.build(plain, false);

      self.src = self.src.slice(self.min).replace(self.tkn, function(all) {
        self.build(all, true);
        return '';
      });

      if (!self.src)
        self.ended = true;
    };

    this.findMin = function() {
      var self = this,
        i = 0,
        tkn, idx;
      self.min = -1;
      self.tkn = '';

      while ((tkn = self.tokenizers[i++]) !== undefined) {
        idx = self.src[tkn.test ? 'search' : 'indexOf'](tkn);
        if (idx != -1 && (self.min == -1 || idx < self.min)) {
          self.tkn = tkn;
          self.min = idx;
        }
      }
      if (self.min == -1)
        self.min = self.src.length;
    };
  }
};


*/
