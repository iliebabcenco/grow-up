
const coll = document.getElementsByClassName("collapsible");
console.log(coll.length)

Array.prototype.forEach.call(coll, (btn) => {
    
    btn.onclick = () => {
        btn.classList.toggle("active");
        let content = btn.nextElementSibling;
        if (content.style.maxHeight) {
            content.style.maxHeight = null;
        } else {
            content.style.maxHeight = content.scrollHeight + "px";
        }
    };
})

