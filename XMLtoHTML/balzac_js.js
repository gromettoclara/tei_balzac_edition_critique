document.addEventListener('DOMContentLoaded', function() {
const textContainers1 = document.getElementById('text1').querySelectorAll('span.var');
const textContainers2 = document.getElementById('text2').querySelectorAll('span.var');

//parser le DOM et sélectionner les éléments "span" de la class "var" qui sont dans les div avec l'id "text1" et "text2"

function addHighlight(index) {
textContainers1[index].classList.add('highlight');
textContainers2[index].classList.add('highlight');
}

//définition de la fonction pour ajouter le surlignage sur les éléments : ajoute la classe highlight aux élément

function removeHighlight(index) {
textContainers1[index].classList.remove('highlight');
textContainers2[index].classList.remove('highlight');
}

//définition de la fonction pour supprimer le surlignage sur les éléments : supprime la classe highlighht des éléments

textContainers1.forEach((paragraph1, index) => {
paragraph1.addEventListener('mouseover', () => {
  if (textContainers2[index].innerHTML.trim() === '' || textContainers1[index].innerHTML.trim() === '') {
    textContainers1[index].classList.add('highlight-empty');
    textContainers2[index].classList.add('highlight-empty');
  }
  addHighlight(index);
});

//dans le container text1, pour chaque span, au mouseover, ajout du surlignage (classe définie dans le css) + aussi dans la span de même index du text2
// ajout d'une condition : si une des span est vide : ajout d'une autre couleur de surlignage (classe définie dans le css)
// dans ce cas, la variante est considérée comme un ajour et non une modification. Pour la marquer comme telle on utilise une nouvelle couleur de surlignage.
// chaque ajout correspond à une span vide de même index, qui ne sera donc pas visible. Au mouseover on verra l'évènement dans le texte parcouru par la souris.

paragraph1.addEventListener('mouseout', () => {
  removeHighlight(index);
  textContainers2[index].classList.remove('highlight-empty');
});
});

//Lorsque la sourie quitte l'élément : les classe se retire, la couleur avec.

// ci-dessous même opérations que dans le premier texte mais pour le deuxième.
// au mouseover, ajout de la classe highlight dans les deux texte sur les span de même index
// condition si une des deux span de même index est vide (ajout de la classe highlight-empty)
// la souris qui l'élément = retirer les classes et les surlignages

textContainers2.forEach((paragraph2, index) => {
paragraph2.addEventListener('mouseover', () => {
  if (textContainers2[index].innerHTML.trim() === '' || textContainers1[index].innerHTML.trim() === '') {
    textContainers1[index].classList.add('highlight-empty');
    textContainers2[index].classList.add('highlight-empty');
  }
  addHighlight(index);
});



paragraph2.addEventListener('mouseout', () => {
  removeHighlight(index);
  textContainers1[index].classList.remove('highlight-empty');
});
});
});
