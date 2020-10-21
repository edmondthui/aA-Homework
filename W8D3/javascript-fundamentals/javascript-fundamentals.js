const madLib = (arg1, arg2, arg3) => {
    console.log(`We shall ${arg1.toUpperCase()} the ${arg2.toUpperCase()} ${arg3.toUpperCase()}`);
}

madLib('make', 'best', 'guac');

const isSubstring = (substring, string) => {
    console.log(substring.includes(string));
}

isSubstring("time to program", "time")
isSubstring("Jump for joy", "joys")

const fizzBuzz = (array) => {
    const fizzBuzzArr = [];
    array.forEach(function(num) {
        if (((num % 3 === 0 ) || (num % 5 === 0)) && !((num % 3 === 0) && (num % 5 === 0)))
            fizzBuzzArr.push(num);
    });
    console.log(fizzBuzzArr);
}

fizzBuzz([1,2,3,4,5,6,7,8,9,10,15])

const isPrime = (number) => {
    if (number < 2) { return false }

    for (let i = 2; i < number; i++ ) {
        if (number % i === 0)
            return false
    }
    return true
}

console.log(isPrime(3))

const sumOfNPrimes = (num) => {
    let sum = 0
    let count = 0
    let i = 2
    while (count < num) {
        if (isPrime(i)) {
            sum += i
            count += 1
        }
        i++
    }
    return sum
}

console.log(sumOfNPrimes(1))