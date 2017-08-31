
function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
}

function isSubstring(searchString, subString) {
  let words = searchString.split(' ');
  return words.includes(subString);
}

function fizzbuzz(arr) {

  let results = [];

  arr.forEach(function(num) {
    if(num % 3 === 0 && num % 5 == 0) {
      continue;
    } else if(num % 3 === 0 || num % 5 == 0) {
      results.push(num);
    }
  });
  return results
}


function sumOfPrimes(n) {
  let sum = 0;
  let num = 2
  for(let i = 0; i < n; i++) {
    if (isPrime(num)) {
      sum += num;
    }
  }
  return sum
}





function isPrime(num) {
  if (num === 2) {
    return true;
  } else if (num <= 1) {
    return false;
  } else {
    for(let i = 2; i < num; i++) {
      if (num % i === 0) {
        return false;
      }
    }
    return true;
  }
}
