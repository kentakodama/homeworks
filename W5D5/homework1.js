


window.setTimeout(function() {
  alert('HAMMERTIME');
}, 2000);




function hammerTime(time) {

  window.setTimeout(function() {
    alert(`${time} is hammertime!`);
  }, time);

}





const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("Do you want some tea?", function (response) {
  console.log(`You replied ${response}.`);
});

reader.question("Do you want some biscuits?", function (response) {
  console.log(`You replied ${response}.`);
});

// correct version here from solution 
function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits?', function (res2) {
      console.log(`You replied ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}
