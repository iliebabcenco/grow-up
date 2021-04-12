function updateTextInput(val) {
    var termen = document.getElementById('myTermField').value;
    document.getElementById('mySumField').value = val + ' MDL';
    document.getElementById('solicitareSum').innerHTML = val + ' MDL';
    document.getElementById('rambursareSum').innerHTML = (Number(val / parseInt(termen)) + ((Number(val * 0.10 * parseInt(termen) / 12))) / parseInt(termen)).toFixed(0) + ' MDL';
    document.getElementById('solicitareCost').innerHTML = (val * 0.10 * parseInt(termen) / 12).toFixed(0) + ' MDL';
    document.getElementById('solicitareRambursare').innerHTML = (Number(val) + Number((val * 0.10 * parseInt(termen)) / 12)).toFixed(0) + ' MDL';
}
function updateRangeInput(val) {
    document.getElementById('mySumRange').value = val;
    document.getElementById('solicitareSum').innerHTML = val + ' MDL';
    var termen = document.getElementById('myTermField').value;
    document.getElementById('solicitareSum').innerHTML = val + ' MDL';
    document.getElementById('rambursareSum').innerHTML = (Number(val / parseInt(termen)) + ((Number(val * 0.10 * parseInt(termen) / 12))) / parseInt(termen)).toFixed(0) + ' MDL';
    document.getElementById('solicitareCost').innerHTML = (val * 0.10 * parseInt(termen) / 12).toFixed(0) + ' MDL';
    document.getElementById('solicitareRambursare').innerHTML = (Number(val) + Number((val * 0.10 * parseInt(termen)) / 12)).toFixed(0) + ' MDL';
}
function updateTextTermInput(val) {
    if (val == 1) {
        document.getElementById('myTermField').value = val + ' lună';
    } else {
        document.getElementById('myTermField').value = val + ' luni';
    }
    var suma = document.getElementById('mySumField').value;
    document.getElementById('solicitareSum').innerHTML = suma;
    document.getElementById('rambursareSum').innerHTML = (Number(parseInt(suma) / parseInt(val)) + ((Number(parseInt(suma) * 0.10 * parseInt(val) / 12))) / parseInt(val)).toFixed(0) + ' MDL';
    document.getElementById('solicitareCost').innerHTML = (parseInt(suma) * 0.10 * parseInt(val) / 12).toFixed(0) + ' MDL';
    document.getElementById('solicitareRambursare').innerHTML = (Number(parseInt(suma)) + Number((parseInt(suma) * 0.10 * parseInt(val)) / 12)).toFixed(0) + ' MDL';

}
function updateRangeTermInput(val) {
    document.getElementById('myTermRange').value = val;
    var suma = document.getElementById('mySumField').value;
    document.getElementById('solicitareSum').innerHTML = suma;
    document.getElementById('rambursareSum').innerHTML = (Number(parseInt(suma) / parseInt(val)) + ((Number(parseInt(suma) * 0.10 * parseInt(val) / 12))) / parseInt(val)).toFixed(0) + ' MDL';
    document.getElementById('solicitareCost').innerHTML = (parseInt(suma) * 0.10 * parseInt(val) / 12).toFixed(0) + ' MDL';
    document.getElementById('solicitareRambursare').innerHTML = (Number(parseInt(suma)) + Number((parseInt(suma) * 0.10 * parseInt(val)) / 12)).toFixed(0) + ' MDL';

}

var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.maxHeight) {
            content.style.maxHeight = null;
        } else {
            content.style.maxHeight = content.scrollHeight + "px";
        }
    });
}
function GoToHomePage()
{
    window.location = '/GrowUpProject';
}





