function B(e){var t={};return t.selector=e,t.element=document.querySelector(t.selector),t.show=function(){t.element.style.display="block"},t.hide=function(){t.element.style.display="none"},t.addClass=function(e){t.element.classList.add(e)},t.removeClass=function(e){t.element.classList.remove(e)},t.height=function(){return t.element.offsetHeight},t.width=function(){return t.element.offsetWidth},t.text=function(){return t.element.innerText},t.html=function(){return t.element.innerHTML},t.val=function(){return t.element.value},t.attr=function(e,n){return n?(t.element.setAttribute(e,n),t):t.element.getAttribute(e)},t.on=function(e,n){return t.element["on"+e]=n,t},t}
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

 B(".b").on("dblclick", function() {
    alert("It works");
  });



*/

/*
UNCOMPILED CODE :D

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
    return self;

  }
}



*/
