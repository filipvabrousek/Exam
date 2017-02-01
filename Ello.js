const Ello = ((() => {

  const S = e => document.querySelector(e);

  const render = function(type, props) {
    for (var _len = arguments.length, children = Array(_len > 2 ? _len - 2 : 0), _key = 2; _key < _len; _key++) {
      children[_key - 2] = arguments[_key];
    };

    return {
      type,
      props: props || {},
      children
    };

  };

  const setBooleanProp = (target, name, value) => {
    if (value) {
      target.setAttribute(name, value);
      target[name] = true;
    } else {
      target[name] = false;
    }
  };

  /*-----------------------------------------------REMOVE BOOLEAN PROP AND SMALL-------------------------------------*/
  const removeBooleanProp = (target, name) => {
    target.removeAttribute(name);
    target[name] = false;
  };

  const isEventProp = name => /^on/.test(name);

  const extractEventName = name => name.slice(2).toLowerCase();

  const isCustomProp = name => isEventProp(name) || name === 'forceUpdate';

  /*-----------------------------------------------SET PROP-------------------------------------*/
  const setProp = (target, name, value) => {
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
  const removeProp = (target, name, value) => {
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

  const setProps = (target, props) => {
    Object.keys(props).forEach(name => {
      setProp(target, name, props[name]);
    });
  };

  /*-----------------------------------------------UPDATE PROP-------------------------------------*/
  const updateProp = (target, name, newVal, oldVal) => {
    if (!newVal) {
      removeProp(target, name, oldVal);
    } else if (!oldVal || newVal !== oldVal) {
      setProp(target, name, newVal);
    }
  };

  /*-----------------------------------------------UPDATE PROPS-------------------------------------*/
  const updateProps = function(target, newProps) {
    const oldProps = arguments.length <= 2 || arguments[2] === undefined ? {} : arguments[2];
    const props = Object.assign({}, newProps, oldProps);
    Object.keys(props).forEach(name => {
      updateProp(target, name, newProps[name], oldProps[name]);
    });
  };

  const addEventListeners = (target, props) => {
    Object.keys(props).forEach(name => {
      if (isEventProp(name)) {
        target.addEventListener(extractEventName(name), props[name]);
      }
    });
  };

  /*-----------------------------------------------CREATE ELEMENT-------------------------------------*/
  const createElement = node => {
    if (typeof node === 'string') {
      return document.createTextNode(node);
    }
    const el = document.createElement(node.type);
    setProps(el, node.props);
    addEventListeners(el, node.props);
    node.children.map(createElement).forEach(el.appendChild.bind(el));
    return el;
  };

  /*-----------------------------------------------CHANGED-------------------------------------*/
  const changed = (node1, node2) => (typeof node1 === 'undefined' ? 'undefined' : _typeof(node1)) !== (typeof node2 === 'undefined' ? 'undefined' : _typeof(node2)) || typeof node1 === 'string' && node1 !== node2 || node1.type !== node2.type || node1.props && node1.props.forceUpdate;

  /*-----------------------------------------------UPDATE ELEMENT-------------------------------------*/
  /*-----------------------------------------------UPDATE ELEMENT-------------------------------------*/
  function updateElement(parent, newNode, oldNode) {
    const index = arguments.length <= 3 || arguments[3] === undefined ? 0 : arguments[3];
    if (!oldNode) {
      parent.appendChild(createElement(newNode));
    } else if (!newNode) {
      parent.removeChild(parent.childNodes[index]);
    } else if (changed(newNode, oldNode)) {
      parent.replaceChild(createElement(newNode), parent.childNodes[index]);

    } else if (newNode.type) {
      updateProps(parent.childNodes[index], newNode.props, oldNode.props);

      const newLength = newNode.children.length;
      const oldLength = oldNode.children.length;
      for (let i = 0; i < newLength || i < oldLength; i++) {
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
    S,
    render,
    removeBooleanProp,
    isEventProp,
    extractEventName,
    isCustomProp,
    setProp,
    removeProp,
    setProps,
    updateProp,
    updateProps,
    addEventListeners,
    createElement,
    changed,
    updateElement
  };

}))();

/*-----------------------------------------------CUSTOM-------------------------------------*/

const el = Ello.render('h2', {
    className: 'title',
    onClick: function onClick() {
      this.style.color = "green";
    }
  },
  'Hello world! Click to change color.');

const root = Ello.S('#container');
const reload = Ello.S('#reload');

Ello.updateElement(root, el);

reload.addEventListener('click', () => {
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
*/












/*ELLO DOM MANIPULATING LIBRARY UNCOMENT AND COPY TO A NEW FILE!

function E(selector) {
  const self = {};
  self.selector = selector;
  self.element = document.querySelector(self.selector);
  //HIDE and SHOW functions
  self.show = () => {
    self.element.style.display = "block";
  }
  self.hide = () => {
      self.element.style.display = "none";
    }
    //ADDCLASS and REMOVECLASS
  self.addClass = className => {
    self.element.classList.add(className);
  }
  self.removeClass = className => {
      self.element.classList.remove(className)
    }
    //WIDTH and HEIGHT functions
  self.height = () => self.element.offsetHeight

  self.width = () => self.element.offsetWidth
    //text function - RETURNS!! ONLY text value
  self.text = () => self.element.innerText
    //html function - RETURNS!! html value
  self.html = () => self.element.innerHTML
  self.val = () => self.element.value
    //ATTR function
  self.attr = (name, value) => {
      if (!value) return self.element.getAttribute(name)
      self.element.setAttribute(name, value);
      return self;
    }
    //ON function
  self.on = (type, callback) => {
    self.element[`on${type}`] = callback;
    return self;
  }

  //RENDER function
  self.add2HTML = html => {
    self.element.innerHTML += html;

  }
  return self;
};

const name = "your-name-here";
const btn = E("button");
btn.on("click", () => {
  console.log("Hello " + name + "! ");
});




*/

/*
ELLO DOM EXAMPLE:
<button>Log greeting into console</button>

*/

/*
Updated: 1/2/17
*/
