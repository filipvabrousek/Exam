function E(selector) {
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
  self.val = function() {
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
  self.add2HTML = function(html) {
    self.element.innerHTML += html;

  }
  return self;
};

var btn = E("button");
btn.on("click", function() {
  var inp = E("input").val();
  console.log(Math.sqrt(inp));
});

/*
31/12/16

<input placeholder="Enter a number" type="number"></input>
<button>Show square root</button>
<p></p>
*/
