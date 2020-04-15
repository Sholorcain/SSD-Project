var itemTitle;
var itemID;

function confirmAdd(itemID, itemTitle) {
    this.itemTitle = itemTitle;
    this.itemID = itemID;
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "cart/" + itemID, true);
    xhttp.send();
    //alert(itemTitle + ' was added to your cart.');
    setTimeout(function(){// wait for 5 secs(2)
           location.reload(); // then reload the page.(3)
      }, 1000); 
}

function getCurrentTitle() {
    return itemTitle;
}
