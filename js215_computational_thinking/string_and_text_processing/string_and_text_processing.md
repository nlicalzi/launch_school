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

  * `String.prototype.indexOf()`

    * Return the numeric index of a character or substring of characters within a string.

    * If the search character or substring doesn't exist, return `-1`

    * ```javascript
      let language = 'JavaScript';
      
      language.indexOf('S');		// 4
      language.indexOf('s');		// -1
      language.indexOf('ipt');	// 7
      ```

  * `String.prototype.lastIndexOf()`

    * Return the index of the last occurence of a character or substring.

    * If the search character or substring doesn't exist, return `-1`

    * ```javascript
      let state = 'Mississippi';
      
      state.lastIndexOf('i');		// 10
      state.lastIndexOf('s');		// 6
      state.lastIndexOf('sp');	// -1
      ```

  * `String.prototype.replace()`

    * Perform a substitution operation on the calling string, returning a new string (non-mutating).

    * By default, `replace` substitutes the first occurence of the substring or regex pattern given by the first argument with the value specified by the second argument.

      * ```javascript
        let state = 'Mississippi';
        
        state.replace('s', 'q');	// "Miqsissippi"
        ```

    * To replace every instance of the matching substring/pattern (the character `s`), we must use a regular expression instead of a String (using the `g` or global flag)

      * ```javascript
        let state = 'Mississippi';
        
        state.replace(/s/g, 'q');	// "Miqqiqqippi"
        ```

  * `String.prototype.split()`

    * Split the calling string into an array of strings based on a separator.

      * If a string argument is passed, `split` parses the string by breaking it at each occurence of the separator string.
      * If the seprator string is an empty string, the caller is split into an array of single character strings.

    * ```javascript
      let state = 'Mississippi';
      
      state.split('');	["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]
      state.split('s');	["Mi", "", "i", "", "ippi"]
      '1, 2, 3, 4, 5, 6'.split(', ');	// ["1", "2", "3", "4", "5", "6"]
      ```

  * `String.prototype.substring()`

    * Extract and return a portion of the calling string that lies in the range specified by the two passed numeric arguments. (start and end index).

      * Note: Order doesn't matter because the extracted string starts with the character at the smaller index of the two arguments and ends just before the character at the larger index.

      * ```javascript
        string.substring(a, b) === string.substring(b, a);
        ```

    * ```javascript
      let state = 'Mississippi';
      
      state.substring(6, 3);	// "sis" -- start at state[3], up to (not incl.) state[6]
      ```

  * `String.prototype.[toLowerCase/toUpperCase]()`

    * ```javascript
      let exclamation = "Go team! We're number 1!";
      
      exclamation.toUpperCase();	// "GO TEAM! WE'RE NUMBER 1!"
      exclamation.toLowerCase();	// "go team! we're number 1!"
      ```

* **Regular Expressions**

* **Reverse a String**

* **Acronym**

* **Email Validation**

* **Matching Parentheses**

* **Sentiment Analysis**

* **Mail Count**

* **Longest Sentence**

### Vocab/Concepts

* What is the difference between `String.prototype.substring()` and `String.prototype.substr()`?

  * `String.prototype.substr()` takes two arguments: a starting index and the number of characters after that index to extend to.
  * `String.prototype.substring()` takes two arguments: a starting index and the ending index (non-inclusive).

* Why can't we call `toString()` directly on a number primitive?

  * ```javascript
    let boxNumber = 356.toString();	// Syntax error!
    console.log(boxNumber);					// exception was already raised
    
    // SOLUTION:
    let boxNumber = (356).toString();	// no error, 
    console.log(boxNumber);				// "356"
    ```

  * The JS interpreter reads the period immediately after a number as a decimal point. We can avoid this issue by wrapping the number in parentheses, then calling the method on it.

* 