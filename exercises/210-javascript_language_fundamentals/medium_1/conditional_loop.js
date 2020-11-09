let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

// The code is stuck in an infinite loop, constantly logging '0'
// Line 6 never executes, and i is never incrememented
// If we inserted a new line after line 4 that consisted of "i += 1;" it would work