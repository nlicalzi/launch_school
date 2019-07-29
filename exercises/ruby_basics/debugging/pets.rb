# Pets, Debugging, Ruby Basics, Exercises

pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] = 'bowser' # Switching the `=` here to `<<` will add bowser to the array

p pets

# pets[:dog] = 'bowser' is overwriting the existing array, when we want to append instead
