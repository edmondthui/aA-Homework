const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function teaAndBiscuits() {

    let first_answer, second_answer;

    reader.question('Would you like some tea? ', function(answer1){
        first_answer = answer1
        console.log(`You replied ${first_answer}.`);
        reader.question('Would you like some biscuits? ', function(answer2){
            second_answer = answer2
            console.log(`You replied ${second_answer}.`);
            const firstRes = (first_answer === 'yes') ? 'do' : 'don\'t';
            const secondRes = (second_answer === 'yes') ? 'do' : 'don\'t';
            console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
            reader.close();
        });
    });



}

teaAndBiscuits();