function B(c){var a={};a.selector=c;a.element=document.querySelector(a.selector);a.show=function(){a.element.style.display="block"};a.hide=function(){a.element.style.display="none"};a.addClass=function(b){a.element.classList.add(b)};a.removeClass=function(b){a.element.classList.remove(b)};a.height=function(){return a.element.offsetHeight};a.width=function(){return a.element.offsetWidth};a.text=function(){return a.element.innerText};a.html=function(){return a.element.innerHTML};a.val=function(){return a.element.value};
a.attr=function(b,c){if(!c)return a.element.getAttribute(b);a.element.setAttribute(b,c);return a};a.on=function(b,c){a.element["on"+b]=c;return a};a.RENDER=function(b){a.element.innerHTML+=b};return a}
var BRender=function(c,a){for(var b=/<%([^%>]+)?%>/g,h=/(^( )?(if|for|else|switch|case|break|{|}))(.*)?/g,e="var r=[];\n",f=0,d,g=function(a,b){b?e+=a.match(h)?a+"\n":"r.push("+a+");\n":e+=""!=a?'r.push("'+a.replace(/"/g,'\\"')+'");\n':"";return g};d=b.exec(c);)g(c.slice(f,d.index))(d[1],!0),f=d.index+d[0].length;g(c.substr(f,c.length-f));e+='return r.join("");';return(new Function(e.replace(/[\r\t\n]/g,""))).apply(a)},template="<h1>Fruits</h1><%if(this.show) {%><%for(var index in this.fruits) {%><h2><%this.fruits[index]%></h2><%}%><%} else {%><p>Content of the template is hidden, set <b>show</b> property to <b>true</b></p><%}%>";

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
  
  
  //RENDER ENGINE
  var BRender = function(html, options) {
  var re = /<%([^%>]+)?%>/g,
    reExp = /(^( )?(if|for|else|switch|case|break|{|}))(.*)?/g,
    code = 'var r=[];\n',
    cursor = 0,
    match;
  
  //ADD FUNCTION---------------------------------------------------
  var add = function(line, js) {
    js ? (code += line.match(reExp) ? line + '\n' : 'r.push(' + line + ');\n') :
      (code += line != '' ? 'r.push("' + line.replace(/"/g, '\\"') + '");\n' : '');
    return add;
  }
  
  while (match = re.exec(html)) {
    add(html.slice(cursor, match.index))(match[1], true);
    cursor = match.index + match[0].length;
  }
  
  //ADD THE CODE add() FUNCTION IS CALLED------------------------------------------
  add(html.substr(cursor, html.length - cursor));
  code += 'return r.join("");';
  return new Function(code.replace(/[\r\t\n]/g, '')).apply(options);
}

//DEFINE TEMPLATE------------------------------------------------
var template =
  '<h1>Fruits</h1>' +
  '<%if(this.show) {%>' +
  '<%for(var index in this.fruits) {%>' +
  '<h2><%this.fruits[index]%></h2>' +
  '<%}%>' +
  '<%} else {%>' +
  '<p>Content of the template is hidden, set <b>show</b> property to <b>true</b></p>' +
  '<%}%>';

//SHOW OUTPUT----------------------------------------------------
document.querySelector(".demo").innerHTML = BRender(template, {
  fruits: ["Orange", "Mango", "Pineapple"],
  show: true
});




*/
