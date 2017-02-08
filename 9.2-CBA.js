   
const filip = {
name: "Filip",
age: 17,
presentation(style, time) {
    if (style === "formal"){
        console.log(`Good ${time} ladies and gentlemen. I am ${this.name} and I am ${this.age} years old.` );
    } else if (style === "friendly"){
        console.log(`Hey whats up ${this.name} ?. I am ${this.age}. Good ${time}`);
    }
}
};

filip.presentation("formal", "morning");

const terka = {
name: "Terezka",
age: 18
};


filip.presentation.call(terka, "friendly", "morning");
filip.presentation.apply(terka, ["formal", "evening"]);
filip.presentation.bind(terka, "formal")("evening");