var itemTitle;
var itemID;

function confirmAdd(itemID, itemTitle) {
    this.itemTitle = itemTitle;
    this.itemID = itemID;
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "cart/" + itemID, true);
    xhttp.send();
    //alert(itemTitle + ' was added to your cart.');
}

function getCurrentTitle() {
    return itemTitle;
}
