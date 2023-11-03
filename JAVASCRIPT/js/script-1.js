//Operador Rest
function suma(...values){
    let result = 0;

    values.forEach(function(value) {
        result = result + value;
    });

    return result;
}

console.log(suma(1, 2, 3, 4, 5));

console.log("================================");
//Operador Spread
let b = [1, 2, 3, 4, 5];
let r = [6, 7, 8, 9, 10];
let i = [...b, ...r];

console.log(i);

console.log("================================");
//objeto literal
let person = {
    name: 'Yenku',
    lastname: 'Yooka',
    email: 'yenku@gmail.com',
    age: 20,

    saludar(){
        console.log(`Hola mi nombre es ${this.name}`);
    }
}

person.saludar();

console.log("==================================");
//destructuración de objetos
let {name, lastname, email, age} = person;

console.log(`My name is ${name}`);
console.log(`Last name is ${lastname}`);
console.log(`Email is ${email}`);
console.log(`Age is ${age}`);

let fruits = ["Apple", "Orange", "cherry"];

let [fruit1, fruit2, fruit3] = fruits;

console.log(`Fruits : ${fruit1} - ${fruit2} - ${fruit3}`);