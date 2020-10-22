
let longText = 'Four score and seven years ago our fathers brought forth' +
' on this continent a new nation, conceived in liberty, and' +
' dedicated to the proposition that all men are created' +
' equal.' +
' Now we are engaged in a great civil war, testing whether' +
' that nation, or any nation so conceived and so dedicated,' +
' can long endure. We are met on a great battlefield of that' +
' war. We have come to dedicate a portion of that field, as' +
' a final resting place for those who here gave their lives' +
' that that nation might live. It is altogether fitting and' +
' proper that we should do this.' +
' But, in a larger sense, we can not dedicate, we can not' +
' consecrate, we can not hallow this ground. The brave' +
' men, living and dead, who struggled here, have' +
' consecrated it, far above our poor power to add or' +
' detract. The world will little note, nor long remember' +
' what we say here, but it can never forget what they' +
' did here. It is for us the living, rather, to be dedicated' +
' here to the unfinished work which they who fought' +
' here have thus far so nobly advanced.'
+ ' It is rather for' +
' us to be here dedicated to the great task remaining' +
' before us -- that from these honored dead we take' +
' increased devotion to that cause for which they gave' +
' the last full measure of devotion -- that we here highly' +
' resolve that these dead shall not have died in vain' +
' -- that this nation, under God, shall have a new birth' +
' of freedom -- and that government of the people, by' +
' the people, for the people, shall not perish from the' +
' earth.';

function longestSentence(text) {
  let sentences = doublePunctuation(text) // double all punctuation present in the string
                    .split(/[.!?] /g)     // split array on punctuation mark and a space
                    .map(sentence => {    // map elements with repeated punctuation (final el) to sliced form
                      return endsWithRepeatedPunctuation(sentence) ? sentence.slice(0, -1) : sentence;
                    });

  const longest = (previousString, string) => (string.length > previousString.length) ? string : previousString;
  let longestString = sentences.reduce(longest); 

  console.log(longestString);
  console.log(`\nThe longest sentence has ${longestString.split(' ').length} words.`);
}

function doublePunctuation(text) {
  return text.replace(/[.?!]/g, '$&$&');  // the second arg returns the matched text ($&) twice
}

function endsWithRepeatedPunctuation(text) {
  let finalChars = text.slice(-2).split('');
  return finalChars.every(char => (/[.!?]/g).test(char));
}

longestSentence(longText);