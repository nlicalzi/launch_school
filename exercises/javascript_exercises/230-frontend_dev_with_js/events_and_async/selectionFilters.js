const classToAnimals = {
  'Vertebrate': ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrict'],
  'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
  'Cold-blooded': ['Salmon', 'Turtle'],
  'Mammal': ['Bear', 'Whale'],
  'Bird': ['Ostrich']
}

const animalToClasses = {
  'Bear': ['Vertebrate', 'Warm-blooded', 'Mammal'],
  'Turtle': ['Vertebrate', 'Cold-blooded'],
  'Whale': ['Vertebrate', 'Warm-blooded', 'Mammal'],
  'Salmon': ['Vertebrate', 'Cold-blooded'],
  'Ostrich': ['Vertebrate', 'Warm-blooded', 'Bird']
}

let classSelector  = document.querySelector('#animal-classifications');
let animalSelector = document.querySelector('#animals');
let clearButton    = document.querySelector('#clear');

document.addEventListener('DOMContentLoaded', () => {
  classSelector.addEventListener('input', e => {
    let selection = e.target.value;
    removeAllOptions(animalSelector);
    addOptions(animalSelector, classToAnimals[selection]);
  });

  animalSelector.addEventListener('input', e => {
    let selection = e.target.value;
    removeAllOptions(classSelector);
    addOptions(classSelector, animalToClasses[selection]);
  });
  
  clearButton.addEventListener('click', e => {
    e.preventDefault();
        
    removeAllOptions(classSelector);
    classSelector.add(new Option('Classifications', 'Classifications'));
    addOptions(classSelector, Object.keys(classToAnimals));
    
    removeAllOptions(animalSelector);
    animalSelector.add(new Option('Animals', 'Animals'));
    addOptions(animalSelector, Object.keys(animalToClasses));
  });
});

function addOptions(el, options) {
  options.forEach(opt => {
    let option = new Option(opt, opt);
    el.add(option);
  });
}

function removeAllOptions(selectElement) {
  while (selectElement.options.length > 0) {
    selectElement.remove(0);
  }
}