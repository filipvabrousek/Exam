​class Person{
    constructor(name, born){
         
        this.name = name;
        this.born = born;
      
    }
    
    getAge(){
        return 2017 - this.born;
    }
}

var me = new Person("Filip", 17);
console.log(me.getAge());
