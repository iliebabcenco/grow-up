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

function validateForm() {
    let validate = true;
    document.getElementById("alerting").style.display = 'block';
    var name, surename, idnp, dataNasterii, buliden, domiciliu, suma, term;
    name = document.getElementsByName("name")[0].value;
    surename = document.getElementsByName("surename")[0].value;
    idnp = document.getElementsByName("idnp")[0].value;
    dataNasterii = document.getElementsByName("dataNasterii")[0].value;
    buliden = document.getElementsByName("buliden")[0].value;
    domiciliu = document.getElementsByName("domiciliu")[0].value;
    suma = document.getElementsByName("suma")[0].value;
    term = document.getElementsByName("term")[0].value;
    phone = document.getElementsByName("phone")[0].value;
    document.getElementById("alerting").style.color = 'red';
    validate = true;
    if (phone === "") {
        text = "Introduceți telefonul mobil conform cerintelor";
        validate = false;
    }
    if (term === "") {
        text = "Introduceți termenul";
        validate = false;
    }
    if (suma === "") {
        text = "Introduceți suma";
        validate = false;
    }
    if (domiciliu === "") {
        text = "Introduceți seria și numărul buletinului de identitate";
        validate = false;
    }
    if (buliden === "") {
        text = "Introduceți seria și numărul buletinului de identitate";
        validate = false;
    }
    if (dataNasterii === "") {
        text = "Introduceți data nașterii";
        validate = false;
    } else if (new Date(dataNasterii) < new Date('01/01/1960') || new Date(dataNasterii) > new Date('01/01/2000')) {
        if (new Date(dataNasterii) < new Date('01/01/1960'))
            text = "Cu părere de rău nu acordăm credite pensionarilor";
        else if (new Date(dataNasterii) > new Date('01/01/2000'))
            text = "Cu părere de rău nu ați atins vârsta eligibilă pentru a beneficia de credit";
        validate = false;
    }
    if (idnp.length !== 13 || isNaN(idnp) || idnp === "") {
        text = "Introduceți IDNP format din 13 cifre";
        validate = false;
    }
    if (surename === "" || surename.length < 2) {
        text = "Introduceți prenumele";
        validate = false;
    }
    if (name === "" || name.length < 2) {
        text = "Introduceți numele";
        validate = false;
    }
    document.getElementById("alerting").innerHTML = text;
    return validate;
}

const clickNavMenu = () => {
    const logoHref = document.getElementById("logohref");
    const navPart = document.querySelector('.nav-part');
    if (navPart.style.display === 'flex') {
        navPart.style.display = 'none'
    } else {
        navPart.style.display = 'flex'
    }
}

