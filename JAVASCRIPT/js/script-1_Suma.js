function suma(...values){
    let result = 0;

    values.forEach(function(value) {
        result = result + value;
    });

    return result;
}

console.log(suma(1, 2, 3, 4, 5));