## JS215 Lesson 2: String and Text Processing



### What to Focus On

### Summary

### Notes

* **String Processing Patterns**

  * What are the general steps we follow to solve a string processing problem?

    1. Declare a new string or array to use as a container for the result.
    2. Break down or parse the original string using lines, sentences, words, chars, delimiters, etc.
       1. Remove any unneeded characters from the text.
    3. Depending on the shape of the problem, apply a suitable list processing strategy.
    4. Combine the individual results into a new string if needed and return.

  * JS has two built-in objects you can use with regex expressions: `String` and `RegExp`.

    * `String` lets you use:

      * `String.prototype.search`
      * `String.prototype.match`
      * `String.prototype.replace`

    * `RegExp` lets you use:

      * `RegExp.prototype.exec`
      * `RegExp.prototype.test`

    * How can we capitalize the first letter of every word in some text?

      * ```javascript
        let text = 'The quick brown fox jumps over the lazy dog.';
        
        function capitalize(text) {
          let textArray = text.split(' ');
          let newTextArray = textArray.map(word => {
            return word[0].toUpperCase() + word.slice(1);
          });
          
          return newTextArray.join(' ');
        }
        
        capitalize(text);
        ```

    * How can we count how often a specific word occurs in some text?

      * ```javascript
        let text = 'The quick brown fox jumps over the lazy dog.';
        
        function countWordInText(word, text) {
          // remove non-alpha chars(case insensitive)/spaces and split to an array
          let textArray = text.replace(/[^a-z ]/ig, '').split(' ');
          
          // filter for words that match `word` and return length of the array
          return textArray.filter(wordInText => {
            return word.toLowerCase() === wordInText.toLowerCase();
          }).length;
        }
        ```

* **String Methods**

* **Regular Expressions**

* **Reverse a String**

* **Acronym**

* **Email Validation**

* **Matching Parentheses**

* **Sentiment Analysis**

* **Mail Count**

* **Longest Sentence**

### Vocab