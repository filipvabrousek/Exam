var Ello = (function() {

  var S = function(e) {
    return document.querySelector(e);
  };

  var render = function(type, props) {
    for (var _len = arguments.length, children = Array(_len > 2 ? _len - 2 : 0), _key = 2; _key < _len; _key++) {
      children[_key - 2] = arguments[_key];
    };

    return {
      type: type,
      props: props || {},
      children: children
    };

  };

  var setBooleanProp = function(target, name, value) {
    if (value) {
      target.setAttribute(name, value);
      target[name] = true;
    } else {
      target[name] = false;
    }
  };

  /*-----------------------------------------------REMOVE BOOLEAN PROP AND SMALL-------------------------------------*/
  var removeBooleanProp = function(target, name) {
    target.removeAttribute(name);
    target[name] = false;
  };

  var isEventProp = function(name) {
    return /^on/.test(name);
  };

  var extractEventName = function(name) {
    return name.slice(2).toLowerCase();
  };

  var isCustomProp = function(name) {
    return isEventProp(name) || name === 'forceUpdate';
  };

  /*-----------------------------------------------SET PROP-------------------------------------*/
  var setProp = function(target, name, value) {
    if (isCustomProp(name)) {
      return;
    } else if (name === 'className') {
      target.setAttribute('class', value);
    } else if (typeof value === 'boolean') {
      setBooleanProp(target, name, value);
    } else {
      target.setAttribute(name, value);
    }
  };

  /*-----------------------------------------------REMOVE PROP-------------------------------------*/
  var removeProp = function(target, name, value) {
    if (isCustomProp(name)) {
      return;
    } else if (name === 'className') {
      target.removeAttribute('class');
    } else if (typeof value === 'boolean') {
      removeBooleanProp(target, name);
    } else {
      target.removeAttribute(name);
    }
  };

  var setProps = function(target, props) {
    Object.keys(props).forEach(function(name) {
      setProp(target, name, props[name]);
    });
  };

  /*-----------------------------------------------UPDATE PROP-------------------------------------*/
  var updateProp = function(target, name, newVal, oldVal) {
    if (!newVal) {
      removeProp(target, name, oldVal);
    } else if (!oldVal || newVal !== oldVal) {
      setProp(target, name, newVal);
    }
  };

  /*-----------------------------------------------UPDATE PROPS-------------------------------------*/
  var updateProps = function(target, newProps) {
    var oldProps = arguments.length <= 2 || arguments[2] === undefined ? {} : arguments[2];
    var props = Object.assign({}, newProps, oldProps);
    Object.keys(props).forEach(function(name) {
      updateProp(target, name, newProps[name], oldProps[name]);
    });
  };

  var addEventListeners = function(target, props) {
    Object.keys(props).forEach(function(name) {
      if (isEventProp(name)) {
        target.addEventListener(extractEventName(name), props[name]);
      }
    });
  };

  /*-----------------------------------------------CREATE ELEMENT-------------------------------------*/
  var createElement = function(node) {
    if (typeof node === 'string') {
      return document.createTextNode(node);
    }
    var el = document.createElement(node.type);
    setProps(el, node.props);
    addEventListeners(el, node.props);
    node.children.map(createElement).forEach(el.appendChild.bind(el));
    return el;
  };

  /*-----------------------------------------------CHANGED-------------------------------------*/
  var changed = function(node1, node2) {
    return (typeof node1 === 'undefined' ? 'undefined' : _typeof(node1)) !== (typeof node2 === 'undefined' ? 'undefined' : _typeof(node2)) || typeof node1 === 'string' && node1 !== node2 || node1.type !== node2.type || node1.props && node1.props.forceUpdate;
  };

  /*-----------------------------------------------UPDATE ELEMENT-------------------------------------*/
  /*-----------------------------------------------UPDATE ELEMENT-------------------------------------*/
  function updateElement(parent, newNode, oldNode) {
    var index = arguments.length <= 3 || arguments[3] === undefined ? 0 : arguments[3];
    if (!oldNode) {
      parent.appendChild(createElement(newNode));
    } else if (!newNode) {
      parent.removeChild(parent.childNodes[index]);
    } else if (changed(newNode, oldNode)) {
      parent.replaceChild(createElement(newNode), parent.childNodes[index]);

    } else if (newNode.type) {
      updateProps(parent.childNodes[index], newNode.props, oldNode.props);

      var newLength = newNode.children.length;
      var oldLength = oldNode.children.length;
      for (var i = 0; i < newLength || i < oldLength; i++) {
        if (window.CP.shouldStopExecution(2)) {
          break;
        }

        updateElement(parent.childNodes[index], newNode.children[i], oldNode.children[i], i);
      }
    }
    console.log("Element updated!");
  };

  /*MAKE ACCESSIBLE FROM OUTER SCOPE*/
  return {
    S: S,
    render: render,
    removeBooleanProp: removeBooleanProp,
    isEventProp: isEventProp,
    extractEventName: extractEventName,
    isCustomProp: isCustomProp,
    setProp: setProp,
    removeProp: removeProp,
    setProps: setProps,
    updateProp: updateProp,
    updateProps: updateProps,
    addEventListeners: addEventListeners,
    createElement: createElement,
    changed: changed,
    updateElement: updateElement
  };

})();

/*-----------------------------------------------CUSTOM-------------------------------------*/



const el = Ello.render('h2', {
    className: 'title',
    onClick: function onClick() {
      this.style.color = "green";
    }
  },
  'Hello world! Click to change color.');

var root = Ello.S('#container');
var reload = Ello.S('#reload');

Ello.updateElement(root, el);

reload.addEventListener('click', function() {
  Ello.updateElement(root, el);
});

/*
<div id="container">
  <!---This will be managed by Elly--->
</div>
<button id="reload"> + </button>
*/

/*
* {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
}


.title {
  padding: 0.5em;
}


button {
  background: none;
  padding: 10px;
  border: none;
  color: #1abc9c;
  font-size: 1.6em;
}
26.12.2016 - 17:58
*/












/*ELLO DOM MANIPULATING LIBRARY UNCOMENT AND COPY TO A NEW FILE!

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







*/

/*
ELLO DOM EXAMPLE:

HTML:
<input placeholder="Enter a number" type="number"></input>
<button>Show square root</button>


CSS:
var btn = E("button");
btn.on("click", function() {
var inp = E("input").val();
console.log(Math.sqrt(inp));
});





*/
