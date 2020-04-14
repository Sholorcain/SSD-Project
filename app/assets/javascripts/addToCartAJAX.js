function loadDoc(itemID, itemTitle) {

    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "cart/" + itemID, true);
    xhttp.send();
    alert(itemTitle + ' was added to your cart.');
}
